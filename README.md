# General Serial LCD Operation
After building a serial to parallel converter, and then owning a couple different I2C kinds I felt I wanted to have my own library that could work consistently across all devices. And not have to install and manage many different but seemingly mostly similar libraries with a little bit of specific modification for that device.

Currently I work with Arduino, Arduino Pro Mini, ATTiny, and Atmega AVR devices. Though probably some of this is portable or reusable with other microcontrollers.

For me, this is what C++ classes and Object Oriented Programming is meant to do.
![LCD Class Structure](doc/LCD_class_structure.png)

## Approach
I would like the same software interface (using a display buffer), but to support the specific LCD backend technology.

Starting with what is in the Arduino standard community LiquidCrystal library an implementation specific to each hardware was created.
If there are any specific messaging needed, this would have to be put into virtual functions and implemented by each class.

I chose to not subclass the Arduino LiquidCrystal class, since it has a bunch of fields that only make sense if you are parallel mode. Though we ended up having all the functions that were in the LiquidCrystal class, plus additional ones we use for backlight, and power state controls.

## Supported Devices and modes
* 4 bit parallel interface (e.g. an Arduino keypad LCD shield)
* Adafruit I2C LCD backpack (both the I2C and SPI modes)
* PCF8574 based I2C to parallel devices, like Ali Express I2C LCD backpacks.
* My own 74HC595 based serial to parallel interface hardware, that was originally the purpose of this project.

## License
* Some of the Adafruit LCD backpack code was inspired from their Adafruit LiquidCrystal project, they use the BSD license.
* Works that are original to this project here are licensed under the GNU Lesser General Public License, v3.

# Some LCD Theory
If you ever wanted to understand some of the history, The Hitachi HD44780 controller no longer exists anymore, but there are many compatible following devices.
There are a lot of references everywhere. I recommend taking some time to read up on them, as many people have done a much better job at their documentation than I would. Though it is good to know a bit of things as they apply to what we are doing here.

How to drive a LCD using a Serial to parallel adapter

* Using the 4 bit mode of the standard HD44780 type LCD controller.
* RS pin (register select)
* E pin (enable)
* Variable resistor to adjust contrast.
* Backlight control pin. Optional variable resistor to adjust brightness.
* Power pin

Which is a lot less pins than just using the pins on the device.

There is an initialization chatter that we need to do to set up the display.

This hardware does support a read mode, but we will only consider using it in write-only mode. There is not a compelling need to read from the LCD in our use.


## Operation

All we want to do here is write bits to the LCD.

Where we do this, according to the data sheet,
* Load the value of the data onto the data pins.
* LCD_E is LOW by default. We strobe it to HIGH to make read/write operations. The effect is applied on the *falling* edge of E signal.
* LCD RS is LOW for command operation, HIGH for data operation.

![lcd write sequence](doc/lcd_write_timing.png)

(Wavedrom source for image above)
```
{signal: [
  {name: 'RS', wave: 'x2...x'},
  {name: 'R/W', wave: '20...2'},
  {name: 'E', wave: '0.1.0.'},
  {name: 'DB7-0', wave: '2..2.2', data: ['','Valid Data']}
]}
```

Where for 4 bit operation,
* Load the upper nibble of the data or command byte to the [D4..D7] pins.
* Strobe `E` pin.
* Load the lower nibble of the data or command byte to the [D4..D7] pins.
* Strobe 'E' pin.


### A note about 8 bit parallel mode
Here we are using the 4 bit parallel mode, because it requires fewer pins from the shift register. We require at least of 2 control pins, so if we used 8 bit data mode we would need 2 shift registers to get at least 10 bits.

But when we operate the display in 8 bit mode we just send out the value on the 8 pins and strobe `E` once. So there is perhaps a compelling reason to use 8 bit mode if we wanted to save some timing requirements.

Typically the LCD display will have a hysteresis effect, so updating or moving characters faster than a certain rate will only create a blurrly looking image anyway.

## History
While learning and figuring things out, I found the following other LCD library for Arduino works to be helpful.

