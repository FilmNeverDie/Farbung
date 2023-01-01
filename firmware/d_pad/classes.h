
#include "Arduino.h"
#define iniDelay 200

class led {
  private:
    int gPin = 32;
    int rPin = 34;

  public:
    void Begin() {
      pinMode(gPin, OUTPUT);
      pinMode(rPin, OUTPUT);
      Serial.println("LED Begin");
      digitalWrite(gPin, HIGH);
      digitalWrite(rPin, HIGH);

      delay(iniDelay);
      digitalWrite(gPin, LOW);
      digitalWrite(rPin, LOW);
      delay(iniDelay);

    }

    void gON() {
      digitalWrite(gPin, HIGH);
    }

    void gOFF() {
      digitalWrite(gPin, LOW);
    }

    void rON() {
      digitalWrite(rPin, HIGH);
    }

    void rOFF() {
      digitalWrite(rPin, LOW);
    }

};

class buzz {

  private:
    int pin ;
    int buzTone = 262;

  public:

    void Begin() {
      pinMode(pin, OUTPUT);
      Serial.println("buzz Begin");
      //delay(iniDelay);
      tone(pin, buzTone, 500);
    }

    void Long() {
      tone(pin, buzTone, 200);
    }

    void Short() {
      tone(pin, buzTone, 50);
    }

};
// redundent class, since both add valve and remove valve use the same control
class addChem {
  private:
    int pump = 27;
    int valve1 = 14;
    int valve2 = 16;
    int valve3 = 18;
    int valve4 = 20;
    int valve5 = 22;
    int valve6 = 24;

    unsigned long startTime = 0;

    int timeLimit = 180;

  public:

    void Begin() {
      pinMode(pump, OUTPUT);
      pinMode(valve1, OUTPUT);
      pinMode(valve2, OUTPUT);
      pinMode(valve3, OUTPUT);
      pinMode(valve4, OUTPUT);
      pinMode(valve5, OUTPUT);
      pinMode(valve6, OUTPUT);

      Serial.println("AddChem Begin");
      /*
            digitalWrite(pump, HIGH);
            delay(iniDelay / 2);
            digitalWrite(pump, LOW);
            delay(iniDelay / 2);
            digitalWrite(valve1, HIGH);
            delay(iniDelay / 2);
            digitalWrite(valve1, LOW);
            delay(iniDelay / 2);
            digitalWrite(valve2, HIGH);
            delay(iniDelay / 2);
            digitalWrite(valve2, LOW);
            delay(iniDelay / 2);
            digitalWrite(valve3, HIGH);
            delay(iniDelay / 2);
            digitalWrite(valve3, LOW);
            delay(iniDelay / 2);
            digitalWrite(valve4, HIGH);
            delay(iniDelay / 2);
            digitalWrite(valve4, LOW);
            delay(iniDelay / 2);
            digitalWrite(valve5, HIGH);
            delay(iniDelay / 2);
            digitalWrite(valve5, LOW);
            delay(iniDelay / 2);
            digitalWrite(valve6, HIGH);
            delay(iniDelay / 2);
            digitalWrite(valve6, LOW);
            delay(iniDelay / 2);
      */
    }

    void ON(int port) {
      switch (port) {
        case 1:
          Serial.println("addChem Port 1 ON");
          digitalWrite(valve1, HIGH);
          delay(100);
          digitalWrite(pump, HIGH);
          delay(10);
          break;

        case 2:
          Serial.println("addChem Port 2 ON");
          digitalWrite(valve2, HIGH);
          delay(100);
          digitalWrite(pump, HIGH);
          delay(10);
          break;

        case 3:
          Serial.println("addChem Port 3 ON");
          digitalWrite(valve3, HIGH);
          delay(100);
          digitalWrite(pump, HIGH);
          delay(10);
          break;

        case 4:
          Serial.println("addChem Port 4 ON");
          digitalWrite(valve4, HIGH);
          delay(100);
          digitalWrite(pump, HIGH);
          delay(10);
          break;

        case 5:
          Serial.println("addChem Port 5 ON");
          digitalWrite(valve5, HIGH);
          delay(100);
          digitalWrite(pump, HIGH);
          delay(10);
          break;

        case 6:
          Serial.println("addChem Port 6 ON");
          digitalWrite(valve6, HIGH);
          delay(100);
          digitalWrite(pump, HIGH);
          delay(10);
          break;
      }

      startTime = millis() / 1000;
    }

    void OFF(int port) {
      switch (port) {
        case 1:
          Serial.println("addChem Port 1 OFF");
          digitalWrite(pump, LOW);
          delay(100);
          digitalWrite(valve1, LOW);
          delay(10);
          break;

        case 2:
          Serial.println("addChem Port 2 OFF");
          digitalWrite(pump, LOW);
          delay(100);
          digitalWrite(valve2, LOW);
          delay(10);
          break;

        case 3:
          Serial.println("addChem Port 3 OFF");
          digitalWrite(pump, LOW);
          delay(100);
          digitalWrite(valve3, LOW);
          delay(10);
          break;

        case 4:
          Serial.println("addChem Port 4 OFF");
          digitalWrite(pump, LOW);
          delay(100);
          digitalWrite(valve4, LOW);
          delay(10);
          break;

        case 5:
          Serial.println("addChem Port 5 OFF");
          digitalWrite(pump, LOW);
          delay(100);
          digitalWrite(valve5, LOW);
          delay(10);
          break;

        case 6:
          Serial.println("addChem Port 6 OFF");
          digitalWrite(pump, LOW);
          delay(100);
          digitalWrite(valve6, LOW);
          delay(10);
          break;
      }
      startTime = 0;
    }

