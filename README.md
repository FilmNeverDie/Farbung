# Farbung

Färbung means colouring in German, and all these effor are infact a way of colouring, thus Färbung. 
A open source project based on FilmNeverDie's CP800 film processing machine.

Project: CP800 

This project is initialized and managed by FIlmeNeverDie. Here, we introduce a rotating drum film developer. Film developing machines are getting outdated and they have run out of support, so the project aims to introduce a series of products that could replace old equipment that has no support and is hard to get replacement/maintenance services. This project provides the resources available for on-going maintenance and product support for film processing within an open-source community, so that anyone can pick up the role as a supplier and maker. We also welcome users to make their own adaptation since the need for each user might be different and the existing variation may not be ideal for each application. Please see CONTIRBUTION for how you can contribute to an existing project, or branch off to your own variant of the machine.  

 

## Project structure 
 
The project is separated into sections: hardware, firmware, and software 

Hardware includes a list of parts, the relevant CAD files, schematics, and respective documentation such as part lists (BOM), datasheet, user manual, maintenance manual, production manual, and certificates. 

Firmware includes the codes for programming the microcontroller, and its respective documentation such as change log, license, dependency. 

Software includes any software that enhance any parts of either the machines or film processing such as simulation, check system integrity and firmware auto-update, the processing programs generators, photo scanning and processing software and their respective documentation such as change log, license, dependency. 

 

Contributors will be expected writing and updating the manuals for their own variation.  

There will be a list of verified models and compatibility table that shows the combination of hardware/firmware/software compatible in the front page of each project.  

  

 

## Getting Started 

Installations 

###Firmware: 

Arduino IDE 
with libraries: 

USB Host shield Library 2.0  

DallasTemperautre + OneWire 

Get the newest stable version of source code and upload to the arduino, please check the hardware version of your machine if you purchased from FND, and download the respective firmware. 

###Hardware: 
Mechanical:
Fusion 360 
Electronics:
KiCAD5

###Software:

N/A 

## Getting Involved 

The following are areas where we are currently working on: 

Chemical tanks system: float sensors, heating 

Mechanically stronger developing tank (either stainless steel, or better printing) 

Firmware optimization to use dynamics memory less than 5kbB. 

Optional joystick modules (Arduino joystick shield), and USB/BT controller (see USB Host shield Library for the list) 

Onboard low noise low dropout voltage regulation instead of relying solely on the switching mode convertors with various quality depending on the source (see the BOM in hardware section) 

 

Areas that could be potential development: 

Miniature solenoid valves and poly manifolds fitting.  

Compatible microcontroller other than Arduino such as beaglebone, Rpi, Psoc, others 

Processing program generators (web base or standalone) 

A bigger and high-resolution screen, also new UI/UX, don't mind if you can fit a few “extra functions” in for bored operators to do while processing 

A computer application that searches for the newest firmware to download from GitHub for any verified hardware 

Any other suggestions 

 

## LICENSE: 
This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.
see [LICENSE](LICENSE.md) for details 

 
