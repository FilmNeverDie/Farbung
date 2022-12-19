#include "pitches.h"
#define arrayLength(array) (sizeof((array))/sizeof((array)[0]))
#include <LiquidCrystal.h>
#include <EEPROM.h>

bool zero_crossed=0;
int maxcol=3; //maximum number of col to be display (shift colume by left and right)

int rowstack[8][2];//a matrix that stored the row value for both the user cursor and the menu map
int colstack[8][2]; //a matrix that stored the col value for both the user cursor and the menu map
int actionstack; // the variable to restore which action the menu is selected
String lcdStr[4] = {"", "", "", ""};
int ispageEnd = 0; //flag indicaitng the end of the menu page
int pagerow = 4; //default is four

//this is the view in which the LCD is looking at
struct camera{ 
  int col;
  int row;
  int row_size;
  int col_size;
};

/*
 * UIcursor object are unit that loate on the map by its x y coordinate
 * it could have multiple value that represent each page of the menu
 * 
 * inputs: this is a combination of the button input and menu direction
 * menu direction would indicate which direction the cursor could move  
 * the bit mapping of the inputs are below:
 * MSB            LSB
 *  ULRDAB col row
 * A : button A
 * B : button B
 * U : up button
 * D : down button
 * L : left button
 * R : right button
 * col : allow column movement
 * row : allow row movement
 * 
 * bit A to R are directly from buttons inputs
 * Bit col and row are determined by the meu status
 */
class UIcursor {
  private:
    byte* _inputsRef; //the pointer to the _inputs
    byte _inputs; //take new inputs
    byte _Previnputs; //previous input
    int _rowlimit=3; //row upper limit

    void limit(int *row, int *col){
      if (*row>_rowlimit) *row=_rowlimit; // if above row upper limit, restrict it to upper limit
      if (*row<0) *row=0; //if below 0, rstrict it to 0
      if (*col<0) *col=0; //if below 0, rstrict it to 0
    }
    
  public:
    int row=0;
    int col=0;
    int layer=0;