    bool State(int port) {
      switch (port) {
        case 1:
          return digitalRead(valve1);
          break;
        case 2:
          return digitalRead(valve2);
          break;
        case 3:
          return digitalRead(valve3);
          break;
        case 4:
          return digitalRead(valve4);
          break;
        case 5:
          return digitalRead(valve5);
          break;
        case 6:
          return digitalRead(valve6);
          break;
      }
    }

    bool tooLong() { //temprarily disable this function

      return 0;

    }
};

class SixWay_valve {
  private:
    uint8_t _pump,_s1,_s2,_s0;
//    int valve1 = 15;
//    int valve2 = 17;
//    int valve3 = 19;
//    int valve4 = 21;
//    int valve5 = 23;
//    int valve6 = 25;

    unsigned long startTime = 0;

    int timeLimit = 180;

  public:
    SixWay_valve (uint8_t S0,uint8_t S1,uint8_t S2,uint8_t pump){
      _s0 = S0;
      _s1 = S1;
      _s2 = S2;
      _pump = pump;
    }
    void Begin() {
      pinMode(_pump, OUTPUT);
      digitalWrite(_pump,HIGH); //pump pin high to turn OFF
      pinMode(_s0, OUTPUT);
      pinMode(_s1, OUTPUT);
      pinMode(_s2, OUTPUT);
      digitalWrite(_s0,LOW);
      digitalWrite(_s1,LOW);
      digitalWrite(_s2,LOW);

      //Serial.println("RemoveChem Begin");
      /*
            digitalWrite(pump, HIGH);
            delay(iniDelay / 2);
            digitalWrite(pump, LOW);
            delay(iniDelay / 2);
            digitalWrite(valve1, HIGH);
            delay(iniDelay / 2);
            digitalWrite(valve1, LOW);
            delay(iniDelay / 2);
            digitalWrite(valve2, HIGH);
            delay(iniDelay / 2);
            digitalWrite(valve2, LOW);
            delay(iniDelay / 2);
            digitalWrite(valve3, HIGH);
            delay(iniDelay / 2);
            digitalWrite(valve3, LOW);
            delay(iniDelay / 2);
            digitalWrite(valve4, HIGH);
            delay(iniDelay / 2);
            digitalWrite(valve4, LOW);
            delay(iniDelay / 2);
            digitalWrite(valve5, HIGH);
            delay(iniDelay / 2);
            digitalWrite(valve5, LOW);
            delay(iniDelay / 2);
            digitalWrite(valve6, HIGH);
            delay(iniDelay / 2);
            digitalWrite(valve6, LOW);
            delay(iniDelay / 2);
      */
    }

    void ON(int port) {

      startTime = millis() / 1000;
      if(port<7 && port >0){
        digitalWrite(_s0, port&0b00000001);//LSB bit of port
        digitalWrite(_s1, (port&0b00000010) >>1);
        digitalWrite(_s2, (port&0b00000100) >>2);
        delay(100);
        digitalWrite(_pump, LOW);
        delay(10);
      } else{
        //error in correct port inputs
      }
      

    
//      switch (port) {
//        case 1:
//          Serial.println("removeChem Port 1 ON");
//          digitalWrite(valve1, HIGH);
//          delay(100);
//          digitalWrite(_pump, HIGH);
//          delay(10);
//          break;
//
//        case 2:
//          Serial.println("removeChem Port 2 ON");
//          digitalWrite(valve2, HIGH);
//          delay(100);
//          digitalWrite(_pump, HIGH);
//          delay(10);
//          break;
//
//        case 3:
//          Serial.println("removeChem Port 3 ON");
//          digitalWrite(valve3, HIGH);
//          delay(100);
//          digitalWrite(_pump, HIGH);
//          delay(10);
//          break;
//
//        case 4:
//          Serial.println("removeChem Port 4 ON");
//          digitalWrite(valve4, HIGH);
//          delay(100);
//          digitalWrite(_pump, HIGH);
//          delay(10);
//          break;
//
//        case 5:
//          Serial.println("removeChem Port 5 ON");
//          digitalWrite(valve5, HIGH);
//          delay(100);
//          digitalWrite(_pump, HIGH);
//          delay(10);
//          break;
//
//        case 6:
//          Serial.println("removeChem Port 6 ON");
//          digitalWrite(valve6, HIGH);
//          delay(100);
//          digitalWrite(_pump, HIGH);
//          delay(10);
//          break;
//      }

      startTime = millis() / 1000;
    }

