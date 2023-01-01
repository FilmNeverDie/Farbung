
#define model "CP-806"
#define version "1.16.2"
#define PCBver 9
// sense =0 for NO sensor, and =1 for NC sensor
#define OUTsense 1// change this to 1 when use the new flow sensor with the metal band and cable tie
#define INsense 0
/********************************************************
// see dev_log for all historical changes and patches //
********************************************************/
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


// touchscreen

#include <MCUFRIEND_kbv.h>
MCUFRIEND_kbv tft;       // hard-wired for UNO shields anyway.
#include <TouchScreen.h>

#define Orientation 1   //PORTRAIT = 0
#define textsize 2
//all pin has to be addigned thru the mcufriend_shield.h
#define YP A14  //must be an analog pin, use "An" notation!, position on breakout board is LCD_CS
#define XM A13  //  must be an analog pin, use "An" notation!, position on breakout board is LCD_RS
#define YM 23   // can be a digital pin, position on breakout board is LCD_D1
#define XP 22   // can be a digital pin, position on breakout board is LCD_D0
#define ROW_ONE 8
#define ROW_TWO 64
#define ROW_THREE 120
#define ROW_FOUR 176

#if (Orientation==0)
  #define TS_LEFT 901  // must be an analog pin, use "An" notation!
  #define TS_RT 128  // must be an analog pin, use "An" notation!
  #define TS_TOP 103   // can be a digital pin
  #define TS_BOT 903   // can be a digital pin
#elif(Orientation==1)
  #define TS_LEFT 103  // must be an analog pin, use "An" notation!
  #define TS_RT 903  // must be an analog pin, use "An" notation!
  #define TS_TOP 128   // can be a digital pin
  #define TS_BOT 901   // can be a digital pin
#endif

TouchScreen ts = TouchScreen(XP, YP, XM, YM, 300);
TSPoint tp;


#define MINPRESSURE 200
#define MAXPRESSURE 1000



/*
 * note for display usig touch screen
 * the old screen has 4 row, so we can have 60 pix each row 
 * however from visual inspection, text size 2 (12ptpx width by 8 px height *2)is sufficient for visibility
 * so at max we can have 15 rows and and 20 column
 * we would like to centre the menaul, most menus is 6 rows long, 
 * thus we could afford to use double row. 
 * given nobody like to look at the edge of the screen from top and bottom is useuse
 * 
 * the layout is yet to be review and readjust as of 20220928
 * 
 */


// Assign human-readable names to some common 16-bit color values:
#define BLACK   0x0000
#define BLUE    0x001F
#define RED     0xF800
#define GREEN   0x03E0
#define CYAN    0x07FF
#define MAGENTA 0xF81F
#define YELLOW  0xFFE0
#define WHITE   0xFFFF

#include "classes.h"
#include "CP800.h"

//LCD
//#include <LiquidCrystal.h>
//#define rs 42
//#define ee 43
//#define d4 44
//#define d5 45
//#define d6 46
//#define d7 47 //LCD Pin
//#define bl 36 
//
//LiquidCrystal lcd(rs, ee, d4, d5, d6, d7);

//display 
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
//joystick joystick(KEYA,KEYB,KEYC,KEYD, KEYK, JOYX, JOYY);
//Dpad_analog panel_UI(Dpad_in_pin, Dpad_refH_pin, Dpad_refL_pin);
onscreen_UI onscreen_UI(XM, YP, Orientation);

UIcursor user_navi(&UIcommend); 
UImap menu_navi(&UIcommend);