  //pass the input pointer to the private variable
    UIcursor (byte* inputs){
      _inputsRef = inputs;
    }
    void begin(){
      //initiate inputs
      _inputs = *_inputsRef; //when begin, load the value of the input pointer to _inputs
      _Previnputs = _inputs; // initailise the previous as current inputs
    }
    // can overwrite the current location of the cursor to any positon on the map
    void wrappoint (int wraprow, int wrapcol, int wraplayer){
      row=wraprow;
      col=wrapcol;
      layer=wraplayer;
    }
    // update cursor from the inputs given the number of row to be displayed and wehter it is a end page
    void Update(int isEnd, int displayrow){
      _inputs = *_inputsRef; // read new inputs via the pointer
      _rowlimit = displayrow-1; // update row limit depending on the page

      // shift between menu layr with A and B
      // ULRDAB
      bool A = (_Previnputs>>A_shift & 1) & ~(_inputs>>A_shift & 1); 
      bool B = (_Previnputs>>B_shift & 1) & ~(_inputs>>B_shift & 1);
      if (A){
        rowstack[layer][2] =row; // push rowstack with current row
        colstack[layer][2] =col;// push rowstack with current row

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

class UImap{
  /*
   * this is a map that contain everything the menu has
   * the menu will consist of multiple layers of rows 
   * only up and down is control in row menu
   * A will move the menu to the next layer below the current row
   * B will move the menu back to the upper layer
   * 
   * The last layer should either be a cofirmation that saved all changes
   * or a information page for user to view details of the current status
   * 
   * confirmation would require the user to select yes and No
   * only up and down movement is allowed
   * 
   * information page dis play all relevent information, 
   * only left and right movement is allowed
   */
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
    }
  public:
  int row=0;
  int col=0;
  int layer=0;
  //contructor are not inherited from based classes
    UImap(byte* inputs){
      _inputsRef = inputs;
    }
    void begin(){
      _mapCam.row=0; //start at the top
      _mapCam.col=0; //start at the left
      _mapCam.row_size = 4; //default dispalying 4 row of character
      _mapCam.col_size = 19;//default dispalying 19 character

      //initiate inputs
      _inputs = *_inputsRef;
      _Previnputs = _inputs;
    }
    void wrappoint (int wraprow, int wrapcol, int wraplayer){
      row=wraprow;
      col=wrapcol;
      layer=wraplayer;
    }
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
      }else if (B){
        //use 0 to destroy the layer for returning operation
        rowstack[layer][1] = 0;
        colstack[layer][1] = 0;
        layer -=1;
        if(layer<0)layer=0;
        row = rowstack[layer][1];
        col = colstack[layer][1];
        //clear current layer position after unloading back into cursor
        rowstack[layer][1] = 0;
        colstack[layer][1] = 0;
      }else{      
      /*
       * row increment when the down button signal transit from 1 to 0
       * row decrement when the up button signal transite from 1 to 0
       * 
       * commend switch to col if the menu allow colum
       * 
       * non blocking operation for all direction (could be using in game mode) 
       */
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

class Buzzer {
  private: 
    uint8_t _buzz_pin; //which pin is the buzzer
    uint8_t _vol_pin; //the voltage of the buzzer (1 of two preset value)
    uint8_t _welcomeMelody[2] = {NOTE_B5,NOTE_A5}; // welcome tones
    uint8_t _welcomeMelodyDuration[2] = {250,250}; //duration for welcome tones
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
    // rountine to play welcome tune
    void welcome(){
      play_array(_welcomeMelody,2,_welcomeMelodyDuration,2);
    }
    // routine to play nothing
    void no_note(){
      noTone(_buzz_pin);
    }
    // inistilising the buzzer pins
    void begin(){
      pinMode(_buzz_pin, OUTPUT);
      pinMode(_vol_pin, OUTPUT);
    }
    //write high
    void vol_HI(){
      digitalWrite(_vol_pin, HIGH);
    }
    //write low
    void vol_LO(){
      digitalWrite(_vol_pin, LOW);
    }
};

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

    void begin(){
      pinMode(_in_pin, INPUT);
      pinMode(_rh_pin, INPUT_PULLUP);
      pinMode(_rl_pin, INPUT);
      _init_volt = analogRead(_in_pin);
      _init_rh = analogRead(_rh_pin); 
      _init_rl = analogRead(_rl_pin);
     // _old_volt = _init_volt; //record init voltage input as previous voltage input
    }
    // check if there is a update on Dpad inputs
    int checkupdate(){
       return(_old_volt>_new_volt+_threshold || _old_volt<_new_volt-_threshold);
    }
    int Ispressed(){
      return 1-_button_reg_set; //return 0 if pressed
    }
    //Dpad update process
    int Update(){
      // update input parameters
       _new_volt = analogRead(_in_pin);
       _new_rh = analogRead(_rh_pin);
       _new_rl = analogRead(_rl_pin);
       _ref_range = _new_rh-_new_rl;
       if(checkupdate()){
          _edgetrigger =1; //detect edge ; 
       }
       if (_edgetrigger){
          _edgetrigger=0;
          _edgetiming = millis(); //target debounce 100ms
       }
      if(checkupdate()){
        //do only if there is a update in the 
        float analog_inputsRef = _init_volt * float(_new_rh-_new_rl)/float(_init_rh-_init_rl);
        // the analog input ref is the dynamic 5V range according to the max range of the high and low reference read
        // when the range shrink it is typically that the ground is boosted 
        _dVolt = _old_volt-_new_volt; //_new_rl imigt be added to compensate the float ground
        //when old value smaller than new value, the change is negative, hence button released
        _shift_ratio = abs(float(_dVolt)*100/(analog_inputsRef)); 
        _button_reg_set = _dVolt<0; //whether the buttons are pressed = 0, or released = 1;
       // if(_button_reg_set)_shift_ratio=0-_shift_ratio;
         //priority of button, AB then up down then left right

         // table: when pull up, 
         // A 350/900 = 38.8%
         // B 200/900 = 22.2%
         // up 110/900  = 12.2%
         // left 60/900 = 6.6%
         // down 40/900 = 4.4%
         // right 30/900 = 3.3%
         
        if (_shift_ratio>48){
          _shift_ratio=_shift_ratio-52;
          status_reg  = _button_reg_set? status_reg|0b10000000 :status_reg&0b01111111;
        }
        else if (_shift_ratio>24){
          _shift_ratio=_shift_ratio-26;
          status_reg  = _button_reg_set? status_reg|0b01000000 :status_reg&0b10111111;
        }
        //it is physically not possible to press up and down at the same time
        else if (_shift_ratio>12){
          _shift_ratio=_shift_ratio-15;
          status_reg  = _button_reg_set? status_reg|0b00100000 :(status_reg&0b11011111)|0b00011100;
        }else if (_shift_ratio>6){
          _shift_ratio=_shift_ratio-7;
          status_reg  = _button_reg_set? status_reg|0b00010000 :(status_reg&0b11101111)|0b00101100;
        }
        //it is physically not possible to press left and right at the same time
        else if (_shift_ratio>3.5){
          _shift_ratio=_shift_ratio-4.0;
          status_reg  = _button_reg_set? status_reg|0b00001000 :(status_reg&0b11110111)|0b00110100;
        }else  if (_shift_ratio>2.8){
          _shift_ratio=_shift_ratio-3.2;
          status_reg  = _button_reg_set? status_reg|0b00000100 :(status_reg&0b11111011)|0b00111000;
        }
         _old_volt = _new_volt; // only update value if there is a update
         return 0; //succesful update Dpad inputs
      }else{
        return 1; // no update
      }
    }
    byte getinputs(){
      return status_reg;
    }
    float getShiftratio(){
      return _shift_ratio;
    }
    void getvolts(int * new_volt,int * new_rh,int * new_rl){
      *new_volt = _new_volt;
      *new_rh = _new_rh;
      *new_rl = _new_rl;
    }
    void setThreshold(int thres){
      _threshold = thres;
    }
    int getThreshold(){
      return _threshold;
    }
    
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
    
};

class Led {
  private:
    uint8_t _led_pin;
    uint8_t _led_pu=1; //default pulled up
  public:
    //contructor
    Led (uint8_t ledpin){
      // initialise LED pin without pull up/down paramter
      _led_pin = ledpin;
      pinMode(_led_pin, OUTPUT);
    }
    Led (uint8_t ledpin, uint8_t pullup){
      // initialise LED pin with pull up/down paramter
      _led_pu = pullup>0;// read all other input mode as 1
      _led_pin = ledpin;
      pinMode(_led_pin, OUTPUT);
    }
    
    int getpin(){
      return _led_pin;
    }
    void ON(){
      digitalWrite(_led_pin, 1-_led_pu);// _led_pu?LOW:HIGH
    }
    void OFF(){
      digitalWrite(_led_pin, _led_pu);// _led_pu?HIGH:LOW
    }
};

int debouncer(int sign, int * debounced_sign){
  static int oldsign=-1;
  static int counter=0;

  
  
  //initialisation
  if(oldsign==-1){
    *debounced_sign = sign;
  }
  //update buttons signal
  oldsign = sign;
  
  if (counter>3 ){
    counter = 3;
  }
  if (counter==3 && *debounced_sign!=oldsign){
    *debounced_sign = oldsign;
    return 1; //indicate there is a update in debounce
  }
  // if prevoious button signal is same as current buttons signals
  if (sign==oldsign){
    counter++;
  }else{
    counter = 0;
  }
//  if (sign>oldsign){
//    counter =2; //no deboucning for release
//  }
  return 0;
}


int savetoROM(int Programselect){
/*
 * to save the program into the ROM, we will need the entire program to be filled, this could have a number of error
 * because the program may not be fully defined using the UI menu and the saving process is done at the end of the 
 * operation, when the user return from the editing menu
 * 
 * EEPROM write would require to write the data byte by byte,s o the entire program will need to be convert into bytes
 * The program will have a size of 6*numberofstep + 4 + length(processName) 
 * 
 * sprintf will be able to convert all repsective data into byte size, pease refer to test_storePrograms.ino
 * and the return of sprintf will be the len of data that we will be storing. However, this is different storing 
 * method than SD card, since in the SD card, we have to specify the number of program with parity byte. Meanwhile, 
 * we can just fixed memory location to stored the ROM programs, we allow a maximum of 6 different ROm programs.
 * 
 * the storing procedure will be:
 *  1. locate the ROM meory location using the rowstack[1][1] which reflect the current program being edited
 *  2. convert the program header, into a str, and write from the first byte one more byte is stored with a 
 *     symbol to mark the end of the program
 *  3. and for each step, 7 bytes will be write in order of the step right after the program header
 *  4. the accumelated return length value of sprintf will be stored in the header location -1. this could be use
 *     to check the intergrity of the stored program when loaded from the ROM later. so we know the exact length 
 *     of the relevant data for this program, and we can see if the length +1 byte is the end of program symbol.
 *     
 * Since we would like to keep the storing program same format as SD card, there is one more byte behind
 * the program hehader, and each step, therefore the full storing size is 20+1+4+6*step+1. 
 * 
 * For a memory chunk size of 256, the worst case, is that the program header has 20+4+1 byte, and each step will take 7 bytes.
 * therefore the max step in a program that could be stored without casuing error is (255-20-4-1)/7 is 34 steps
 * Since the number of step variable is 8 bits, so the max number of step is 32 anyway, thus 256 bytes chunk 
 * is enough for any possible program from the user
 *  
 *  NOTE that
 *  4 KB (4096 bytes) on the ATmega1280 and ATmega2560.
 */

// change from fixed ROM location addressing {256,512,768,1024,1280,1536} to incremetal, as of 20220604
  static int ROMloc[6]= {256,512,768,1024,1280,1536};
  //static int ROMloc[6]= {256,512,768,1024,1280,1536};
  //write the program header into a str
  char str[64];
  
  int p = Programselect; // just to make numbering easier

  if (p>5 || p<0){
    DEBUG_PRINTln("ROM index out of bound");
    return 1;
  }
    int currentloc = ROMloc[p];
    //used to use fixed location, ROMloc[p]
    //revert back to ROMLOC[p] since save to ROm only save to the first memory slot as a bug discvoered in 20220612 version
  int e = sprintf(str, "$%s%c%c%c%c|", ROMProgram[p].processName, ROMProgram[p].duration >> 8, ROMProgram[p].duration, ROMProgram[p].numberofstep, ROMProgram[p].temp);
  DEBUG_PRINTln(currentloc);
  DEBUG_PRINTln(str);
  DEBUG_PRINTln(e);
  for (int in=0; in<e;in++){
    //update entire of str byte by byte
    EEPROM.update(currentloc+in,str[in]); //store program header + |
  }
  
  currentloc = currentloc+e;
  for (int n = 0; n < ROMProgram[p].numberofstep; n++) {
    char str[64];
    int e = sprintf(str, "%c%c%c%c%c%c|", ROMProgram[p].processes[n].stepcode, ROMProgram[p].processes[n].inputtank, ROMProgram[p].processes[n].duration >> 8,
            ROMProgram[p].processes[n].duration, ROMProgram[p].processes[n].outputtank, ROMProgram[p].processes[n].push);
    DEBUG_PRINTln(currentloc);
    DEBUG_PRINTln(str);
    for (int in=0; in<e;in++){
      //update entire of str byte by byte
      EEPROM.update(currentloc+in,str[in]); //store program header + |
    }
    currentloc = currentloc+e; //increment current location
  }
  DEBUG_PRINTln(currentloc);
  EEPROM.update(ROMloc[p]-1,currentloc-ROMloc[p]);
  DEBUG_PRINTln(currentloc-ROMloc[p]);
  return 0; // operation sucecssfuly without error
  
}

int loadfromROM(int Programselect){
/*
 * to load the program from the ROM, we will have to locate the starting byte from a choice of 6 different address which 
 * should be fixed value. This is to reduce the complexity as we shouldn't rely on the ROM for running the programs
 * the prefer metho is from the SD card followed by the script
 * 
 * EEPROM read only take one byte, we will have to run a loop for the entire legnth of the data block and then convert
 * the bytes into their respective data type. this is a process that can be done since we have to structure of the 
 * stored data and the datatype defined when storing them
 * 
 * The len of the entire program is stored at the fixed memory location -1 posible. since it is one byte, so the size is a 
 * maximum of 256. HOwever, the max data size for any program is 20+1+4 + 32*7 = 249, so non of the program should overload
 * the memory block. 
 * 
 * To ensure the stored is complete without error, the symbol | is used at the end of each step and the program header,
 * the loading process will be checking the position of these from the size value recorded in the fixed location -1. 
 * 
 * to check that, we will begin from the end of the data, where fixed location + size -1 = '|'
 * furthermore length of processname = size - 7*numberofstep - 5
 * and the location of numberofstep should be first '|' - 2
 * there value are the reverse of the savetoROM operation
 * 
 * since the program header has a max size of 25, so we wil have to find the locatin of the first '|', then we can
 * work out the numberofstep, and then all the locatin of the '|', to perform the data intergrity check of each step
 * 
 * the loading procedure will be:
 * 1. match the program selected with the address in the ROM memory chunk location
 * 2. read the size from fixed location -1 
 * 3. match the symbol at fixed location  + size -1 , if false, return error
 * 4. find the first | symbol in the first 25 character, and return the index
 * 5. get number of step from the above index -2
 * 6. work out the size of the processName
 * 7. load each section of bytes into the ROMpgorams array respeoctive
 *  
 *  NOTE that
 *  4 KB (4096 bytes) on the ATmega1280 and ATmega2560.
 */

  static int ROMloc[6]= {256,512,768,1024,1280,1536};
  //write the program header into a str
  char str[64];
  
  int p = Programselect; // just to make numbering easier

  if (p>5 || p<0){
    Serial.println("ROM index out of bound");
    return 1;
    
  }
  int currentloc = ROMloc[p];
  uint8_t chunksize = uint8_t(EEPROM.read(currentloc-1));
//  Serial.println(chunksize);
  
//  Serial.println(currentloc-1+chunksize);
  int checkend = (EEPROM.read(currentloc-1+chunksize)=='|');
 // EEPROM.update(currentloc, '$');
//  Serial.println((EEPROM.read(currentloc)));
//  Serial.println((EEPROM.read(currentloc-1+chunksize))); // this is the end
//  Serial.println((EEPROM.read(currentloc+chunksize)));
  if (checkend==0){
    
    Serial.print("program ");
    Serial.print(p);
    Serial.println(" size unmatch");
    return 2;
  }
  int endofheader = 0;
  char header[25];
  byte body[240]; 
  int headfound=0;
  for (int index=0;index<25;index++){
    header[index] = EEPROM.read(currentloc+index);
    if (header[index] == '|' && headfound==0){
      endofheader = index;
      headfound = 1; 
    }
  }
//  Serial.println("loading para");
//  Serial.println(endofheader);
  
  int numberofstep = EEPROM.read(currentloc+endofheader-2); // the number of step is 2 place before '|', and end of header is at '|'
//  Serial.println(numberofstep);
  int lenofName = endofheader-4; // if index is 6, therea are 6 byte before '|', so minus 4 fixed size for udration, numerofstep and temp
//  Serial.println(lenofName);
  // load all program header
  ROMProgram[p].temp = int8_t(header[endofheader-1]);
  ROMProgram[p].duration  = uint16_t((header[endofheader-3]&0b0000000011111111) | header[endofheader-4]<<8);
  ROMProgram[p].numberofstep = uint8_t(header[endofheader-2]);
  ROMProgram[p].processName = new char[lenofName];
  for (int n=0;n<lenofName-1;n++){
    //skip the first $ sign
    ROMProgram[p].processName[n] = header[n+1]; 
  }
//  Serial.println(currentloc);
  currentloc = currentloc + endofheader +1 ;// after ladoing the header the next position should be end of header +1
//  Serial.println(currentloc);
  for (int n=0; n<(7*ROMProgram[p].numberofstep); n++){
    //load the rest of the stesps data into the buffer
    body[n] = EEPROM.read(currentloc+n); // load each byte of reminder ROM memory to the body bffer
//    Serial.println(n);
//    Serial.println(body[n]);
  }

  // create new process stesps
  ROMProgram[p].processes = new processStep[ROMProgram[p].numberofstep];
//  Serial.println("end of loading");
  // conversion of the body pufer to each step of the program
  for (int ps=0;ps<ROMProgram[p].numberofstep;ps++){
    ROMProgram[p].processes[ps].stepcode = (body[ps*7]) ;
    ROMProgram[p].processes[ps].inputtank = (body[1+ps*7]) ;
    ROMProgram[p].processes[ps].duration = (body[2+ps*7]<<8 | (body[3+ps*7]&0b0000000011111111));
    ROMProgram[p].processes[ps].outputtank = (body[4+ps*7]);
    ROMProgram[p].processes[ps].push = (body[5+ps*7]);
//    Serial.println(ROMProgram[p].processes[ps].stepcode,DEC);
//    Serial.println(ROMProgram[p].processes[ps].inputtank,DEC);
//    Serial.println(ROMProgram[p].processes[ps].duration,DEC);
//    Serial.println(ROMProgram[p].processes[ps].outputtank,DEC);
//    Serial.println(ROMProgram[p].processes[ps].push,DEC);
    
  }
  
//   Serial.println("end of loading");
  
  return 0; // operation sucecssfuly without error
  
}