    void OFF(int port) {

      startTime = 0;
      if(port<7 && port >0){
        digitalWrite(_pump, HIGH);
        delay(100);
        digitalWrite(_s0, LOW);// turn everything off
        digitalWrite(_s1, LOW);
        digitalWrite(_s2, LOW);
        delay(10);
      } else{
        //error in correct port inputs
      }
      
//      switch (port) {
//        case 1:
//          Serial.println("removeChem Port 1 OFF");
//          digitalWrite(_pump, LOW);
//          delay(100);
//          digitalWrite(valve1, LOW);
//          delay(10);
//          break;
//
//        case 2:
//          Serial.println("removeChem Port 2 OFF");
//          digitalWrite(_pump, LOW);
//          delay(100);
//          digitalWrite(valve2, LOW);
//          delay(10);
//          break;
//
//        case 3:
//          Serial.println("removeChem Port 3 OFF");
//          digitalWrite(_pump, LOW);
//          delay(100);
//          digitalWrite(valve3, LOW);
//          delay(10);
//          break;
//
//        case 4:
//          Serial.println("removeChem Port 4 OFF");
//          digitalWrite(_pump, LOW);
//          delay(100);
//          digitalWrite(valve4, LOW);
//          delay(10);
//          break;
//
//        case 5:
//          Serial.println("removeChem Port 5 OFF");
//          digitalWrite(_pump, LOW);
//          delay(100);
//          digitalWrite(valve5, LOW);
//          delay(10);
//          break;
//
//        case 6:
//          Serial.println("removeChem Port 6 OFF");
//          digitalWrite(_pump, LOW);
//          delay(100);
//          digitalWrite(valve6, LOW);
//          delay(10);
//          break;
//      }
      startTime = 0;
    }

    int State(int port) {

       // return (digitalRead(_s2)<<2)|(digitalRead(_s1)<<1)|(digitalRead(_s0));
     int active_State = (digitalRead(_s2)<<2)|(digitalRead(_s1)<<1)|(digitalRead(_s0));
     return active_State==port;
//      switch (port) {
//        case 1:
//          return digitalRead(valve1);
//          break;
//        case 2:
//          return digitalRead(valve2);
//          break;
//        case 3:
//          return digitalRead(valve3);
//          break;
//        case 4:
//          return digitalRead(valve4);
//          break;
//        case 5:
//          return digitalRead(valve5);
//          break;
//        case 6:
//          return digitalRead(valve6);
//          break;
//      }
    }

    bool tooLong() { //temprarily disable this function

      return 0;

    }
};


class agitationMotor {
  private:
    uint8_t _ON = 7; //HIGH to forwatrd
    uint8_t _DIR = 9; //HIGH to reverse
    uint8_t _PWMPin = 4;

    int _speed[3] = {255, 125, 78};

  public:
    agitationMotor (uint8_t on, uint8_t dir, uint8_t PWM){
      _ON = on;
      _DIR = dir;
      _PWMPin = PWM;
    }
    void Begin() {
      pinMode(_ON, OUTPUT);
      pinMode(_DIR, OUTPUT);
      pinMode(_PWMPin, OUTPUT);
      Serial.println("Motor Begin");
      digitalWrite(_ON, LOW);
      delay(iniDelay);
      digitalWrite(_DIR, LOW);
      delay(iniDelay);
      digitalWrite(_DIR, HIGH);
      digitalWrite(_ON, HIGH);
    }

    void Forward(int i) {
      analogWrite(_PWMPin, _speed[i]);
      digitalWrite(_ON, LOW);
      digitalWrite(_DIR, LOW);
      //Serial.print("Motor Forward - Speed: ");
      //Serial.println(i);
    }

    void Backward(int i) {
      analogWrite(_PWMPin, _speed[i]);
      digitalWrite(_ON, LOW);
      digitalWrite(_DIR, HIGH);
      //Serial.print("Motor Backward - Speed: ");
      //Serial.println(i);
    }

    void Stop() {
      analogWrite(_PWMPin, 0);
      digitalWrite(_ON, HIGH);
      digitalWrite(_DIR, HIGH);
      //Serial.println("Motor Stop");

    }

    int State() {
      return (digitalRead(_ON)<<1) + digitalRead(_DIR);
    }
};

class bathPump {
  private:
    int _pin;

  public:
    bathPump(int pin){
      _pin = pin;
    }
    void Begin() {
      pinMode(_pin, OUTPUT);
      Serial.println("bathPump Begin");
//      digitalWrite(_pin, HIGH);
//      delay(iniDelay);
//      digitalWrite(_pin, LOW);
//      delay(iniDelay);
    }

    void ON() {
      digitalWrite(_pin, HIGH);
      Serial.println("bathPump ON");

    }

    void OFF() {
      digitalWrite(_pin, LOW);
      Serial.println("bathPump OFF");

    }



};


class AC_heater {
  private:
   uint8_t _heat_pin;
   uint8_t _AC_zero=0;
   int _AC_rectified;
   bool _zero_crossed;
   long _heat_start;
  public:
    AC_heater (uint8_t heat_pin){
      _heat_pin = heat_pin;
    }
    AC_heater (uint8_t heat_pin, uint8_t AC_zero){
      _heat_pin = heat_pin;
      _AC_zero = AC_zero;
    }
    void Begin() {
      pinMode(_heat_pin, OUTPUT);
      Serial.println("Heater Begin");
      if(_AC_zero){
        pinMode(_AC_zero, INPUT);
        _AC_rectified = digitalRead(_AC_zero);//initialise zero crossing state
      }
    }

    int readRectified(){
      _AC_rectified = digitalRead(_AC_zero); //update zero crossing state
    }

    bool zeroCrossed(){
      bool trigger=0;
      // return 1 if zero crossing pin change from 0 to 1
      if(_AC_rectified < digitalRead(_AC_zero)) {
        _zero_crossed = 1;
        _heat_start = millis();
        trigger=1;
      }
      readRectified(); //update zero crossing state
      return trigger;
    }
    void ON() {
      digitalWrite(_heat_pin, HIGH);
      Serial.println("Heater On");

    }

