# Description:

The user manual has information regarding how to operate the machine. This document is for developers by explaining how the code functions and is structured.

There are a lot of iterations of firmware that are applicable to the microcontroller in CP800. Much of the code is shared between all iteration of the firmware. This document will break the firmware by its function and explain each part of it. There is a log of changes written inside the beginning of the main code so developers track when a feature/function was implemented. Of course, that is not the most comprehensive log, so there might be changes that happened between the recorded date. For the sake of documentation, we assume all data recorded on the log is the date of a committed version of the firmware and all changes to between the commits happen on the latest commit.

# Main Headers

```c
#define model "CP-806"
#define version "1.16.2"
#define PCBver 9
// sense =0 for NO sensor, and =1 for NC sensor
#define OUTsense 0// change this to 1 when use the new flow sensor with the metal band and cable tie
#define INsense 0
```

At the beginning of the code there is a section before the log. This section contains `#define` for the machine. “model” and “version” are not used functionally as of 8th June 2022. However, PCBver is used to define the pinout for the Dpad and user interface inputs. Since there are two functional PCB being used by CP800 as of 8th June 2022. OUTsense and INsense, is used to defined whether the tank level sensor and flow out sensor are normally open (NO), or normally closed (NC) signal. In the future, more metadata could be defined here so other supporting software could identify the machine and hardware associated with that specific model and version of machine.

```c
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
```

`#define DEBUG` serial print via Arduino COM. This allows a global disable on all serial print functions when we don’t want to be debugging. Note that there are still some `serial.print` functions not controlled by this declaration.

```c
void EditsParameters(int editIndex,int arrayIndex,int * Para,int push);
```

There is one function declaration before the main. This function is used to edit existing processing in the ROM. This function required the following dependencies:

- The data type of ROMProgram `struct`
- And Arduino basic library.

> :information_source: NOTE: it is planned to modularize the ROM processing code to have a separate file and header.

The section below the comment:

```c
// button assignment
```

is for the position of each button on the Dpad to the R-2R DAC.
Then the libraries are included below the line:

```c
// includes library
```

Four libraries are active as of 8th June 2022

```c
#include "classes.h"
#include "CP800.h"
#include <OneWire.h>
#include <DallasTemperature.h>
```

`CP800.h` and `classes.h` are defined within the Arduino script folder. LiquidCrystal , `OneWire.h` + `DallasTemperature.h` could be installed and updated with libraries manager on Arduino IDE.

Following the comment:

```c
//pin assignment
```

Are the pin assignments for most GPIO for joystick shield, SPI com, motor interface, valves interface, buzzer, fluid sensors.
For the button variables:

```c
byte UIcommend; // debounced byte commend to the system from UI inputs
byte UIinputs; // before debounced
int de_button;// debounced signal from the Dpad buttons
int editing = 0; // default program editing is off
int menu_skipupdate=0;
```

`UIcommned`, is the debounced 8 bits signal for the microcontroller, this includes the buttons digital inputs with the 6 MSBs. The 2nd LSB indicated whether the cursor can travel through the columns, whereas the LSB indicated whether the cursor can travel through the rows.

`UIinputs` are the raw signal from the 6 inputs from Dpad

`de_button` is the debounced signal for UIinputs

Editing is a flag to indicate whether the user is in editing mode or not, see “editing processing” in the user manual.

`menu_skipupdate` is a flag to control whether the menu is being updated or skipped. Might use a better name

These variables are mainly interfacing with the `UIcursor` and `UImap` classes which contain the information where the cursor is on the menu, and where in the mapping of the menu. The final inputs are input to the `buttonAction` subroutine, where the microcontroller reacts to the new inputs every program cycle.

```c
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
```

For the LCD, a new library is included, `LiquidCrystal.h`, and a set of pin assignment is `#define` correspondingly to the object imitation of the LCD, see LiquidCrystal object constructor for how to initiate a LCD object with the library.