void setup() { //********************************************set up
  
//  pinMode(bl,OUTPUT);
//  digitalWrite(bl,HIGH);
  //button
//  pinMode(buttonPin, INPUT);

  //serial
  Serial.begin(115200);
  //load data struct of processing
  sketchPrograms();
  delay(100); 
  //LCD << redundant
//  lcd.begin(20, 4);
//  lcd.setCursor(0, 0);
//  lcd.print(model);
//  lcd.print(" ");
//  lcd.print(version);

  tft.reset();
  uint16_t ID = tft.readID();
  tft.begin(ID);
  tft.setRotation(Orientation); //set screen orientation: 0=portait ,1=landscape
  tft.fillScreen(BLACK); //show black screen
  tft.setTextSize(textsize); //12 wide by 16 tall
  
  tft.setTextColor(YELLOW, BLACK);
  tft.setCursor(0, ROW_ONE);
  tft.print(model);
  tft.print(" ");
  tft.print(version);
//  lcd.setCursor(0, 1);
//  lcd.print("FND");
  tft.setCursor(0, ROW_TWO);
  tft.print("FND");
  //Initialising Message
//  lcd.setCursor(0, 2);
//  lcd.print("Initialising..."); << redundant
  tft.fillRect(0, ROW_THREE, 240, 56, BLACK);
  tft.setCursor(0, ROW_THREE);
  tft.print("Initialising");
  // touchescreen


 //initiate UI controls
  //joystick.Begin();
  //panel_UI.begin();
  
  UIinputs = onscreen_UI.status_reg;
  user_navi.begin();
  menu_navi.begin();
  //calibreate A0 reading for buttons
  //press any key when booting up
//  if (analogRead(buttonPin) > 400) {
//    calibreateButtonPinMark();
//    buzz.play_Note(500,500);
//  }


//  lcd.clear(); //lcd clear << redundant

  Serial.print(PCBver);
  //addrShift
  randomSeed(analogRead(A13));
  addrShift = random(0, strByteLen);
  Serial.print("add");
  Serial.print("rShift: " + addrShift);

  delay(iniDelay);

  //load actuators
  
  //Buzzer
//  lcd.setCursor(0, 3); //<< redundant
//  lcd.print("buzz...          ");//<< redundant
  tft.fillRect(0, ROW_THREE, 240, 56, BLACK);
  tft.setCursor(0, ROW_THREE);
  tft.print("buzz");
  buzz.begin();
  buzz.vol_HI();
  buzz.play_Note(988,100);

  //LED
//  lcd.setCursor(0, 3);//<< redundant
//  lcd.print("LED...           ");//<< redundant
  tft.fillRect(0, ROW_THREE, 240, 56, BLACK);
  tft.setCursor(0, ROW_THREE);
  tft.print("LED");
//  Led.begin();
  Led.OFF();


  //addChem
//  lcd.setCursor(0, 3);
//  lcd.print("addChem...       ");
  tft.fillRect(0, ROW_THREE, 240, 56, BLACK);
  tft.setCursor(0, ROW_THREE);
  tft.print("add");
  tft.print("Chem");
  addChem.Begin();
  addChem.OFF(1);

  //removeChem
//  lcd.setCursor(0, 3);
//  lcd.print("removeChem...    ");
  tft.fillRect(0, ROW_THREE, 240, 56, BLACK);
  tft.setCursor(0, ROW_THREE);
  tft.print("remove");
  tft.print("Chem");
  removeChem.Begin();
  removeChem.OFF(1);

  //agitationMotor
//  lcd.setCursor(0, 3);
//  lcd.print("agitationMotor...");
  tft.fillRect(0, ROW_THREE, 240, 56, BLACK);
  tft.setCursor(0, ROW_THREE);
  tft.print("agitationMotor");
  agitationMotor.Begin();

  //bathPump
//  lcd.setCursor(0, 3);
//  lcd.print("bathPump...      ");
  tft.fillRect(0, ROW_THREE, 240, 56, BLACK);
  tft.setCursor(0, ROW_THREE);
  tft.print("bathPump");
  bathPump.Begin();

  //tankLevel
//  lcd.setCursor(0, 3);
//  lcd.print("tankLevel...     ");
  tft.fillRect(0, ROW_THREE, 240, 56, BLACK);
  tft.setCursor(0, ROW_THREE);
  tft.print("tank");
  tft.print("Level");
  
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
//  lcd.setCursor(0, 3);
//  lcd.print("soakLevel...     ");
  tft.fillRect(0, ROW_THREE, 240, 56, BLACK);
  tft.setCursor(0, ROW_THREE);
  tft.print("soak");
  tft.print("Level");
  soakLevel.begin();
  
  while (smothingInitIndex < 10) {
    Serial.println(soakLevel.isOFF());
    smothingInitIndex++;
  }
  smothingInitIndex = 0;


  //init temp sensor
//  lcd.setCursor(0, 3);
//  lcd.print("temp...          ");
  tft.fillRect(0, ROW_THREE, 240, 56, BLACK);
  tft.setCursor(0, ROW_THREE);
  tft.print("temp");
  sensors.begin();

  delay(100);

  //heater
//  lcd.setCursor(0, 3);
//  lcd.print("heater...");
  tft.fillRect(0, ROW_THREE, 240, 56, BLACK);
  tft.setCursor(0, ROW_THREE);
  tft.print("heater");
  heater.Begin();

  //refresh lcd
  tft.fillRect(0, ROW_THREE, 240, 56, BLACK);
  tft.setCursor(0, ROW_THREE);
  tft.print("loading ROM");

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

//  lcd.setCursor(0, 2);
//  lcd.print("Press Any Key       ");
//  lcd.setCursor(0, 3);
//  lcd.print("to Start...         ");
  tft.fillRect(0, ROW_TWO, 240, 56, BLACK);
  tft.setCursor(0, ROW_TWO);
  tft.print("Initialising");
  tft.print(" Done");
  tft.fillRect(0, ROW_TWO, 240, 56, BLACK);
  tft.setCursor(0, ROW_THREE);
  tft.print("Starting");
  delay(1000);

  //initial menu page
  lcdWrite1();

  // update the screen with the fixed buttons UI, 20221001
  // and put the respective symbol at the middle of each button, which is XY middle - half of font height and half of font wide   
  int symbolsize = 2;
  tft.setTextSize(symbolsize);
  tft.setTextColor(WHITE, BLACK); // text color is black and on white bg
  
//  tft.fillRect(tft.width()-80, 0, 80, 40, WHITE); //up button
  tft.drawRect(tft.width()-80, 0, 80, 40, WHITE); //
  tft.setCursor(tft.width()-40-symbolsize*3, 20-symbolsize*4);
  tft.print(char(30));

  
//  tft.fillRect(tft.width()-40, 40, 40, 80, WHITE); // right
  tft.drawRect(tft.width()-40, 40, 40, 80, WHITE);
  tft.setCursor(tft.width()-20-symbolsize*3, 80-symbolsize*4);
  tft.print(char(16));

 
 // tft.fillRect(tft.width()-80, 40, 40, 80, WHITE); // left
  tft.drawRect(tft.width()-80, 40, 40, 80, WHITE);
  tft.setCursor(tft.width()-60-symbolsize*3, 80-symbolsize*4);
  tft.print(char(17));

  
 // tft.fillRect(tft.width()-80, tft.height()-120, 80, 40, WHITE); // down
  tft.drawRect(tft.width()-80, tft.height()-120, 80, 40, WHITE);
  tft.setCursor(tft.width()-40-symbolsize*3, tft.height()-100-symbolsize*4);
  tft.print(char(31));

  tft.setTextColor(WHITE, RED); // text color is WHITE and on BLUE bg
  tft.fillRect(tft.width()-80, tft.height()-80, 40, 80, RED); // Back 
  tft.drawRect(tft.width()-80, tft.height()-80, 40, 80, RED);
  tft.setCursor(tft.width()-60-symbolsize*3, tft.height()-40-symbolsize*4);
  tft.print('B');

  tft.setTextColor(WHITE, GREEN); // text color is WHITE and on GREEN bg
  tft.fillRect(tft.width()-40, tft.height()-80, 40, 80, GREEN); // enter
  tft.drawRect(tft.width()-40, tft.height()-80, 40, 80, GREEN);
  tft.setCursor(tft.width()-20-symbolsize*3, tft.height()-40-symbolsize*4);
  tft.print('A');

  //reset text color
  tft.setTextSize(textsize);
  tft.setTextColor(YELLOW, BLACK);
}