    void OFF() {
      digitalWrite(_heat_pin, LOW);
      Serial.println("Heater OFF");

    }
    void PWM_control(int *on_time, int cycle_time){
      // cycle time at the frequency of 50-60Hz
      if(*on_time>cycle_time)*on_time=cycle_time;
      // ideal PWM = on_time/cycle_time *100; 
      if (_zero_crossed){
        // turn on the heater on during on time from start
        if((_heat_start + *on_time)  > millis()){
          ON();
        }else{
          OFF();
          _zero_crossed=0; //reset flag
        }
      } 
    }
    bool State() {
      return digitalRead(_heat_pin);
    }
};
//class tank level and soak level can be modularised properly 

class digilevel{
/*
 * as of the new version of CP800, level sensor are using digital signal
 */
  private:
    int _pin;
    int _type=0; //indicate either NO or NC, default 0
    int * _FIFO_buffer;
    int _FIFO_index=0;
    float _sampleSum=0;
    int _sampleSize=1;
    int _lvThreshold; // the number of sample that is ON
    
  public:
    digilevel(int pin, int sample_size, int type){
      _pin = pin;
      _sampleSize = sample_size;
      _type=type; //  0 = NO, and i = NC
    }
    // not specify sample will be treated as one sample only
    digilevel(int pin){
      _pin = pin;
      _sampleSize = 1;
      
    }

    void begin(){
      pinMode(_pin,INPUT);
      _FIFO_buffer = new int[_sampleSize];
      for (int _i=0; _i<_sampleSize;_i++){
        _FIFO_buffer[_i]=1; // initate singla to pulled up
      }
      _lvThreshold = ceil(0.8*_sampleSize);
    }
    void setThreshold(int thres){
      _lvThreshold = thres;
    }
    int getThreshold(){
      return _lvThreshold;
    }
    void queue(){
      //update the FIFO queue of the sample
      _sampleSum -= _FIFO_buffer[_FIFO_index];
      _FIFO_buffer[_FIFO_index] = _type? _type - digitalRead(_pin): digitalRead(_pin);
      _sampleSum += _FIFO_buffer[_FIFO_index];
      _FIFO_index++;
      // reset index if all sample are updated
      if (_FIFO_index >= _sampleSize) {
        _FIFO_index = 0;
      }
    }
    float getSum(){
      return _sampleSum;
    }
    float average(){
      return float(_sampleSum/_sampleSize);
    }
    bool isON(){
      return (abs(_sampleSum)>=_lvThreshold);
    }
    bool isOFF(){
      return (abs(_sampleSum)<_lvThreshold);
    }
};

class analoglevel{
/*
 * as of the new version of CP800, level sensor are using digital signal
 */
  private:
    int _pin;
    int * _FIFO_buffer;
    int _FIFO_index=0;
    int _sampleSum=0;
    int _sampleSize=1;
    int _lvThreshold; // the number of sample that is ON

  public:
    analoglevel(int pin, int sample_size){
      _pin = pin;
      _sampleSize = sample_size;
    }
    // not specify sample will be treated as one sample only
    analoglevel(int pin){
      _pin = pin;
      _sampleSize = 1;
    }

    void begin(){
      pinMode(_pin,INPUT);
      _FIFO_buffer = new int[_sampleSize];
      _lvThreshold = 220;
    }
    void setThreshold(int thres){
      _lvThreshold = thres;
    }
    int getThreshold(){
      return _lvThreshold;
    }
    void queue(){
      //update the FIFO queue of the sample
      _sampleSum -= _FIFO_buffer[_FIFO_index];
      _FIFO_buffer[_FIFO_index] = analogRead(_pin);
      _sampleSum += _FIFO_buffer[_FIFO_index];
      _FIFO_index++;
      // reset index if all sample are updated
      if (_FIFO_index >= _sampleSize) {
        _FIFO_index = 0;
      }
    }
    float average(){
      return float(_sampleSum/_sampleSize);
    }
    bool isON(){
      return (average()>=_lvThreshold);
    }
    bool isOFF(){
      return (average()<_lvThreshold);
    }
};
class tankLevel {
  private:
    int pin1 = A1;
    int smoothing1Total;
    int smoothing1Index;
    int smoothing1Reading[10];

    int pin2 = 8;
    int smoothing2Total;
    int smoothing2Index;
    int smoothing2Reading[5];

  public:
    //constructor
    tankLevel (){

      
    }
  
    void Begin() {
      pinMode(pin1, INPUT);
      pinMode(pin2, INPUT);
      Serial.println("tankLevel Begin");
      delay(iniDelay);
    }

    bool isFull() {
      /*
       * index increase at every call, 
       * the buffer of reading is a first in first up array
       * it will remove the previous reading in the order of the index
       * then load the new reading into the sae index before incrementing
       * to the next index number
       * 
       */
      smoothing1Total -= smoothing1Reading[smoothing1Index];
      smoothing1Reading[smoothing1Index] = analogRead(pin1);
      smoothing1Total += smoothing1Reading[smoothing1Index];
      smoothing1Index ++;

      if (smoothing1Index >= 10) {
        smoothing1Index = 0;
      }

      if (smoothing1Total / 10 < 220) {
        return 1;
      } else {
        return 0;
      }

    }
    bool isEmpty() {

      smoothing2Total -= smoothing2Reading[smoothing2Index];
      smoothing2Reading[smoothing2Index] = analogRead(pin2);
      smoothing2Total += smoothing2Reading[smoothing2Index];
      smoothing2Index ++;

      if (smoothing2Index >= 5) {
        smoothing2Index = 0;
      }

      if (smoothing2Total <= 2) {
        return 1;
      } else {
        return 0;
      }

    }

};