```c
char lcdBuff0[21];
char lcdBuff1[21];
char lcdBuff2[21];
char lcdBuff3[21];
char lcdBuffPrevious0[21];
char lcdBuffPrevious1[21];
char lcdBuffPrevious2[21];
char lcdBuffPrevious3[21];
```

The LCD screen used has 4 rows of 20 characters. Four `lcdbuffer` are made to store each position of the LCD. Four more are made to store the previous screen which are currently not used.

```c
//menu
//menu structure see attached document
int menuRow = 0;
int menuColumn = 0;
int infopage = 0; //there will be multiple info page as we expand the complexity
const String menuTop[] = { //top tier menu text
...}
const String menuSetting[] = { //declear settings menu
...}
```

`menuRow` is the row number that the cursor/mapping is currently in
`menuColumn` is the column number that the cursor/mapping is currently in
Infopage is the page number that the user is currently viewing
`menuTop` is a character array with words that are shown on the top menu
`menuSetting` is a character array with words that are shown on the setting menu

```c
//edit menu
int editIndex = 0;
int editPara[19]; // edipara is a array, mostly will be only using the first entry
int arrayIndex = 0;
bool editmenuEnd=0;
```

Three variables are declared under editing menu. These variables are used when the user is in editing ROM program mode.

`editIndex` is the index that indicates the current variable the user is editing. Please see EditsParameters function to see how the entire processing program is flattened and how each data is indexed

`editPara` is the value which the index is referring to. There are several types of datatypes, depending on the indexing the data in the array interpreted as different data type, please refer to EditsParameters function for future information

`arrayIndex` is the index for the character array, processName[].

`editmenuEnd` is a flag for rather the edit menu reached the end or not

```c
//I/O Check
bool outputCheckAction = 0;
//Input/Output Check Mode
bool IOCheckMode = 0;
int IOIndex = 0;

```

Three variables are declared to be used when the user is in the IO check mode in the setting menu, see user manual for how to navigate to the IOcheck menu

`outputCheckAction` toggles the action state of each active element of the machine from the menu, typically the component is switched on when this value is 1, such as motor, pump, valve ...etc

`IOCheckMode` indicates if the program is in the IO check menu. This enables the IOIndex to be changed, because the program has entered IO check mode

`IOIndex` is the index that shows which input or output the user is currently checking. Refer to inputCheck() and outputCheck() to see how all inputs and outputs are arranged into an array.

```c
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
```

`processPara` is an array of 8 with 20 strings each. String is used here because it is made using the old data format where all parameters are compiled into a String datatype

`processTemp` is the temperature value for each process

`processTime` is the duration of each process

`processTotalSteps` is the number of steps in each process

`processParaSet` is the flag that say whether the process has be set (loaded from storage)

`processName` is the name of the process

```c
//processing data
//timer
unsigned long timer = 0; //system timer (mS)
long timeJump = 0; //jump forward time for testing (mS)
#define iniDelay 200 //delay in setup (mS)
```

Then we will introduce all the data use in processing

For timers:
Long timer is a system timer where it will update every loop

`timeJump` is an accumulated varaibles that will increase or decrease the timer values (currently unused)

`iniDelay` is the delay amount in ms introduce in the for several component when machine is booting up. These include loading processes from ROM, initiating LED, initiating motor.

```c
//refresh timer for lcd etc.
unsigned long refreshTimerA = 0; //timer for less frequent refresh (ms)
unsigned long refreshTimerB = 0; //timer for frequent refresh (ms)
#define refreshInterval 500 //time for lcd refresh (ms)
```

`refreshTimerA` regulate what get update, currently it is at 4 times of `refreshInterval` which is 2s. These processes are LED, LCD, read temperature
`refreshTimerB` regulates what get updated, currently it is at refresh interval rate which is 0.5s. These processes are controlling the motor, controlling the processing, or the cleaning process.

```c
//agitation
byte agitationSpeed = 0; //0: ~20RMP 1: ~18RMP 2: ~16RPM
unsigned long agitationTimer = 0; // S
const int agitationTime1 = 10; // S
const int agitationTime2 = 2; // S
```

