/*
 *
 * By Mike FND 2021
 * updated MS FND since June 2021
 * 2022 10 24 - change the push effect to 30% (requirement for film porcessing), the pull limit is now -3 (-90%), while push remain
 *              5 (+150%)
 * 2022 10 15 - a bug is discovered that the cursor pointer '>' is displaying one loop frame behind the , and not update after the 
 *              button action. this make the arrow pointing at the previous row while the menu is updated to next page
 *              - the cause is by the fact that there is a action from button and the screen will need to refresh after the 
 *                action, however during editing programs, there are instant there the screen has to update moment after 
 *                the action because some msg are display temperorily
 *             -  the final deicison to to let the screen refresh for 2 cycle so that the screen will display during and after
 *                button action, HOWEVER the TRADEOFF is that the screen will be twice as slow in response to the next new input
 *                user should hold the onscreen button down for longer before taking the button off
 *                if (UIchanged==0 || refresh !=0){
 *                 refresh -=1;
                   lcdWrite1(); //write screen according to previous determined state 
                  }
                - during popupmsg, the timer will keep the refresh signal on (=1), so it will refresh once after the popuptimer
                  ran out
 * 2022 10 02 - change the button UI at the end of the setup loop, and not redraw them all the time in loop 
 *              the slow rate and the screen nonupdating is two different issue., since the development log is so huge, i moved
 *              this log to another tap
 *              
 *              1) the screen stop to update everything, the code called the onscreenUI::update() function, this function was
 *              using a golabel module from Touchscreen, ts, this might cause an issue, since it require to jump to another object
 *              for theiir update to get point. the changes made so that now the function take an arguemtn of a point returned by
 *              touchscreen object, onscreenUI::update(TSPoint tp), this avoid the screen stuck issue. 
 *              2) the slow rate is due to the fact that we update the screen every loop, and it is liekly the slow rate is the rate
 *              of the updateing the screen (320x240 pxs). Now, the screen will only update in the menu if there is a button pressed.
 *              it is important to know that the screen update all the time during processing regardless of the buttons actions
 *              
 *              new compile result:
 *              Sketch uses 70446 bytes (27%) of program storage space. Maximum is 253952 bytes.
                Global variables use 5727 bytes (69%) of dynamic memory, leaving 2465 bytes for local variables. Maximum is 8192 bytes.

 * 2022 10 01 - add button UI to the menu (always)on the right, evenly sized rect button  
 *              change green color to darker green
 *              make a new class for the onscreen menu, see CP800.h for class
 *              1) hit box for each button
 *              2) return value consistent with joystick.status_reg or panel_UI.status_reg
 *              
 *              BUGS:
 *              1) the serial com show the button are working and can get into different page, but dispaly is not updated
 *              2) the serial com also print very slow
 *              
 *              speculate that the bugs are a result of trying to print the entire screen all the time. 
 * 2022 09 28 - first attempt to intergrate the code with touch screen. abolish the crystal liquid library and introduce the touch screen and tft library 
 *              for touch screen display
 *              changes:
 *              1: replace all lcd display with equilavent tft function and display them
 *              2: add #define for touchscreen parameters
 *              3: due to dynamic memory limit, all blank spacce is removed from the setup loop since constant string are global varaibles
 *              4: break fix string constant into word, so compiler can optimised reused word to reduce global varaibles
 *              
 *              result:
 *              Sketch uses 68342 bytes (26%) of program storage space. Maximum is 253952 bytes.
 *              Global variables use 5739 bytes (70%) of dynamic memory, leaving 2453 bytes for local variables. Maximum is 8192 bytes.
 *              
 *              
 * 2022 09 17 - code is merged with an branch made on 20220806 where two more sketch program is implemented C41 and E6, see class.h 
 * 2022 09 15 - code at 20220802 didn't have the implemntation of dummy rolls inputs, thus this version merge both the fixed reverted for eeprom from 
 *              0802 and the implementation of dummy rolls adjustment in 0618. bth feature of eeprom and dummy is tested on 20220917
 * 2022 08 02 - bug is dsicover that ROM program only save to first address loc, since 0410 fixed addressing method work, the savetoROM() is revert back to 
 *              ver 0410 
 * 2022 06 18 - allow a adjutible dummy rolls input for water level adjustment: 
 *                1) from chemical timing.xlsx, we found that each dummy roll reduce filling time by 6 second, 
 *                2) the normal roll is around 1-2sec, the difference is so small that it is smaller than the human timing error
 *                3) typically a 5-10s filling above the acceptiable water level without overflow 
 * 2022 06 12 - implement more UI feedback for program editing menu
 *               1) there is an additional info to show user which step they are editing on the screen, note that program header are also step 1
 *               2) there is a 5 sec popup message to tell user that they had programed the last step parameter in the menu. 
 *               3) 1s popup message for displaying the paratmeters has saved
 * 2022 06 04 - 1) implement alternative infopage (press left), allow user to select between sensor mode or fixed timer, for each step
 *              2) delated commented out sections  (tidy up)
 *              3) delated unused but delcared global (old processing program structure), FREE up 3 % of dynamics memory!!!! 5902 -> 5656 bytes :246 bytes!
 *              4) change ROM addresssing, since we use a fixed location. could be done by algorithmic method, multipling a fixed increment, reduce 24 bytes
 *              5) make sure all step timer are reset consistently between completing the stage and when pressing ht skip button (down), previously
 *                  timer 1 and timer 2 are not rest consistently, so skipping removing all jump straight to the next processing not add chem. 
 *              ALso there is a huge problem with the mechanical Dpad, it is so easy to press multiple buttons. Design to improve the layout has ot be the 
 *              next prioirty 
 * 2022 05 31 - there is bug, where when push is is -1, the add in of first step is skipped.there are couple of raeson for skipping
 *               1) mis-trigger of down button, fix: on timer for down button, 
 *               2) tank sensor mistrigger, (most likely cause) after some test
 *                 - dry test, has not fail once after 10 tries.... so the frequency should be less than 10%
 *               a plan to have a option to select a timer only mode for processing, so no step will be stuck, but the tradeoff is that a bad step is
 *               moved on without any proper correction. 
 * 2022 05 18 -  code will incorporate a "forced flow out" mode where when activated will force fluid out of port 6. This is similar function to
 *                the existing flow in poeartion ut at different timing, this is  mainly use when one port has failed and liquid has to be drained
 *                in another way. Note that forced flow out use port 6, and user should use it as emergency if the supposed out port has failed. if 
 *                the supposed port is still operational, both port 6 and the supposed out port will be opened
 * 2022 04 10 -  code does not  work without the joystick shield because the pulled up resistor on the joystick output .fixed the unresponsive 
 *               issue cause by the lack of pulled up signal for open joystick pins, by internally pulled up using ardino.
 *               1. however, pulled up cause the joystick to always read as down and left because the value is bigger than the threshold for
 *                  those signal, 
 *                  1.1: one fix is implemendted that if the value is pulled up above 900, the progream will assume joystick is not connected, 
 *                       and allow the new signal of up down left right be 1, so the signal of the Dpad will dictate the input (had been implemented)
 *                  1.2 it is worth noting that the threshold only work with 3.3V configuration of the joystick, DO NOT use 5V setting EVER
 *               2.  also disable reading input C and D from the joystick to avoid possible shift left and right columne on screen *                  
 * 2022 03 27 - no change to program, code does not  work without the joystick shield
 * 2022 03 23 -  mainly  the same as 20220322, the joystick class is tested individually and AND with the previous Dpad class. The pin avaiable 
 *               for the analog X and Y axis changed to A3, and A10. there will be an adjustment later that might use A3 and A4. A NEW PCB is 
 *               warantee for prorper intergration of joystick shield. There is a bug that shift the screen eft and right without the Dpad class,
 *               this is due to the fact that the least significant two bits were used to enable shift pixel operation. AND 0XFC is used when not
 *               AND the Dpad buttons
 * 2022 03 22 - Implemented a joystick class for arudino joystick shield (yet to be tested), the new class should be compitale in their output
 *              to the original DPad class that is being use. THere is a commented out option that & the output from Dpad and joystick class
 *             . Given both class output are 1 with there is no signal, so any change can from either system should be able to reflect by the AND
 *             operation. Need to solder the extra pin with wire connect the respective pinout on the joystick shield
 * 2022 03 15 - 1. implemented flow in toggle during processing, the toggle is on the up button, it force the input of the step to flow in, and stop flowing in
 *              2. the flow in overwrite the existing level detection to refill the tank
 *              3. flowin flag should reset either by the toggle or entering into the next step of the process
 *              4. LCD will display the flowin overwrite before the timer on the 3rd row, when the flowin flag is on
 *              5. There was a bug that use the outlet valve when using flowIN overwrite, but this has been fixed on 2022 03 15
 *              6. there is a BUG discovered that causes the step to stuck and unable to proceed. 
 *                  - currently, disabled the timer stepping by 15s using the left and right button while in the info during processing
 * 2022 03 13 - 1. validROmPrograms is explicitly define as {1,1,1,1,1,1}, because using {1} only populate the first entry with 1, and the else are 0, which lead to 
 *              incorrectly import of ROM program
 *              2. ROM programs are loaded in setup loop, therefore after user edidted a programs , they are required to restart the machine to load the ROM programs
 *              3. cannot change the temp above 29 degree, or else when it enter step editing, the stespcode will cause the machine to froze
 * 2022 03 08 - fixed the loading problem, because the  body extracted from the ROM is indexed incorrectly into the ROMprogram array
 *               added preprecessor define for out and in flow sense, If the type is NO, then lv is full when value is 0, empty when 1, if NC, it is the opposite
 * 2022 03 06 - the editing menu is work as inteneded, the update process is call more often whenever a change is made (this could be optimised to redcued
 *              calling in different instace). 
 *              paramter range is implemented just before saving, most value cannot be <0. the upper limit will depend on the data type
 *              the pulling from data is also achievedd, somehow the case did not process further than 10, and all the other cases has to be define
 *              before case 10 in order for them to work
 *              Data can be save to ROM sucessfully, and the function works with the correct bytes after a few attempt
 *              HOWEVER, the data load from ROm experience some issue. a temperary array called body could extract all stored data sucessfully without
 *              corruption, however, when load them onto the ROMprogram array from script, the data after temp, the begining of the step are corrupted 
 * 2022 02 23 - array manipulation by passing down a function is limited, the editPara is made into an array for all type of data in editing. 
 *              based on the the position of the editing menu (which parameter) the pull and push of the editpara into the respective ROMprogram
 *              array will be selected by a case condition that refer to the appropriate variable in the data struct, please refer to EditsParameters() 
 *              furthermore, the shift right and left will save the current progress of editing to the ROMprogram array, this may not be the best prcatice
 *              to persever the previous data but it is a conveienct way of keeping the current progress, since array cannot be passed down to
 *              a function entirely with a pointer and an unknown size. 
 * 2022 02 20 - debug mode include the print out of UI for edit processing, low memomry might have stbality issue, further compartmetnation
 *              of function is required to release memory. 
 * 2022 02 09 - experimental version with menu programming using the edit menu
 * 2022 01 30 - extend the pump out hold on to 15s after both flow out sensor is empty. 
 * 2022 01 11 - add the program for 11, 13, 14, 18 10 minus BW process. now all ROM process is filled
 * 2022 01 04 - tested the new data struct, and it is loaded sucessfully from both the ROM and SD, and compiled global varaibles used for 
 *              non-DEBUGGING is 66% at 5422 bytes. The new loading method also allow multiple load without change the storing variable, and
 *              thus do not require user to reboot to start a new process, and the program from SD card could be refresh by re-select 
 *              " load from SD" in th menu. 
 * 2022 01 02 - added two more method of loading the processing, one using ROM but with the processprogram data struct which should be used to
 *              stored all info, the total data size is decrease dramatically with that. The other one is loaded from SD file, which is a copy
 *              of the test_loadPrograms.ino froom the test programs. this also follow the procesprogram data struct. LCd is also updated with 
 *              one more layer and two option, of wether it is load from ROM or SD. 
 * 2021 12 21 - feature under development. the SD is a optional feature,It will Try to Begin SD card, upon the user selecting process from SD
 *              the SD is required to have a file names, PROGRAMS.txt. The loading will check if the file header is correct, and check if the 
 *              programs contain the same size of the steps as the program header stated. also check if the program txt exist
 * 2021 12 21 - add one second delay after both second turned off even for a split second, and increase the move 
 *              average range of empty size by double of origin from 10 to 20;
 * 2021 12 17 -  the motor was incorrected atuated. The correct way is HIGH is turning off, and LOW is turning ON
 * 2021 12 07 - 1)FIX: bug where display is broken after stopping processing is fixed, this could be either due to the inactive lcdWrite()
 *                which uses the new the row stack command to display info. After change the lcdwrite() to lcdwrite1(), it seem the 
 *                translatio nbetween each dispaly is opeartional now. 
 *              2) there is going to have a new option in start processing, there will be two default process, the rest will be read from 
 *              SD card, the program are extracted from a file in the SD card. the program is fixed size and is determined by reading the 
 *              first byte. then it will get all the bytes from the file until the End of File. Each placement of the paramter is fully defined
 *              and it would populate the with struct of programs (need a lot of free ram in final firmware), the menu will list all the
 *              program name in this file. Option 2 is to allow user to select which file in the Sd to be loaded and the menu will display
 *              all filename in the SD card. 
 * 2021 12 05 - 1) the bug discovered on 2021 11 30 didn't occur at version 2021 10 10, please revise all change between 1010 and 
 *              10 21 to find th possible cuase of preiodic frezzing
 *              2) there is a new update to the button value, and allow customisation of button value. THe A B button now has 
 *              higher priority. 
 *              3) FIX: the bug that cause periodic freezing is due to a floating pin for the temp_bus, it is suspext that the 
 *              oneWire library is using an interrupt or a timeout condition. Now the pn have been assigned to the proper pin
 *              and the freezing stopped. 
 *              4) a new display bug that corrupt the idisplay after returning to main menu from stopping a process, so flag is suspected
 *              to not get reset in this operation hence the bug. 
 * 2021 11 30 - 1) a new bug has discovered and is present as far back as 10/10, this is could be due to the floating input of the 
 *              prototype board, that result in the error code of 109 in relation to the "heater on" message. but not known in previous
 *              development this could be due to the increase in heat toward the end of the year, thus the floating input are different
 *              it is advices to move the test rig onto an exact PCB board with fully connected system for testing
 *              2) the limit of the row and column is restrict between zero to a number, so push that require negative didn't work
 * 2021 11 30 - there is a display bug notice, this could the the cause of the -1 row display, because the user navi is fixed 
 *              to 4 but the menu navigation is equal to the rows on the page as defined by each state in the button update
 *              when the pagerow is maxing out at 3, excessive 'down' would make the row to -1
 * 2021 11 21 - beginning of using a new protocol for storing processing program 
 * 2021 10 31 - hard code the time variation of black and write regardless of the actual number of program in the Procsetup
 * 2021 10 10 - update all level sensor class , yet to fix the button action 
 * 2021 10 26 - update the drum level sensor using the capacitive sensor instead of the inductive sensor
 * 2021 10 28 - display bug is fixed, note taht the debounce change the buttonAction when user release the button
 *              while the UIcommands change the menu and user locaion upon pressing the button. This has no problem as
 *              of 20210 10 28 since the edge only do one action, and it actually help reduce one variable as the button
 *              update will always use the previous pageEnd flag and the state won't update the flag until the user release 
 *              the butreadFromRomtons
 * < 2021     - no log is recorded before the 2021 10 28, so just assume the code is more or less similar from mike
 * 
 * Current problem:
 * none known, yet to be tested
 *  
 * Fixed patch: 
 * processing timing for out pump is not timed (fixed issue on 12/2021, and extend to 15s since 2022 01 30)
 * increase push doesn't work, process only wokr with reduced time (fixed isse on)
 * some display bug still exist when return to main menu, will push the first row to -1. (fixed issue on 2021 10 28)
 * writetorom was never implemeneted (fixed issue on 2022 03 06)
 * user defined programmenu was never implemented (fixed issue on 2022 03 13, viewed log from 2022 02 23 to 2022 03 13 foir full development)
 *  
 * feature yet to be implement: 
 * None
 * 
 * planned feature implemented: 
 * a pause function during processing 

 * 
 * feature implemtned (inaccurate due to lack of consistent documentation during development. Ops!):
 * programmable UI for processing (implemented with full functionality on 2022 03 13)
 * Load to Rom from current avaible programs. (implemented on 2022 03 06)
 */