int refresh;

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
  
  tp = ts.getPoint();
  onscreen_UI.begin();
   bool UIchanged = onscreen_UI.Update(tp) ; //update is 1, so either update will change this to 0,, joystick.Update() & panel_UI.Update() &
   DEBUG_PRINT (UIchanged);
   if (UIchanged==0){
    refresh =2;
   }

  
  
 // bool UIchanged = panel_UI.Update(); // update input buttons, retunr if input are changed
  //byte buttons = panel_UI.getinputs(); // get the actual value of the buttons
  // bool UIchanged = joystick.Update();
  // byte buttons = joystick.status_reg & 0xFC;
  

   byte buttons =  onscreen_UI.status_reg;// & joystick.status_reg;// all default signla are 1 , so A & B wil take either one method or the other
   DEBUG_PRINT(" ");
   DEBUG_PRINT(onscreen_UI.status_reg);
   
  // update as often as input

  // debounce inputs button with a change that last more than two cycle
  int debounce_change = debouncer(int(buttons), &de_button); //return if there is a chang ein debounce signal
  UIcommend = de_button | 1; // enebale  row but not col shift
  DEBUG_PRINT(" ");
  DEBUG_PRINT(UIcommend);
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
  
  if (UIchanged==0 || refresh !=0){
   refresh -=1;
   lcdWrite1(); //write screen according to previous determined state 
   
  }
//  panel_UI.getvolts(&A, &B, &C);
//  Serial.print(" ");
//  Serial.print(A);
//  Serial.print(" ");
//  Serial.print(B);
//  Serial.print(" ");
//  Serial.print(C);
//  Serial.println(" ");
  DEBUG_PRINT(" ");
  
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
  DEBUG_PRINT(drumempty.isOFF());
  DEBUG_PRINT("\n");

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

  // static int changed=0; //<<redundant
  
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