`agitationSpeed` determines the speed setting of the motor, this could be expanded to the values of a byte

`agitationTimer` is not used

`agitationTime1` and `agitationTime2` are used to create the pattern of motion during processing. The pattern is forward, stop, backward and stop, then repeat.

```c
//parameter of process
bool processState; //process runing state (0:not running 1:running)
int processNo; //runing process (0-7)
bool steppingmode=0; //default =0 : sensor mode, 1= fixed timer
unsigned long processStartTime = 0; //start time of current process
```

`processState` is the flag showing whether the machine is running a processing or not

`processNo` shows which process from the menu is selected to be processing

`steppingmode` shows how the steps in a process are going to progress. Sensor mode means the step progress to the next step depending on the feedback sensor, fixed timer means the step progress to the next only depending on a fixed amount of time.

`processStartTime` marks the timer instance where a new processing has begun.

```c
//parameter of clean process
byte processStateClean; //process runing state for clean process (0: not runing 1: clean 1 process 2: clean 2 process)
byte processCleanCycles;
```

There are supposed to be two cleaning processes, they are both currently not programmed. From the order of adding and removing fluid. Clean 1 is having the both add and remove are active depending on a processing array.

```c
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
int stepout = 0; // use to record what stepOut[stepNo] is, unused
unsigned int stepTimer1 = 0; // begining of adding chem
unsigned int stepTimer2 = 0; // beigning of process the drum, stopped adding chem
unsigned int stepTimer3 = 0; // begining of removing chem, stpped the drum
bool stepParaSet=0; //flag of step paratmeter are set, and ready to go
//push/pull
int push = 0; // the value of push/pull selected on the menu (this is loaded into the processing later)
```

Within the processing, each step has timing and parameters that define their actions.

`stepState` shows whether the processing of the film in this step is done, if done start draining tank fluid and prepare for the next step

`stepNo` shows sequential order the step is in the processing

StepName shows the name for a step

`stepIn` and `stepOut` shows which valve port which are used in the step

`stepTime` is the duration of the step

`stepPush` enable/disable the step to be pushed/pulled. Push: increase time of processing of this step, pull: reduce time of processing of this step

`flowin` is a flag made to force the chemical to flow in by the user at any time during the step which the processing is currently in

`flowout` is a flag to force the chemical to flow out of port 6 during the process, this is used for emergency flow out in case the other valves are somehow blocked during the processing. Please refer to the user manual.

Stepout is supposed to record the value of stepOut the processing was, so that an interrupted operation could be done and yet the processing could continue by pushing this variable back into stepOut (currently unused)

`stepTimer1` is use to time the adding chemical stage of the step

`stepTimer2` is use to time the rolling processing stage of the step

`stepTimer3` is use to time the removing chemical stage of the step

`stepParaSet` shows whether the step parameters are loaded and ready to go

`push` is the value of how much time are increase/decrease (push or pull) for all the pushable steps in the current processing

```c
//error Message
String errorMessage = "";
unsigned long int popuptimer=0;
```

`errorMessage` is a String for displaying the message when an error incurred

`popuptimer` is a time variable for displaying a message on LCD, this is updated to the newest time, so the popup message will display for a duration of time after this variable is updated

```c
#include <EEPROM.h>
int strByteLen = 200; //String Length limit in bytes
int addrShift = 0; //to shift byte for wear leveling
```

EEPROM is one of the options to store and recall processing, all parameters are stored as a byte array.

`strByteLen` is currently defined as 200 bytes. Detailed structure of the stored array is in the comment section of the CP800.h tab.

`addrShift` is supposed to be a random 8 bits value that shifts the ROM address, in order to achieve wear leveling. The array will have a wrapping order from 256 back to 0. However, the wrapping is not yet programmed. Currently not use.

```c
#include <SD.h>
#include <SPI.h>
#include <stdlib.h>
int SD_err =0; // 0: no err, 1: SD.begin error, 2: file load err, 3: step data load err
int program_no = 0; // count the number of program stored in the SD card file
int loadtype=0; // 1 is SD, and 0 is ROM, default from ROM
int validROMprogram[6] = {1,1,1,1,1,1}; //0: invalid, 1:valid
```