class soakLevel {
  private:
    int pin = A3;
    int smoothingTotal;
    int smoothingIndex;
    int smoothingReading[5];
    bool output;

  public:
    void Begin() {
      pinMode(pin, INPUT);
      Serial.println("soakLevel Begin");
      delay(iniDelay);
    }

    bool isEnough() {

      smoothingTotal -= smoothingReading[smoothingIndex];
      smoothingReading[smoothingIndex] = analogRead(pin);
      smoothingTotal += smoothingReading[smoothingIndex];
      smoothingIndex ++;

      if (smoothingIndex >= 5) {
        smoothingIndex = 0;
      }

      if (smoothingTotal < 2000) {
        output = 1;
      } else if (smoothingTotal > 5000) {
        output = 0;
      }

      return output;
    }
};


/*
 * old protocol
 * all processes are store using string separate by /
 * parameter are recorded in a fxied order and value after each step
 * 
 * for exmaple
 * "$BW_10min/22|soak/6/60/5/0|dev/1/600/5/1|rinse/6/60/5/0|fix/2/600/2/0|rinse/6/60/5/0|hypo/5/180/4/0|rinse/6/180/5/0|";
 * 
 *  new protocol for progrom using numerical data
 *  the process are read from SD/eeprom/memoery device as byte and decode the numverical data for each 
 *  unlike the old protocol where multile chr (8bits) are required to store a small value for example 10 = two chr = 16bits
 *  the new protocol could read value in a much more compact form, 8 bit allow value up to +/- 127
 *  
 *  The name of the process would still require to be stored, however for each step of the process, they are defined by the
 *  chemical being usedm, these step could be numerically representated using code, or step ID
 *  
 *  each progress will be made up by multiple steps, this length could be an arbritary number defined by the user
 *  
 *  data type: process
 *  Name of process = string
 *  duration = int16_t 
 *  numberofstep = int8_t
 *  program = step[numberofstep]; 
 *  
 *  data type: step
 *  stepcode = int8_t; 
 *  duration = int16_t;
 *  inputtank = int8_t;  
 *  outputtank = int8_t
 *  push = int8_t
 *  
 *  StepCode table
 *  0 end - stop process and clear all
 *  1 soak
 *  2 rinse
 *  3 fix
 *  4 hypo
 *  5 dev 
 *   
 *  const char* const stepName[] = {"end","soak","rinse","fix", "hypo", "dev'};
 *  
 */

//note that I prefer to use struct for datatype (simple memory allocation), this can be done
//in classes, if anyone need to have more functionality on the parameter of the step/process type
struct processStep {

  //as of 2002/03/06, all default value is 0, so that editing can avoid invalid values

  // each step has exactly 6 bytes
uint8_t stepcode=0; // code that representing different process step, see stepName for the steps
uint8_t inputtank=0;  // input tank ID, self explaning
uint16_t duration=0; // duration of the step, self explaning
uint8_t outputtank=0; // output tank ID, self explaning
int8_t push=0; /*
            whether the step can be push or not, note that arduino use 8 bit for bool anyway,
            and this allow future expansion of individually controlled push/pull operation
            */
};
typedef struct processStep processStep;//define the new struct as a new type

struct processProgram{
  // each program has 6*numberofstep + 4 + length(processName) of byte
  // ProcessName is a  max of 19 chr. so max size is 23+6*numberofstep

    //as of 2002/03/06, all default value is 0, so that editing can avoid invalid values
    
char* processName = NULL; // apoint to the char array, again String is not require unless operation with it need to be done by the string class
uint16_t duration=0;
uint8_t numberofstep=0;
int8_t temp=22; //default temperature value if undefined
processStep * processes = NULL; // this is a pointer to the struct array of processtep 
};
typedef struct processProgram processProgram; //define the new struct as a new type
// initilsatin of programs
processProgram ProgramList[6]; //allow up to 6 programs in CP8000 skecth
processProgram * userProgram; // user defined program from SD card
processProgram ROMProgram[6]; // allow up to 6 program in CP800 EEPROM
 // note that string class is not required since we will only be using this stepname on the UI,
 // we need not other operation in the string class
const char* const stepNames[] = {"end","soak","rinse","fix", "hypo", "dev", "bleach", "stablizer"};
const char* const paraNames[] = {"Process Name", "Proc Duration(s)", "No. of Steps", "Temp(C)",
                                "Step Names", "Inlet Valve", "Step Duration(s)", "Outlet Valve", "Pushable"};
const int* const maxRanges[] = {120, 32768, 255,100,8,6,32768,6,1};


