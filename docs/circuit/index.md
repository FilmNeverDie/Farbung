# Description
The CP800 circuit is designed to fulfil the function of developing films
with drum rolling and it consists of the following requirements

1)  Control the fluid flow of developing film

2)  Control the temperature of the fluid

3)  Control the motor for the rolling action

4)  User interface


## List of features in planning

Please read this in conjunction with the software plan, since back-end
development of the software will be highly tied with the hardware
development.

-   Multiple heating element array control, if each storage chemical
    needs to be kept at a different temperature

-   Temperature PID controller (software)

-   Allow the use of 100VAC, there will be a transformer to step down
    higher AC voltage to 100VAC, this allows the machine to work in
    country with a different phase voltage, by converting them all to
    100VAC.

-   Program the microcontroller to control the backlight of the LCD
    screen if required. (software)

-   Program that allows a selection to read from the digital input of
    the Dpad via the serial output from the shift register. (software)

-   Implement an on and off software button using the LED button mounted
    on the Dpad. (software)

-   Earth all solenoid to a common point.

-   Overvoltage and undervoltage protection

-   Quick self-diagnosis button or additional debugging display (led on
    communication\...etc)

-   Float sensor feedback for each storage tank