Load all libraries required to use SD module on Arduino

`SD_err` is the value that returns from attempt to initiate the SD module

`program_no` is the number of processing program stored on the SD card; the program indicator is located at the beginning of each processing program. More details for the data structured store on SD card are described in “process_data” tab

`loadtype` determines how processing program is loaded, either from SD card or EEPROM

`validROMprogram` is an array of flags to indicate which programs stored in the EEMPROM have a valid data structure. If there is no legit program header found in each memory slot, the function will change this array of the corresponding index to 0, so loading on those program entries will be skipped.

```c
//digital Temperature Sensor
#define tempPin 27 //DS18B20 signal bus
OneWire oneWire(tempPin); //Temperature chip i/o
DallasTemperature sensors(&oneWire);
//Temperature Control
float tempCurrent = -10.0;
float tempTarget = 22.0;
```

Currently temperature is not use in anyway. This is merely a template for future expansion for now.

#define pin 27 to be the onewire bus

Instantiation of the onewire object to be the define above

Instantiation of the dallas temperature sensor to be the one wire bus device

`tempCurrent` and `tempTarget` are the current and target temperature of the sensor. `tempCurrent` actually doesn’t need initialization.

```c
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
```

Now we instantiate all objects needed to operate the machine with the variable we declared previously:

1. LED
2. Buzzer
3. 6ways valve for both inlet and outlet
4. Motor
5. Bathpump, currently no corresponding hardware
6. Digital level sensor for inside the tank and along the outlet tube
7. Analog level sensors are not used
8. The heating element using AC power
9. Joystick shield
10. Dpad interface as the UI
11. The cursor location on the screen is the user
12. The location displayed on the screen is the menu

# CP800.h

This header tab is made to contains classes and global variable for those classes in the CP800 series

```c
#include "pitches.h"
#define arrayLength(array) (sizeof((array))/sizeof((array)[0]))
#include <LiquidCrystal.h>
#include <EEPROM.h>
```

Libraries used in the classes : `pitches.h`, `EEPROM.h`, `LiquidCrystal.h`

`pitches.h`: has the buzzer value to make different notes and function to generate pre-defined tune

LiquidCrystal is the library for display on the LCD

EEPROM is the library for accessing the EEPROM on Arduino

`arrayLength` is to calculate the size of an array using sizeof()

```c
bool zero_crossed=0;
int maxcol=3; //maximum number of col to be display (shift colume by left and right)
int rowstack[8][2];//a matrix that stored the row value for both the user cursor and the menu map
int colstack[8][2]; //a matrix that stored the col value for both the user cursor and the menu map
int actionstack; // the variable to restore which action the menu is selected
String lcdStr[4] = {"", "", "", ""};
int ispageEnd = 0; //flag indicaitng the end of the menu page
int pagerow = 4; //default is four
```

`zero_crossed` is the flag to indicate whether the AC input of the heating has crossed zero. This allows a fixed energy cycle for the PWM cycle within a certain time error

`maxcol` is the variable that allows users to shift left and right in the menu to see different information

`rowstack` is the data matrix that stored the row coordinate of both the user cursor and menu map

`colstack` is the data matrix that stored the column coordinate of both the user cursor and menu map

`actionstack` is the value for the action that the machine is taking, this is normally on the last page in the menu, where the user has to pick a function or run a program. The previously two stacks are for the location of the menu through each layer of the selection on the menu.

`lcdStr` is the array of 4 strings to be displayed on the LCD

`ispageEnd` is the flag for indicating the menu had reached an end page, a page where you have to select an action and no more option to be select after that

`pagerow` is the number of rows on the current menu page. Usually 4 rows, given the screen has 4 rows, but main menu and program selection has more, and allow scrolling down

```c
//this is the view in which the LCD is looking at
struct camera{
  int col;
  int row;
  int row_size;
  int col_size;
};
```

