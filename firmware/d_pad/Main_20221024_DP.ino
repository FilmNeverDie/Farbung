
#define model "CP-806"
#define version "1.16.2"
#define PCBver 9
// sense =0 for NO sensor, and =1 for NC sensor
#define OUTsense 1// change this to 1 when use the new flow sensor with the metal band and cable tie
#define INsense 0
/*
 *
 * By Mike FND 2021
 * updated MS FND since June 2021
 * 2022 10 24 - change the push effect to 30% (requirement for film porcessing), the pull limit is now -3 (-90%), while push remain
 *              5 (+150%)
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

//#define DEBUG //enable/disable serial debug output

#ifdef DEBUG
#define DEBUG_PRINT(x) Serial.print(x)
#define DEBUG_PRINTDEC(x) Serial.print(x, DEC)
#define DEBUG_PRINTbin(x,y) Serial.print(x, y)
#define DEBUG_PRINTbinln(x,y) Serial.println(x, y)
#define DEBUG_PRINTln(x) Serial.println(x)
#else
#define DEBUG_PRINT(x)
#define DEBUG_PRINTDEC(x)
#define DEBUG_PRINTbin(x,y) 
#define DEBUG_PRINTbinln(x,y)
#define DEBUG_PRINTln(x)
#endif

void EditsParameters(int editIndex,int arrayIndex,int * Para,int push);

// button assignment

#if PCBver == 9
  #define A_button 0b10000000
  #define B_button 0b01000000
  #define Up_button 0b00100000
  #define Left_button 0b00010000
  #define Down_button 0b00001000
  #define Right_button 0b00000100
  #define C_button 0b00000010
  #define D_button 0b00000001
  #define A_shift 7
  #define B_shift 6
  #define Up_shift 5
  #define Left_shift 4
  #define Down_shift 3
  #define Right_shift 2
  #define C_shift 1
  #define D_shift 0
#else 
  #define A_button 0b00001000
  #define B_button 0b00000100
  #define Up_button 0b10000000 
  #define Left_button 0b01000000
  #define Down_button 0b00010000
  #define Right_button 0b00100000
  #define C_button 0b00000010
  #define D_button 0b00000001
  #define A_shift 3
  #define B_shift 2
  #define Up_shift 7
  #define Left_shift 6
  #define Down_shift 4
  #define Right_shift 5
  #define C_shift 1
  #define D_shift 0
#endif

// includes library
#include "classes.h"
#include "CP800.h"
//#include <ArduinoTrace.h>
#include <OneWire.h>
#include <DallasTemperature.h>

//pin assignment

#define LED_woke 49 //pin led for woke status
#define Dpad_in_pin A0
#define Dpad_refH_pin A1
#define Dpad_refL_pin A2

#define KEYA 22
#define KEYB 23
#define KEYC 24
#define KEYD 25
#define KEYE 
#define KEYF 
#define KEYK 26
#define JOYX A3
#define JOYY A10

#define volume_pin A8
#define buzz_pin A9
#define wake_pin 3
#define remove_s0 9
#define remove_s1 8
#define remove_s2 7
#define add_s0 12
#define add_s1 11
#define add_s2 10
#define SD_MISO 50
#define SD_MOSI 51
#define SD_SCK 52
#define SD_SS 53

#define tanks_full A5
#define tanks_half A6
#define tanks_low A7
#define AC_zero A15

#define soak_pump 39
#define add_pump 40
#define remove_pump 41

#define motor_PWM 5
#define heat_PWM 2

#define drum_high 29
#define drum_empty 28

#define motor_on 31
#define motor_dir 30

#define LEVEL_SAMPLE_SIZE 20

//button
#define buttonPin A0 //buttteon resistor ladder analog Pin
//int buttonVal[6] = {LOW, LOW, LOW, LOW, LOW, LOW}; //button Value
//int buttonPinVal = 0; //button pin analog read
//button debounce and de-sticky
//int buttonPinValPrevious = 0; //value for debounce
//unsigned long buttonTimer = 0; //timer for de-sticky (ms)
//int buttonDelay = 400; //time for de-sticky (ms)
//int buttonPinValMark[6] = {560, 605, 675, 725, 755, 780}; //mark value for button pin
//right, down, left, cancel, up, confirm
byte UIcommend; // debounced byte commend to the system from UI inputs
byte UIinputs; // before debounced
int de_button;
int editing = 0; // default program editing is off
int menu_skipupdate=0;

//LCD
#include <LiquidCrystal.h>
#define rs 42
#define ee 43
#define d4 44
#define d5 45
#define d6 46
#define d7 47 //LCD Pin
#define bl 36 

LiquidCrystal lcd(rs, ee, d4, d5, d6, d7);


char lcdBuff0[21];
char lcdBuff1[21];
char lcdBuff2[21];
char lcdBuff3[21];

//char lcdBuffPrevious0[21];
//char lcdBuffPrevious1[21];
//char lcdBuffPrevious2[21];
//char lcdBuffPrevious3[21];

//menu
//menu structure see attached document
int menuRow = 0;
int menuColumn = 0;
int infopage = 0; //there will be multiple info page as we expand the complexity
const String menuTop[] = { //top tier menu text
  "Info Screen",
  "Start Processing",
  "Stop/Clean Process",
  "Last Processing",
  "Edit Process",
  "Settings"
};
const String menuSetting[] = { //declear settings menu
  "Input Check",
  "Output Check",
};


//edit menu
//int maxcol=3; // the least amount of column index the editing menu will have, change by updating numerofstep
int editIndex = 0;
int editPara[19]; // edipara is a array, mostly will be only using the first entry
int arrayIndex = 0;
bool editmenuEnd=0;
bool saving=0;


//I/O Check
bool outputCheckAction = 0;
//Input/Output Check Mode
bool IOCheckMode = 0;
int IOIndex = 0;

//declear process matrix
String processPara[8][20] = { //6 process + 2 clean process
  {}, {}, {}, {}, {}, {}, {}, {}
};
int processTemp[8] = {0, 0, 0, 0, 0, 0, 0, 0};
uint16_t processTime[8] = {0, 0, 0, 0, 0, 0, 0, 0};
uint8_t processTotalSteps[8] = {0, 0, 0, 0, 0, 0, 0, 0};
bool processParaSet[8] = {0, 0, 0, 0, 0, 0, 0, 0};

//process name
String processName[6] = {"---", "---", "---", "---", "---", "---"};

//processing data
//timer
unsigned long timer = 0; //system timer (mS)
long timeJump = 0; //jump forward time for testing (mS) - not using
#define iniDelay 200 //delay in setup (mS)

//refresh timer for lcd etc.
unsigned long refreshTimerA = 0; //timer for less frequent refresh (ms)
unsigned long refreshTimerB = 0; //timer for frequent refresh (ms)
#define refreshInterval 500 //time for lcd refresh (ms)

//agitation
byte agitationSpeed = 0; //0: ~20RMP 1: ~18RMP 2: ~16RPM
unsigned long agitationTimer = 0; // S - unused
const int agitationTime1 = 10; // S
const int agitationTime2 = 2; // S

//parameter of process
bool processState; //process runing state (0:not running 1:running)
int processNo; //runing process (0-7)
bool steppingmode=0; //default =0 : sensor mode, 1= fixed timer
unsigned long processStartTime = 0; //start time of current process

//parameter of clean process
byte processStateClean; //process runing state for clean process (0: not runing 1: clean 1 process 2: clean 2 process)
byte processCleanCycles;

//parameters for current step
bool stepState = 0; //step state (0: processing of this step is not done 1: processing of this step is done, ready to drain tank)
String stepName[20] = {"----"};
uint8_t stepNo = 0;
uint8_t stepIn[20]; //which port to add chem
uint16_t stepTime[20]; //time for processing (S)
uint8_t stepOut[20]; //which port to dump chem
bool stepPush[20]; //if this step is subject to push/pull 0:no 1:yes
bool flowin=0;
bool flowout=0;
int stepout = 0; // use to record what stepOut[stepNo] is

unsigned int stepTimer1 = 0; // begining of adding chem
unsigned int stepTimer2 = 0; // beigning of process the drum, stopped adding chem
unsigned int stepTimer3 = 0; // begining of removing chem, stpped the drum 
bool stepParaSet=0; //flag of step paratmeter are set, and ready to go

//push/pull
int push = 0; // the value of push/pull selected on the menu (this is loaded into the processing later)
int dummyroll =0; // the number of dummy rolls use in this processing

//error Message
String errorMessage = "";
unsigned long int popuptimer=0; 

#include <EEPROM.h>
int strByteLen = 200; //String Length limit in bytes
int addrShift = 0; //to shift byte for wear leveling

//SD card global
#include <SD.h>
#include <SPI.h>
#include <stdlib.h>

int SD_err =0; // 0: no err, 1: SD.begin error, 2: file load err, 3: step data load err
int program_no = 0; // count the number of program stored in the SD card file
int loadtype=0; // 1 is SD, and 0 is ROM, default from ROM
int validROMprogram[6] = {1,1,1,1,1,1};

//digital Temperature Sensor
#define tempPin 27 //DS18B20 signal bus
OneWire oneWire(tempPin); //Temperature chip i/o
DallasTemperature sensors(&oneWire);
//Temperature Control
float tempCurrent = -10.0;
float tempTarget = 22.0;

//instanstation of object
Led Led(LED_woke);
Buzzer buzz(buzz_pin,volume_pin);
SixWay_valve addChem(add_s0,add_s1,add_s2,add_pump);
SixWay_valve removeChem(remove_s0,remove_s1,remove_s2,remove_pump);
agitationMotor agitationMotor(motor_on, motor_dir, motor_PWM);
bathPump bathPump(soak_pump);
//tankLevel tankLevel;
//soakLevel soakLevel;
digilevel drumHI(drum_high,LEVEL_SAMPLE_SIZE, INsense );
digilevel drumempty(drum_empty,LEVEL_SAMPLE_SIZE, OUTsense);
//analoglevel chemtanks_full();
//analoglevel chemtanks_half();
//analoglevel chemtanks_low();
analoglevel soakLevel(tanks_full,LEVEL_SAMPLE_SIZE);
AC_heater heater(heat_PWM);
joystick joystick(KEYA,KEYB,KEYC,KEYD, KEYK, JOYX, JOYY);
Dpad_analog panel_UI(Dpad_in_pin, Dpad_refH_pin, Dpad_refL_pin);
UIcursor user_navi(&UIcommend); 
UImap menu_navi(&UIcommend);

void setup() { //********************************************set up
  
  pinMode(bl,OUTPUT);
  digitalWrite(bl,HIGH);
  //button
//  pinMode(buttonPin, INPUT);

  //serial
  Serial.begin(115200);
  //load data struct of processing
  sketchPrograms();
  delay(100);
  //LCD
  lcd.begin(20, 4);
  lcd.setCursor(0, 0);
  lcd.print(model);
  lcd.print(" ");
  lcd.print(version);
  lcd.setCursor(0, 1);
  lcd.print("FND");
  //Initialising Message
  lcd.setCursor(0, 2);
  lcd.print("Initialising...");

  joystick.Begin();
  panel_UI.begin();
  UIinputs = panel_UI.status_reg;
  user_navi.begin();
  menu_navi.begin();
  //calibreate A0 reading for buttons
  //press any key when booting up
//  if (analogRead(buttonPin) > 400) {
//    calibreateButtonPinMark();
//    buzz.play_Note(500,500);
//  }
  lcd.clear();

  Serial.print(PCBver);
  //addrShift
  randomSeed(analogRead(A13));
  addrShift = random(0, strByteLen);
  Serial.print("addrShift: " + addrShift);

  delay(iniDelay);

  //load actuators
  //Buzzer
  lcd.setCursor(0, 3);
  lcd.print("buzz...          ");
  buzz.begin();
  buzz.vol_HI();
  buzz.play_Note(988,100);

  //LED
  lcd.setCursor(0, 3);
  lcd.print("LED...           ");
//  Led.begin();
  Led.OFF();


  //addChem
  lcd.setCursor(0, 3);
  lcd.print("addChem...       ");
  addChem.Begin();
  addChem.OFF(1);

  //removeChem
  lcd.setCursor(0, 3);
  lcd.print("removeChem...    ");
  removeChem.Begin();
  removeChem.OFF(1);

  //agitationMotor
  lcd.setCursor(0, 3);
  lcd.print("agitationMotor...");
  agitationMotor.Begin();

  //bathPump
  lcd.setCursor(0, 3);
  lcd.print("bathPump...      ");
  bathPump.Begin();

  //tankLevel
  lcd.setCursor(0, 3);
  lcd.print("tankLevel...     ");
  drumHI.begin();
  drumempty.begin();
  
  //tankLevel.ReadMark();
  
  int smothingInitIndex = 0;
  while (smothingInitIndex < 10) {
    Serial.println(drumHI.isON());
    smothingInitIndex++;
  }
  smothingInitIndex = 0;
  while (smothingInitIndex < 10) {
    Serial.println(drumempty.isOFF());
    smothingInitIndex++;
  }
  smothingInitIndex = 0;

  //soakLevel
  lcd.setCursor(0, 3);
  lcd.print("soakLevel...     ");
  soakLevel.begin();
  
  while (smothingInitIndex < 10) {
    Serial.println(soakLevel.isOFF());
    smothingInitIndex++;
  }
  smothingInitIndex = 0;


  //init temp sensor
  lcd.setCursor(0, 3);
  lcd.print("temp...          ");
  sensors.begin();

  delay(100);

  //heater
  lcd.setCursor(0, 3);
  lcd.print("heater...        ");
  heater.Begin();

  //refresh lcd
  lcd.setCursor(0, 2);
  lcd.print("                    ");
  lcd.setCursor(0, 3);
  lcd.print("                    ");

  //read setup string from EEPROM
  //loadSetup();

  for(int i = 0;i<6;i++){
    int ROMerr = loadfromROM(i);
    if (ROMerr!=0){
//      Serial.print("load ROM error at ");
//      Serial.print(i);
//      Serial.print("load error: ");
//      Serial.println(ROMerr);
      validROMprogram[i] = 0; // if error this is an invaid/none program in ROM address
    }
  }
  

  //Create Characters

  delay(iniDelay);

  lcd.setCursor(0, 2);
  lcd.print("Press Any Key       ");
  lcd.setCursor(0, 3);
  lcd.print("to Start...         ");

}

void loop() { //********************************************loop
 // int statepageEnd=0; // obselete as of 20210 10 28, could be useful again, if there are bug related holding the buttons down
  //checking variables from Serial
  if (Serial.available() > 0) {
    checkVariable ();
  }

  
  //system timer
  timer = millis() + timeJump;
  
  //keep level sensor updated
  drumHI.queue();
  drumempty.queue();
  soakLevel.queue();
  
  //button
 // buttonReading();
   lcdWrite1(); //write screen according to previous determined state

  
  
 // bool UIchanged = panel_UI.Update(); // update input buttons, retunr if input are changed
  //byte buttons = panel_UI.getinputs(); // get the actual value of the buttons
  // bool UIchanged = joystick.Update();
  // byte buttons = joystick.status_reg & 0xFC;
   bool UIchanged = joystick.Update() & panel_UI.Update(); //update is 1, so either update will change this to 0
   byte buttons =  panel_UI.status_reg & joystick.status_reg;// all default signla are 1 , so A & B wil take either one method or the other
  // update as often as input

  // debounce inputs button with a change that last more than two cycle
  int debounce_change = debouncer(int(buttons), &de_button); //return if there is a chang ein debounce signal
  UIcommend = de_button | 1; // enebale  row but not col shift
  buttonAction_new(UIcommend, debounce_change);
  if (menu_skipupdate==0){
    user_navi.Update(ispageEnd,min(4,pagerow)); // update user curver row location with page info
    menu_navi.Update(ispageEnd,pagerow); // update system map location with page info
  }
  menu_skipupdate=0; //reset skipupdate for next cycle
  
  int thislayer= menu_navi.layer; //get layer number, each A press create a new layer
  // get the page idenitification based on ohw many layer and which row of each layer when A is pressed
  int pageID=0;
  pageID = (rowstack[0][1]+(thislayer>0))*1 + (rowstack[1][1]+(thislayer>1))*10 + (rowstack[2][1]+(thislayer>2))*100;
  // buttion Action change the system system depending on the current state and the input command
  int A, B, C;
  panel_UI.getvolts(&A, &B, &C);
    Serial.print(" ");
  Serial.print(A);
  Serial.print(" ");
  Serial.print(B);
  Serial.print(" ");
  Serial.print(C);
  Serial.println(" ");

  //statepageEnd=ispageEnd;  // obselete as of 20210 10 28
  DEBUG_PRINT(" ");
  DEBUG_PRINTbin(UIcommend, BIN);
  DEBUG_PRINT(" ");
  DEBUG_PRINT(ispageEnd);
  DEBUG_PRINT(" ");
  DEBUG_PRINT(rowstack[0][1]);
  DEBUG_PRINT(rowstack[1][1]);
  DEBUG_PRINT(rowstack[2][1]);
  DEBUG_PRINT(rowstack[3][1]);
  DEBUG_PRINT(" ");
  DEBUG_PRINT(menu_navi.row); 
  DEBUG_PRINT(" ");
  DEBUG_PRINT(user_navi.row);
  DEBUG_PRINT(" ");
  DEBUG_PRINT(A);
  DEBUG_PRINT(" ");
  DEBUG_PRINT(B);
  DEBUG_PRINT(" ");
  DEBUG_PRINT(C);
  DEBUG_PRINT(" ");
  DEBUG_PRINT(drumHI.isON());
  DEBUG_PRINT(" ");
  DEBUG_PRINTln(drumempty.isOFF());


  //update every 3S
  if (timer - refreshTimerA >= refreshInterval * 4) { //every 2 S

    //update LED
    LED();

    //soak tank heater disregard of processing state
    readTemp();
   // tempControl();

    if (processState == 1) {
      //update LCD
      lcdWrite1();
    }

    refreshTimerA = timer;
  }

  //update every 0.5S
  if (timer - refreshTimerB >= refreshInterval) {

    if (processState == 1) { //while processing

      //processing
      processing();

      //agitation motor
      agitation();

    }

    if (processStateClean > 0) {
      //clean process
      processClean();
    }

    refreshTimerB = timer;
  }
  //play soundtrack if there is any
  backgroundmusic(trackID, 0);
  //delay
  delay(10);

}


void checkVariable () {

  String incomingStr;
  String outputStr;

  incomingStr = Serial.readString();
  Serial.println("==================");
  Serial.print("Checking " + incomingStr);

  if (incomingStr == "processNo\n") {
    outputStr = String(processNo);
  }
  else {
    outputStr = "No Match";
  }

  Serial.println("= " + outputStr);
  Serial.println("==================");

}


void backgroundmusic(int trackID, int repeat){
  // if the current time is bigger than the previous note start plus note interval
  // note interval = 1000
  if(trackID>0 && trackArray[trackID].track[thisnote]!=-1){
    if((notetime+(NOTE_interval))< millis()){
      //play note
      buzz.play_Note(trackArray[trackID].track[thisnote], (1000/trackArray[trackID].tempo[thisnote]));
      //renew notetime to the next note starting time, 
      notetime=millis(); 
      //increment to the next note in the background music
      thisnote +=1;
    }
    if(trackArray[trackID].track[thisnote]==-1) { 
      // end of the melody
      if (repeat>0){
        thisnote=0;
      }
    }
  }else{
    buzz.no_note();
  }
}
void EditsParameters(int editIndex,int arrayIndex,int * Para,int push){
  /*
   * function to edit a existing process with the changes made by user with the menu
   * editindex indicate which parameter to change according to the parameter lookup table
   * array index indicate the number of entry in the paramter, currently only usefulf ro processName, as it is a char array
   * editpara is the menu buffer address for user to edit 
   * push, if this is one, the editpara is loaded to the variable indicated by the editindex, if 0, load from editindex variable to editpara
   * 
   * Process anem look up table
   *   const char* const paraNames[] = {"Process Name", "Process Duration (s)", "No. of Steps", "Temp (C)",
                                "Step Names", "Inlet Valve", "Step Duration (s)", "Outlet Valve", "Pushable"};
   */

  static int changed=0;
  // if editindex>8, it loops back to 4 for each step , so 9->4, 10->5, 11->6, 12->7, 13->8...so on
  // editindex = 4+stepnum*4+stepind, for n=0,1,2,3,4 
  // stepindex = (editindex-4)%5, 
  // and, stepnum = floor((editindex-4)/5);
  int stepnum,stepindex; // the current step number being edit
  // step number is when we remove the flatten index of the process by the process header 0-3, we cycle back for everything 0,1,2,3,4
  stepnum = max(floor((editIndex-4)/5),0);
  stepindex = max((editIndex-4)%5,0);  // this is found to be reluncdent as of 2022/03/06
  // look up the data that are being edit
  Serial.print("paraindex:");
  Serial.println(editIndex - stepnum*5 + push*10);
  int menuIndex = editIndex  - stepnum*5 + push*10 + 32;
  Serial.print(menuIndex,DEC);
  switch (menuIndex) // if push is 0, pull is editindex, if push is 1, it is 10
  {
    default:{
//      Serial.println("defaykt");
      break;
    }
    case (32+11):{
      int inc = *Para;
      if (inc<0) inc=0;
      ROMProgram[rowstack[1][1]].duration = inc; //when push
 //     Serial.print("saved");
 //     Serial.print(ROMProgram[rowstack[1][1]].duration);
      break;
    }
    case (32+1):{
      *Para = ROMProgram[rowstack[1][1]].duration; //when pull
//      Serial.print("loaded");
//      Serial.print(*Para);
      break;
    }
    case (32+12):{
      int inc = *Para;
      if (inc<0) inc=0;
      ROMProgram[rowstack[1][1]].numberofstep = inc; //when push
      
      if (ROMProgram[rowstack[1][1]].processes == NULL){
        // if the pointer to the steps array is empty, create new array based on the push numberofstep
        ROMProgram[rowstack[1][1]].processes = new processStep[ROMProgram[rowstack[1][1]].numberofstep];
      }else { //if the array is defined delete existing array and update the size with the pushed numberofstep
        delete[] ROMProgram[rowstack[1][1]].processes;
        //recreated array with updated number of step
        ROMProgram[rowstack[1][1]].processes = new processStep[ROMProgram[rowstack[1][1]].numberofstep];
      }
      
//      Serial.print("saved");
//      Serial.print(ROMProgram[rowstack[1][1]].numberofstep);
      break;
    }
    case (32+2):{
      *Para = ROMProgram[rowstack[1][1]].numberofstep; //when pull
      
//      Serial.print("loaded");
//      Serial.print(*Para);
      break;
    }
    case (32+13):{
      int inc = *Para;
      if (inc>100) inc=100;
      if (inc<0) inc=0;
      ROMProgram[rowstack[1][1]].temp = inc; //when push
//      Serial.print("saved");
//      Serial.print(ROMProgram[rowstack[1][1]].temp);
      break;
    }
    case (32+3):{
      *Para = ROMProgram[rowstack[1][1]].temp; //when pull
//      Serial.print("loaded");
//      Serial.print(*Para);
      break;
    }
      
    case (32+14):{
      int inc = *Para;
      if (inc>8) inc=8;
      if (inc<0) inc=0;
      ROMProgram[rowstack[1][1]].processes[stepnum].stepcode = inc; //when push
//      Serial.print("saved");
//      Serial.print(ROMProgram[rowstack[1][1]].processes[stepnum].stepcode);
      break;
    }
    case (32+4):{
      *Para = ROMProgram[rowstack[1][1]].processes[stepnum].stepcode; //when pull
//      Serial.print("loaded");
//      Serial.print(*Para);
      break;
    }
    case (32+15):{
      int inc = *Para;
      if (inc>6) inc=6;
      if (inc<1) inc=1;
      ROMProgram[rowstack[1][1]].processes[stepnum].inputtank = inc; //when push
 //     Serial.print("saved");
 //     Serial.print(ROMProgram[rowstack[1][1]].processes[stepnum].inputtank);
      break;
    }
    case (32+5):{
      *Para = ROMProgram[rowstack[1][1]].processes[stepnum].inputtank; //when pull
//      Serial.print("loaded");
//      Serial.print(*Para);
      break;
    }
    case (32+16):{
      int inc = *Para;
      if (inc<0) inc=0;
      ROMProgram[rowstack[1][1]].processes[stepnum].duration = inc; //when push
//      Serial.print("saved");
//      Serial.print(ROMProgram[rowstack[1][1]].processes[stepnum].duration);
      break;
    }
    case (32+6):{
      *Para = ROMProgram[rowstack[1][1]].processes[stepnum].duration; //when pull
//      Serial.print("loaded");
//      Serial.print(*Para);
      break;
    }
    case (32+17):{
      int inc = *Para;
      if (inc>6) inc=6;
      if (inc<1) inc=1;
      ROMProgram[rowstack[1][1]].processes[stepnum].outputtank = inc; //when push
 //     Serial.print("saved");
//      Serial.print(ROMProgram[rowstack[1][1]].processes[stepnum].duration);
      break;
    }
    case (32+7):{
      *Para = ROMProgram[rowstack[1][1]].processes[stepnum].outputtank; //when pull
 //     Serial.print("loaded");
 //     Serial.print(*Para);
      break;
    }
    case (32+18):{
      int inc = *Para;
      if (inc>0) inc=1;
      if (inc<0) inc=0;
      ROMProgram[rowstack[1][1]].processes[stepnum].push = inc; //when push
      
  //    Serial.print("saved");
  //    Serial.print(ROMProgram[rowstack[1][1]].processes[stepnum].duration);
      break;
    }
    case (32+8):{
      *Para = ROMProgram[rowstack[1][1]].processes[stepnum].push; //when pull
   //   Serial.print("loaded");
     // Serial.print(*Para);
      break;
    }
    case (32+0):{
      //when pulling from existing, numbertoload of the array is sizeof the existing processName
  //    int numbertoload = sizeof(ROMProgram[rowstack[1][1]].processName);
   //   Serial.println(numbertoload); 
      for (int c = 0; c < 19; c++){
        //for each number of entry of the array, load that onto the editPara int array
        *(Para+c) = max(0,int( ROMProgram[rowstack[1][1]].processName[c]-32));
    //    Serial.print(*(Para+c)); 
      }
      
      break;
    }
    case (10+32):{
    
      int numbertostore = arrayIndex+1; //arrayIndex will reflect the last index of the input processName, thus full size is +1
      if (ROMProgram[rowstack[1][1]].processName == NULL){
        // if the pointer to the processName is empty, create new array based on the push numberofstep
        ROMProgram[rowstack[1][1]].processName = new char[19]{0};
      }else{ //if the array is defined delete existing array and update the size with the new int array passed down by the editpara pointer
        //delete[] ROMProgram[rowstack[1][1]].processName;
        //recreated array with updated number of step
        //ROMProgram[rowstack[1][1]].processName = new char[19];
      }    
     // for (int c = 0; c < numbertostore; c++){
      //for each number of entry to the array 
      int chr_inc = Para[arrayIndex]; 
      if (chr_inc>90) chr_inc=90;
      if (chr_inc<0) chr_inc=0;
      ROMProgram[rowstack[1][1]].processName[arrayIndex] = char(chr_inc+32);
  //    Serial.print(ROMProgram[rowstack[1][1]].processName[arrayIndex]); 
      //}
      break;
    }

    

  }

}