void sketchPrograms(){
  ProgramList[0].processName = "C-41";
  ProgramList[1].processName = "BW_8min";
  ProgramList[2].processName = "BW_10min";
  ProgramList[3].processName = "BW_14min";
  ProgramList[4].processName = "BW_18min";
  ProgramList[5].processName = "E-6";
  
  ProgramList[0].duration = 695;
  ProgramList[1].duration = 8 * 60;
  ProgramList[2].duration = 10 * 60;
  ProgramList[3].duration = 14 * 60;
  ProgramList[4].duration = 18 * 60;
  ProgramList[5].duration = 2055;

  ProgramList[0].numberofstep = 7;
  ProgramList[1].numberofstep = 7;
  ProgramList[2].numberofstep = 7;
  ProgramList[3].numberofstep = 7;
  ProgramList[4].numberofstep = 7;
  ProgramList[5].numberofstep = 9;

  int proc_min[6] = {10,8,10,14,18,18};
for( int i=0;i<1;i++){
  ProgramList[i].processes = new processStep[ProgramList[i].numberofstep] ;
  ProgramList[i].processes[0].stepcode = 1; //soak
  ProgramList[i].processes[1].stepcode = 5; //dev
  ProgramList[i].processes[2].stepcode = 6; //Bleach
  ProgramList[i].processes[3].stepcode = 2; //rinse
  ProgramList[i].processes[4].stepcode = 3; //Fixer
  ProgramList[i].processes[5].stepcode = 7; //Stabiliser
  ProgramList[6].processes[6].stepcode = 2; //rinse

  ProgramList[i].processes[0].inputtank = 6; //soak
  ProgramList[i].processes[1].inputtank = 1; //dev
  ProgramList[i].processes[2].inputtank = 3; //Bleach
  ProgramList[i].processes[3].inputtank = 6; //rinse
  ProgramList[i].processes[4].inputtank = 2; //Fixer
  ProgramList[i].processes[5].inputtank = 4; //Stabilier
  ProgramList[i].processes[6].inputtank = 6; //rinse

  ProgramList[i].processes[0].outputtank = 5; //soak
  ProgramList[i].processes[1].outputtank = 1; //dev
  ProgramList[i].processes[2].outputtank = 3; //Bleach
  ProgramList[i].processes[3].outputtank = 5; //rise
  ProgramList[i].processes[4].outputtank = 2; //fixer
  ProgramList[i].processes[5].outputtank = 4; //Stabiliser
  ProgramList[i].processes[6].outputtank = 5; //rinse

  ProgramList[i].processes[0].duration = 60;   //soak
  ProgramList[i].processes[1].duration = 195 ; //dev
  ProgramList[i].processes[2].duration = 80;   //bleach
  ProgramList[i].processes[3].duration = 60 ;  //rinse
  ProgramList[i].processes[4].duration = 120;  //Fixer
  ProgramList[i].processes[5].duration = 120;  //Stabiliser
  ProgramList[i].processes[6].duration = 60;   //rinse

  ProgramList[i].processes[0].push = 0; //soak
  ProgramList[i].processes[1].push = 1; //dev
  ProgramList[i].processes[2].push = 0; //bleach
  ProgramList[i].processes[3].push = 0; //rinse
  ProgramList[i].processes[4].push = 0; //fixer
  ProgramList[i].processes[5].push = 0; //stabiliser
  ProgramList[i].processes[6].push = 0; //rinse

}
for( int i=1;i<5;i++){
  ProgramList[i].processes = new processStep[ProgramList[i].numberofstep] ;
  ProgramList[i].processes[0].stepcode = 1; //soak
  ProgramList[i].processes[1].stepcode = 5; //dev
  ProgramList[i].processes[2].stepcode = 2; //rinse
  ProgramList[i].processes[3].stepcode = 3; //fix
  ProgramList[i].processes[4].stepcode = 2; //rinse
  ProgramList[i].processes[5].stepcode = 4; //hypo
  ProgramList[i].processes[6].stepcode = 2; //rinse

  ProgramList[i].processes[0].inputtank = 6; //soak
  ProgramList[i].processes[1].inputtank = 1; //dev
  ProgramList[i].processes[2].inputtank = 6; //rinse
  ProgramList[i].processes[3].inputtank = 2; //fix
  ProgramList[i].processes[4].inputtank = 6; //rinse
  ProgramList[i].processes[5].inputtank = 5; //hypo
  ProgramList[i].processes[6].inputtank = 6; //rinse

  ProgramList[i].processes[0].outputtank = 5; //soak
  ProgramList[i].processes[1].outputtank = 5; //dev
  ProgramList[i].processes[2].outputtank = 5; //rinse
  ProgramList[i].processes[3].outputtank = 2; //fix
  ProgramList[i].processes[4].outputtank = 5; //rinse
  ProgramList[i].processes[5].outputtank = 4; //hypo
  ProgramList[i].processes[6].outputtank = 5; //rinse

  ProgramList[i].processes[0].duration = 60; //soak
  ProgramList[i].processes[1].duration = 60 * proc_min[i]; //dev
  ProgramList[i].processes[2].duration = 60; //rinse
  ProgramList[i].processes[3].duration = 60 * 10; //fix
  ProgramList[i].processes[4].duration = 60; //rinse
  ProgramList[i].processes[5].duration = 180; //hypo
  ProgramList[i].processes[6].duration = 60; //rinse

  ProgramList[i].processes[0].push = 0; //soak
  ProgramList[i].processes[1].push = 1; //dev
  ProgramList[i].processes[2].push = 0; //rinse
  ProgramList[i].processes[3].push = 0; //fix
  ProgramList[i].processes[4].push = 0; //rinse
  ProgramList[i].processes[5].push = 0; //hypo
  ProgramList[i].processes[6].push = 0; //rinse
}
for( int i=5;i<6;i++){
  ProgramList[i].processes = new processStep[ProgramList[i].numberofstep] ;
  ProgramList[i].processes[0].stepcode = 1; //soak
  ProgramList[i].processes[1].stepcode = 5; //dev
  ProgramList[i].processes[2].stepcode = 2; //rinse
  ProgramList[i].processes[3].stepcode = 5; //dev
  ProgramList[i].processes[4].stepcode = 2; //rinse
  ProgramList[i].processes[5].stepcode = 3; //fix
  ProgramList[i].processes[6].stepcode = 2; //rinse
  ProgramList[i].processes[7].stepcode = 7; //stabliser
  ProgramList[8].processes[8].stepcode = 2; //rinse

  ProgramList[i].processes[0].inputtank = 6; //soak
  ProgramList[i].processes[1].inputtank = 1; //dev
  ProgramList[i].processes[2].inputtank = 6; //rinse
  ProgramList[i].processes[3].inputtank = 5; //dev
  ProgramList[i].processes[4].inputtank = 6; //rinse
  ProgramList[i].processes[5].inputtank = 2; //fix
  ProgramList[i].processes[6].inputtank = 6; //rinse
  ProgramList[i].processes[7].inputtank = 4; //stabliser
  ProgramList[i].processes[8].inputtank = 6; //rinse

  ProgramList[i].processes[0].outputtank = 5; //soak
  ProgramList[i].processes[1].outputtank = 1; //dev
  ProgramList[i].processes[2].outputtank = 5; //rinse
  ProgramList[i].processes[3].outputtank = 6; //dev
  ProgramList[i].processes[4].outputtank = 5; //rinse
  ProgramList[i].processes[5].outputtank = 2; //fix
  ProgramList[i].processes[6].outputtank = 5; //rinse
  ProgramList[i].processes[7].outputtank = 4; //stabiliser
  ProgramList[i].processes[8].outputtank = 5; //rinse

  ProgramList[i].processes[0].duration = 300;  //soak
  ProgramList[i].processes[1].duration = 405;  //dev
  ProgramList[i].processes[2].duration = 150;  //rinse
  ProgramList[i].processes[3].duration = 480;  //dev
  ProgramList[i].processes[4].duration = 150;  //rinse
  ProgramList[i].processes[5].duration = 480;  //fix
  ProgramList[i].processes[6].duration = 240;  //rinse
  ProgramList[i].processes[7].duration = 60;   //stabiliser
  ProgramList[i].processes[8].duration = 60;   //rinse

  ProgramList[i].processes[0].push = 0; //soak
  ProgramList[i].processes[1].push = 1; //dev
  ProgramList[i].processes[2].push = 0; //rinse
  ProgramList[i].processes[3].push = 0; //dev
  ProgramList[i].processes[4].push = 0; //rinse
  ProgramList[i].processes[5].push = 0; //fix
  ProgramList[i].processes[6].push = 0; //rinse
  ProgramList[i].processes[7].push = 0; //stabiliser
  ProgramList[i].processes[8].push = 0; //rinse

}
//  // code that representing different process step, see stepName for the steps
//  ProgramList[0].processes[0].stepcode = 1; //soak
//  ProgramList[0].processes[1].stepcode = 5; //dev
//  ProgramList[0].processes[2].stepcode = 2; //rinse
//  ProgramList[0].processes[3].stepcode = 4; //hypo
//  ProgramList[0].processes[4].stepcode = 2; //rinse
//
//  ProgramList[0].processes[0].inputtank = 6; //soak
//  ProgramList[0].processes[1].inputtank = 1; //dev
//  ProgramList[0].processes[2].inputtank = 6; //rinse
//  ProgramList[0].processes[3].inputtank = 5; //hypo
//  ProgramList[0].processes[4].inputtank = 6; //rins
//
//  ProgramList[0].processes[0].outputtank = 5; //soak
//  ProgramList[0].processes[1].outputtank = 5; //dev
//  ProgramList[0].processes[2].outputtank = 5; //rinse
//  ProgramList[0].processes[3].outputtank = 4; //hypo
//  ProgramList[0].processes[4].outputtank = 5; //rinse
//
//  ProgramList[0].processes[0].duration = 60; //soak
//  ProgramList[0].processes[1].duration = 60 * 11; //dev
//  ProgramList[0].processes[2].duration = 60; //rinse
//  ProgramList[0].processes[3].duration = 180; //hypo
//  ProgramList[0].processes[4].duration = 60; //rinse
//
//  ProgramList[0].processes[0].push = 0; //soak
//  ProgramList[0].processes[1].push = 1; //dev
//  ProgramList[0].processes[2].push = 0; //rinse
//  ProgramList[0].processes[3].push = 0; //hypo
//  ProgramList[0].processes[4].push = 0; //rinse
//
//  // code that representing different process step, see stepName for the steps
//  
//  for (int l=0;l<5;l++)
//  {
//  ProgramList[1].processes[0+l*7].stepcode = 1; //soak
//  ProgramList[1].processes[1+l*7].stepcode = 5; //dev
//  ProgramList[1].processes[2+l*7].stepcode = 2; //rinse
//  ProgramList[1].processes[3+l*7].stepcode = 3; //fix
//  ProgramList[1].processes[4+l*7].stepcode = 2; //rinse
//  ProgramList[1].processes[5+l*7].stepcode = 4; //hypo
//  ProgramList[1].processes[6+l*7].stepcode = 2; //rinse
//
//  ProgramList[1].processes[0+l*7].inputtank = 6; //soak
//  ProgramList[1].processes[1+l*7].inputtank = 1; //dev
//  ProgramList[1].processes[2+l*7].inputtank = 6; //rinse
//  ProgramList[1].processes[3+l*7].inputtank = 2; //fix
//  ProgramList[1].processes[4+l*7].inputtank = 6; //rinse
//  ProgramList[1].processes[5+l*7].inputtank = 5; //hypo
//  ProgramList[1].processes[6+l*7].inputtank = 6; //rinse
//
//  ProgramList[1].processes[0+l*7].outputtank = 5; //soak
//  ProgramList[1].processes[1+l*7].outputtank = 5; //dev
//  ProgramList[1].processes[2+l*7].outputtank = 5; //rinse
//  ProgramList[1].processes[3+l*7].outputtank = 2; //fix
//  ProgramList[1].processes[4+l*7].outputtank = 5; //rinse
//  ProgramList[1].processes[5+l*7].outputtank = 4; //hypo
//  ProgramList[1].processes[6+l*7].outputtank = 5; //rinse
//
//  ProgramList[1].processes[0+l*7].duration = 60; //soak
//  ProgramList[1].processes[1+l*7].duration = 60 * 13; //dev
//  ProgramList[1].processes[2+l*7].duration = 60; //rinse
//  ProgramList[1].processes[3+l*7].duration = 60 * 13; //fix
//  ProgramList[1].processes[4+l*7].duration = 60; //rinse
//  ProgramList[1].processes[5+l*7].duration = 180; //hypo
//  ProgramList[1].processes[6+l*7].duration = 60; //rinse
//
//  ProgramList[1].processes[0+l*7].push = 0; //soak
//  ProgramList[1].processes[1+l*7].push = 1; //dev
//  ProgramList[1].processes[2+l*7].push = 0; //rinse
//  ProgramList[1].processes[3+l*7].push = 0; //fix
//  ProgramList[1].processes[4+l*7].push = 0; //rinse
//  ProgramList[1].processes[5+l*7].push = 0; //hypo
//  ProgramList[1].processes[6+l*7].push = 0; //rinse
//}
}