The `camera` struct contain the coordinate of the camera and the size in each dimension to be seen by the camera. Imagine it to be the view range of a person on the map.

# Class UIcursor

```c
class UIcursor {
  private:
    byte* _inputsRef;
    byte _inputs;
    byte _Previnputs;
    int _rowlimit=3;
```

Private variables include:

`_inputsRef` is the pointer to the input variable

`_inputs` is the variable that take the new inputs

`_previnputs` is the variable that stored the previous inputs

`_rowlimit` is restricted to row 3 (4th row) , because cursor cannot move out of the screen

```c
    void limit(int *row, int *col){
      if (*row>_rowlimit) *row=_rowlimit;
      if (*row<0) *row=0;
      if (*col<0) *col=0;
    }
```

The private function `limit()` restricts the value of row and column between 0 to the `upperlimit`, so far only row has an upper limit for the cursor

```c
public:
    int row=0;
    int col=0;
    int layer=0;
```

`row`, `col`, `layer` fully describe the location of the cursor on the map

```c
    //pass the input pointer to the private variable
    UIcursor (byte* inputs){
      _inputsRef = inputs;
    }
```

Instantiate the class by passing a pointer of a byte

```c
    void begin(){
      //initiate inputs
      _inputs = *_inputsRef; //when begin, load the value of the input pointer to _inputs
      _Previnputs = _inputs; // initailise the previous as current inputs
```

Initialize the class by taking the input from the pointer and make previous input the same

```c
// can overwrite the current location of the cursor to any positon on the map
    void wrappoint (int wraprow, int wrapcol, int wraplayer){
      row=wraprow;
      col=wrapcol;
      layer=wraplayer;
    }
```

Public function to edit the current location of the cursor to any value

```c
// update cursor from the inputs given the number of row to be displayed and wehter it is a end page
    void Update(int isEnd, int displayrow){
      _inputs = *_inputsRef;
      _rowlimit = displayrow-1;
      // shift between menu layr with A and B
      // ULRDAB
      bool A = (_Previnputs>>A_shift & 1) & ~(_inputs>>A_shift & 1);
      bool B = (_Previnputs>>B_shift & 1) & ~(_inputs>>B_shift & 1);
      if (A){
        rowstack[layer][2] =row;
        colstack[layer][2] =col;
        //stop incrementing if page is an end page
        if (isEnd!=1){
          rowstack[layer][2] =row;
          layer +=1;
          // new coordinate for new layer
        }else{
          actionstack = row; // which row is pressed on the action page/end page
        }
        // return row and col anyway after pressing A, too hard to see respawn without changes, updated 202011130
        row = 0;
        col = 0;
        if(layer>3)layer=3;
      }else if (B){
        //use 0 to destroy the layer for returning operation
        rowstack[layer][2] = 0;
        colstack[layer][2] = 0;
        layer -=1;
        if(layer<0)layer=0;
        row = rowstack[layer][2];
        col = colstack[layer][2];
        //clear after unloading into the cursor positoin
        rowstack[layer][2] = 0;
        colstack[layer][2] = 0;
      }else{
```

The update function is the core function of the class. It updates the position of the cursor by reading and interpreting the buttons inputs, when the update is called.

The button shift defined in header will now be used to isolate the A and B button, these buttons confirm or cancel an action.

When press A:

1. Stored the current row and column position to the stack
2. If this is the end page, row value is the action option, if not, we increment the layer
3. Then reset row and column position to 0 as we are either doing a new action,
4. Since no page is beyond layer 3, restrict layer increment when reached end, this could be redundant if mapping and tracking is done better
   When press B:
5. Reset current position to zero in stack
6. Decrement layer
7. Load previous layer position
8. Clear the previous location from stack