* Adafruit LCD backpack, driven by MCP23008: [Adafruit_LiquidCrystal](https://github.com/adafruit/Adafruit_LiquidCrystal)
  * This extends the Arduino community [LiquidCrystal library](https://github.com/arduino-libraries/LiquidCrystal/blob/master/src/LiquidCrystal.h) ([doc](https://www.arduino.cc/en/Reference/LiquidCrystal))
  * Kind of not sure why they did not just subclass the LiquidCrystal one. They just added a couple functions. But left the parallel operation things, which are never going to be used in this mode.
* Generic LCD backpack, driven by PCF8574: "I2C LCD1602/2004 Adapter Plate" from Ali Express.
  * Another library here: [LiquidCrystal_PCF8574](https://github.com/mathertel/LiquidCrystal_PCF8574)


# Hardware Implementations
Here are a few methods that are currently supported by this library.

## LCD driven by a 74HC595

This was inspired by those I2C or SPI LCD backpacks from Adafruit.
And the reason this project here exists.

![schematic](doc/v1_schematic.png)

Only here, well, we just use a 74HC595.

The library requires (3) digital IO pins on your Arduino.

There are some assumptions for how the LCD is connected to the 74HC595, see the
schematic in the doc folder.

For more information about this library please visit us at
https://github.com/marsairforce/595_lcd

### Pin mapping

| 74HC595  | Display  |
|----------|:---------|
| Q7 | D4 |
| Q6 | D5 |
| Q5 | D6 |
| Q4 | D7 |
| Q3 | E |
| Q2 | RS |
| Q1 | Backlight |
| Q0 | LCD VDD |

This works out well, so that we can use shift out with the least significant bit first,

Where a low low level port write is just digitalWrite and shiftOut opertions:
```
void Serial_595_lcd::port_write() {
  shiftOut(_m_ser, _m_srclk, LSBFIRST, _data.raw);
  digitalWrite(_m_rclk, HIGH);
  digitalWrite(_m_ser, LOW);
  digitalWrite(_m_rclk, LOW);
}
```

### Why use a 74HC595
I have and appreciate the I2C LCD backpack. But then sometimes I don't feel like spending $10 USD, which when converted to CDN, plus taxes and shipping
usually comes out to about double.

There are a lot of low price LCD backpacks on Amazon, or AliExpress.
But then I am impatient and don't have them at the moment when I feel like wiring something up on a breadboard, rr I don't have I2C support on what I am working on.

It turns out I do have a bunch of 74HC595's. So there is that.

I also thought it is a good learning experience to build something yourself sometimes.

### Hardware

A Kicad project for a circuit board to hold the 74HC595 shift register and the trimmer resistors is in the `backpack` sub folder here.

<img src="doc/v1_board_3d_model.png" alt="3D model" width="400"/>
<img src="doc/v1_board_layout.png" alt="board layout" width="200"/>

My board design is on OSHPark here: https://oshpark.com/projects/P1p8G9Nj


## PCF8574
You can get these on Ali Epress in a bunch of them in a lot for a couple dollars a piece.

![PCF8574 module](doc/PCF8574_module.png)

Really it is cheaper than me buying just the PCF8574 device. And then having to also buy the other components, have a PCB made. I don't know how they do it.

This device works a bit like a 74HC595 from the software perspective. There are no elaborate pin mappings or registers. You just write 8 bits to it and that gets put to the output pins.

Which means if you would like to change the value of one pin you need to write the entire 8 bits again. It is helpful to maintain a state for the varioous control pins.  We did this in our libary using C language struct bit fields.

![PCF8574 pinout](doc/PCF8574T.png)

Mapping to the LCD pins on these devices appears to be as follows:

| PCF8574T | LCD |
| :------- | :-- |
| P0 | RS |
| P1 | RW |
| P2 | E  |
| P3 | BACKLIGHT |
| P4 | D4 (D0) |
| P5 | D5 (D1) |
| P6 | D6 (D2) |
| P7 | D7 (D3) |


## Adafruit I2C/SPI LCD Backpack
This product has its own page. They do very well with it. It supports both SPI and I2C modes of operation. It has a MPC23008 a generic IO expander where, pins can be set to be individually inputs or outputs, like in the Aruino. It is really more qualified than it needs to be for driving an LCD.
It also has a 74HC595 for the SPI mode. Which is really two different interfaces in one. And they provide good software library to drive both.
The more I looked into this the more humbled I have become, as it is such a well designed and constructed little device.

I don't mean to sound like an advertisement, it is just a neat device. My only complaint is I would want a way to power off the LCD hardware using software and to control the contrast. Then again no other products do this either I guess.

## Adafruit LCD Backpack in SPI mode
When I started this project, I didn't realize the Adafruit LCD backpack also uses a 74HC595 for its SPI mode. Also, neat to know that what I was doing is actually called "SPI".

But now I also feel a little less that I actually invented something new here. Nope, everything I think of has already been done. Usually done better than how I did it as well. This is why I am humbed by this Adafruit LCD backpack device.

Thye seem to have a different pin out than I used.

| 74HC595  | Display  |
|----------|:---------|
| Q0 | NC |
| Q1 | D7 |
| Q2 | D6 |
| Q3 | D5 |
| Q4 | D4 |
| Q5 | E |
| Q6 | RS |
| Q7 | Backlight |

Of course I found the documentation after experimental analysis: https://learn.adafruit.com/assets/35681

The original Adafruit library approach was somewhat inefficient compared to my approach. Where they use an abstract `digitalWrite()` function to individually set a pin value onto the 74HC595. Instead of just doing one operation of serial writing a buffer value.

My approach is to set up a structure of the bit field values tht maps to a byte value as well, so then we just send this out with one serial write operation.

```
  union {
     struct {
       uint8_t unused:1      // P0
       uint8_t rs:1;         // P0
       uint8_t en:1;         // P1
       uint8_t data:4;       // P2..P5
     uint8_t backlight:1;    // P7
     } field;
     uint8_t raw;
  } _data;
```

This should allow a single `port_write()` operation to work a bit faster than how it was before anwyay.

## Example Sketches
Have a look in the examples folder for sample use of the library.
There are different sketches for each supported hardware device.

# Screen Buffer
I became interested in using a double buffer with my LCD projects. Mostly because if you have a bunch of different screens for menus or different states of the modes of operation, it becomes a complicated mess of code to try to manage which stuff gets printed onto which display. You need to have a bunch of flag variables to suppress something being printed if it is not visible. but then storing the output of (e.g. a sensor reading) into some intermediate storage and then re drawing the screen when that state required the data to be displayed.

What if we could just have something always write to its display screen (a virtual buffer) and then if that screen was active, just print that out to the LCD. Also. in practice it was found invoking the clear() or home() functions are very time expensive operations, relative to just having a buffer (even if it is all spaces) and rendering all of that onto the LCD.

I started off looking at some other examples of this:
* https://www.baldengineer.com/arduino-lcd-display-tips.html
* http://tuttlem.github.io/2015/02/22/virtual-buffer-for-liquid-crystal-displays.html