class joystick {
  private:
   uint8_t _KEYA,_KEYB,_KEYC,_KEYD,_KEYK,_JOYX,_JOYY;
   int _threshold = 200; //default threshold to shift from nothing to on in each direction
   int _idleread = 318; //change this the didel read value from serial print
   long _edgetiming=0;
   
  public:
    byte status_reg = 0b11111100;
    joystick (uint8_t A,uint8_t B,uint8_t C,uint8_t D,uint8_t K,uint8_t X,uint8_t Y){
      _KEYA = A;
      _KEYB = B;
      _KEYC = C;
      _KEYD = D;
      _KEYK = K;
      _JOYX = X;
      _JOYY = Y;
    }
    void Begin() {
      //cahnge to pulled up since 220410
      pinMode(_KEYA,INPUT_PULLUP);
      pinMode(_KEYB,INPUT_PULLUP);
      pinMode(_KEYC,INPUT_PULLUP);
      pinMode(_KEYD,INPUT_PULLUP);
      
      pinMode(_KEYK,INPUT_PULLUP);
      pinMode(_JOYX,INPUT_PULLUP);
      pinMode(_JOYY,INPUT_PULLUP);
    }
    int16_t Update(){
      /*
       * previous D pad bit mapping is
       * A B Up left down right empty empty
       * 
       * to be compitable we have to befor lower byte
       * A B Up left down right C D 
       * 
       * upper byte, i fwe need more button
       * empty empty empty empty empty K E F 
       */


      // these are reverted so they are defaul high, and trigger to 0 when condition meet
      // if the Y and X read pulled up, the pins are open, thus no joystick connected
      bool up = analogRead(_JOYY)>900? 1: analogRead(_JOYY) <  (318 + _threshold);
      bool down = analogRead(_JOYY)>900? 1: analogRead(_JOYY)  > (318 - _threshold);
      bool left = analogRead(_JOYX)>900? 1: analogRead(_JOYX)  > (310 - _threshold);
      bool right = analogRead(_JOYX)>900? 1: analogRead(_JOYX)  < (310 + _threshold);
      bool keyA = digitalRead(_KEYA);
      bool keyB = digitalRead(_KEYB);
      bool keyC = digitalRead(_KEYC);
      bool keyD = digitalRead(_KEYD);
      bool keyK = digitalRead(_KEYK);
//      Serial.println (analogRead(_JOYX));
//      Serial.println (analogRead(_JOYY));
//  
//      Serial.print (keyA);
//      Serial.print (keyB);
//      Serial.print (up);
//      Serial.print (left);
//      Serial.print (down);
//      Serial.print (right);
//      Serial.print (keyC);
//      Serial.print (keyD);
//      Serial.print (keyK);

      byte new_input = 0x00; //reset all unuse bit to zero except the extra keys in upper byte
      new_input = keyA<<A_shift | keyB<<B_shift | up<<Up_shift | left<<Left_shift | down<<Down_shift 
                      | right<<Right_shift;// |keyC<<C_shift | keyD<<D_shift;
                      
      int noupdate = new_input==status_reg; // no update when new input is equal to status reg
      if(new_input<status_reg){
        // the trigger is on rising edge of the signal
        _edgetiming = millis(); //target debounce 100ms
      }
      // update reg to the new input
      status_reg = new_input;
      
      return noupdate;
      
    }
    
    int16_t getinputs(){
      return status_reg;
    }
};