```c
 }else{
        /*
         * row increment when the down button signal transit from 1 to 0
         * row decrement when the up button signal transite from 1 to 0
         *
         * commend switch to col if the menu allow colum
         *
         * non blocking operation for all direction (could be using in game mode)
         * ULRDAB
         */
        row += (_Previnputs>>Down_shift & 1) & ~(_inputs>>Down_shift & 1) & _inputs& 1;
        row -= (_Previnputs>>Up_shift & 1) & ~(_inputs>>Up_shift & 1) & _inputs& 1;
        // we may not need col position for the cursor
        col += (_Previnputs>>Right_shift & 1) & ~(_inputs>>Right_shift & 1) & (_inputs>>1 & 1);
        col -= (_Previnputs>>Left_shift & 1) & ~(_inputs>>Left_shift & 1) & (_inputs>>1 & 1);
        limit(&row,&col);
      }
      // restore previous inputs
      _Previnputs = _inputs;
    }
};
```

When press other buttons

1. Increment or decrement row value if press up and down while row shift bit is enabled (`_inputs&1`)
2. Increment or decrement column value if press left and right while row shift bit is enabled (`_inputs>>1&1`)
3. Check and limit row and column according to the boundary of the menu page
   Always, update input to previous input at the end

# Class UImap

This class is very similar to `UIcursor`, in fact, it could be position to generalise both `UImap` and `UIcursor` class into one class.

```c
class UImap{
  private:
    //map has a camera datatype to contain the dispaly size and location of the menu
    camera _mapCam;

    byte* _inputsRef;
    byte _inputs;
    byte _Previnputs;
    int _rowlimit=3; //default typical 4 row, 0-3

    void limit(int *row, int *col){
      if (*row>_rowlimit) *row=_rowlimit;
      if (*row<0) *row=0;
      if (*col<0) *col=0;
```

All except the inclusion of camera struct is the same as `UIcursor`. Camera structs allow `UImap` not only the position but the range of location that is visible

```c
    void begin(){
      _mapCam.row=0; //start at the top
      _mapCam.col=0; //start at the left
      _mapCam.row_size = 4; //default dispalying 4 row of character
      _mapCam.col_size = 19;//default dispalying 19 character
      //initiate inputs
      _inputs = *_inputsRef;
      _Previnputs = _inputs;
    }
```

Initialize class with camera values, and camera sizes are fixed

```c
void wrappoint (int wraprow, int wrapcol, int wraplayer)
```

Exact same function as `UIcursor`

```c
    void Update(int isEnd, int displayrow){
      _inputs = *_inputsRef;
      _rowlimit = displayrow-1;
      // shift between menu layr with A and B
      bool A = (_Previnputs>>A_shift & 1) & ~(_inputs>>A_shift & 1);
      bool B = (_Previnputs>>B_shift & 1) & ~(_inputs>>B_shift & 1);
      if (A){
        colstack[layer][1] =col;
        if (isEnd!=1){
          rowstack[layer][1] =row;
          layer +=1;
          // new coordinate for new layer
          row = 0;
          col = 0;
        }else{
          actionstack = row;
        }
        if(layer>3)layer=3;
```

Update mirror the `UIcursor`

```c
      }else{
      /*
        row += (_Previnputs>>Down_shift & 1) & ~(_inputs>>Down_shift & 1) & _inputs& 1;
        row -= (_Previnputs>>Up_shift & 1) & ~(_inputs>>Up_shift & 1) & _inputs& 1;
        // we may not need col position for the cursor
        col += (_Previnputs>>Right_shift & 1) & ~(_inputs>>Right_shift & 1) & (_inputs>>1 & 1);
        col -= (_Previnputs>>Left_shift & 1) & ~(_inputs>>Left_shift & 1) & (_inputs>>1 & 1);
        limit(&row,&col);
      }
      _mapCam.row = row;
      _mapCam.col = col;
      // restore previous inputs
      _Previnputs = _inputs;
    }
};
```

The camera will also be updated.

# Class Buzzer

This class required the `pitches.h` header

```c
  private:
    uint8_t _in_pin,_rh_pin,_rl_pin;//inputs, reference high, reference low
    int _init_volt,_init_rh,_init_rl; //initial reading of each pin
    int _new_volt,_new_rh,_new_rl,_dVolt; // new input of each pin, and a change of voltage value
    int _old_volt=0; //old voltage value
    int _threshold = 15;//default threshold to ignore noise is 9 over 1024 volt
    float _shift_ratio=0; //the rati of voltage shift over the refrence voltage range as a linear scale from initial volts to new volts
    int _ref_range;// range of reference voltage , reference high - reference low
    bool _button_reg_set=0; //default assume release
    bool _edgetrigger=0; //edge trigger flag
    long _edgetiming=0; //edge trigger timing
```

`_in_pin`, `_rh_pin`, `_rl_pin`, are the Dpad input pin, high voltage reference pin, low voltage reference pin respectively

`_init_volt`, `_init_rh`, `_init_rl`, are the initialise reading, in `Begin()` from the input pin, high voltage reference pin, and low voltage reference pin respectively

`_new_volt`, `_new_rh`, `_new_rl` are the new reading from the input pin, high voltage reference pin, and low voltage reference pin respectively

`_dVolt` is a variable to calcualte the difference between two votlage reading

`_old_volt`, is the `_new_volt` in the previous update

`_threshold` define the deadband in which the program ignore the fluctuation of the voltage reading in the input pin

`_shift_ratio` is a ratio to represent relative voltage change, the full equation wil be defined in `Update()`

`_ref_range` is the variable used to store the value between the high and low reference voltage

`_button_reg_set` is a flag is indicate whether a button is pressed, 0 is pressed, given input are pulled up

`_edgetrigger` is the flag for an edge has been triggered

`_edgetiming` is the timing when the edge triggered.

> :information_source: NOTE: might be neater to compress these pin reading into a data array, and the update operate could iterate through the variable instead of calling each variable individually.

```c
class Buzzer {
  private:
    uint8_t _buzz_pin; //which pin is the buzzer
    uint8_t _vol_pin; //the voltage of the buzzer (1 of two preset value)
    uint8_t _welcomeMelody[2] = {NOTE_B5,NOTE_A5}; // welcome tones
    uint8_t _welcomeMelodyDuration[2] = {250,250}; //duration for welcome tones
```

Buzzer has 4 private variables;
`_buzz_pin` contain the pin number for the buzzer
`_vol_pin`, controls the MOSFET that boost the current to the buzzer
`_welcomeMelody` is a two notes array that make noise when bootup,
`_welcomeMelodyDuration` is the timer period for each note in the welcome tune

```c
  public:
  //Constructor
    //constructor without volume pin
    Buzzer(uint8_t buzz_pin){
      _buzz_pin = buzz_pin;
    }
    //constructor with both pin and volume
    Buzzer(uint8_t buzz_pin,uint8_t vol_pin){
      _buzz_pin = buzz_pin;
      _vol_pin = vol_pin;
    }
```

Two constructors

1. Without volume control
2. With volume control

```c
// play any single note
    void play_Note(int Note, int duration){
      tone(_buzz_pin,Note,duration);
    }
    // play an array of notes
    int play_array(uint8_t Note_ary[], int note_len,uint8_t duration_ary[], int dura_len){
      //check either of them are empty
      if(note_len==0||dura_len==0){
        return 2; //type 2 error: empty inputs
      }
      // check if the duration matches the Note in size
      if (note_len != dura_len){
        return 1; //type 1: error array doesn't matches
      }
      for (int playnote=0; playnote<note_len; playnote++){
        //cychle thru each note in array with cooresponding duration
        tone(_buzz_pin,Note_ary[playnote],duration_ary[playnote]);
      }
      return 0;
    }
```

Play note function only play one note with one duration

Play array function cycle thru all the note in array and match the duration

```c
// rountine to play welcome tune
    void welcome(){
      play_array(_welcomeMelody,2,_welcomeMelodyDuration,2);
    }
    // routine to play nothing
    void no_note(){
      noTone(_buzz_pin);
    }
```

The `welcome()` subroutine plays the welcome tune using `play_array()`

There is a subroutine that play nothing

```c
    // inistilising the buzzer pins
    void begin(){
      pinMode(_buzz_pin, OUTPUT);
      pinMode(_vol_pin, OUTPUT);
    }
```

Initialize class by setup buzz and volume pin as output in Arduino

```c
    //write high
    void vol_HI(){
      digitalWrite(_vol_pin, HIGH);
    }
    //write low
    void vol_LO(){
      digitalWrite(_vol_pin, LOW);
    }
};
```

`vol_hi` function connects the buzzer ground with a low resistor value using MOSFET, low resistor more current thus louder

`vol_lo` function cut off the buzzer ground with a low resistor value using MOSFET

# Class Dpad_analog

```c
class Dpad_analog{
  //digital Dpad would be separate to avoid excessive memory allocation
  public:
    byte status_reg = 0b11111100; //button inputs are pulled high
    //status reg that show which button is being pressed
    //NOTE: the full voltage of the DAC is about 82.6% of the uC HIGH output

    //constructor
    // 10 bits analog input version , CP-800 use this
    Dpad_analog(uint8_t input_pin, uint8_t ref_high_pin, uint8_t ref_low_pin){
      _in_pin = input_pin;
      _rh_pin = ref_high_pin;
      _rl_pin = ref_low_pin;
    }
```

Dpad `status_reg` records the status of the Dpad which are the 6 buttons inputs plus row and column shift enable bit at the end

Constructor with inputs to `_in_pins`, two analog pin for the high logics voltage and low logics voltage

```c
    void begin(){
      pinMode(_in_pin, INPUT);
      pinMode(_rh_pin, INPUT_PULLUP);
      pinMode(_rl_pin, INPUT);
      _init_volt = analogRead(_in_pin);
      _init_rh = analogRead(_rh_pin);
      _init_rl = analogRead(_rl_pin);
     // _old_volt = _init_volt; //record init voltage input as previous voltage input
    }
```

Initialisation routine define

1. `_in_pin` as input, output from DAC IC
2. `_rh_pin` as input pulled up, for high voltage
3. `_rl_pin` as input, externally pulled down, for low voltage
4. Read all inputs pin to initialize values

```c
    // check if there is a update on Dpad inputs
    int checkupdate(){
       return(_old_volt>_new_volt+_threshold || _old_volt<_new_volt-_threshold);
    }
    int Ispressed(){
      return 1-_button_reg_set; //return 0 if pressed
    }
```

The `checkupdate()` routine return 1 when new value is `_threshold` difference from the old values

`Ispressed()` returns 0 when a button is pressed

# Future development

- Optimization of RAM usage
  - Remove global variables that are not used
  - More modularized code and use local variable.
  - Better way to store tune and menu option (mainly const chr/int)
- More buttons and better structure button classes
  - Currently the respond is are only 6 buttons, directions + AB, this should be expanded to respond to a more complex controller and allow more action from the user
  - Allow a more efficient way to quick travel to another location or return to previous location, A systematic set of coordinates in the mapping might help.
  - The structure for the mapping on the menu and cursor should remain separated, imagine the cursor is the user’s character, and it is navigating the menu as if it is an RPG. Both the POV of the environment and the chr have to react to the user’s inputs.
- Better ROM read/write addressing. Currently the ROM programs are referring to a set of fixed addresses. This could result in an imbalance number of read/write for some memory unit, and thus worn out those units quicker than others.
  - New writing methods should consider the health of each ROM unit and maximize their life by using dynamic indexing, to avoid overwriting existing ROM units.
  - The new method should also repeat old information in a new region. It would be ideal to reuse a step from another processing cycle than write a new step, since many step between different processing can be shared, such as rinse with water.
  - maybe using wear leveling technique to use each ROM cell evenly. However, this might nullify the ROM.update() function where data is only update when there is a change to it
  - Better still, to use a data compressing method that maximised reusing existing variables and trimmed data to be stored.
- Better code organization
  - Tabs can be combined/separated according to their function/hardware/other arrangement
  - There could be a classification of different header for different purpose, to further modalized the codes, this might allow an entire feature to be reuse in another project.
- UI
  - Generise `UIcursor` and `UImap` with a navigation class that has position value
