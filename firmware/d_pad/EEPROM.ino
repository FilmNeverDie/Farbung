

/*
 * stored data (tentative as of 2021111)
 * start indicator, proess name , duration, number of step, the processing steps  (
 * $                 BW            600        6               *ptr to steps
 * step separator (byte)
 *   | 
 * paratmer seprator (byte)
 *   /
 * step ID,  duration,  input tank, output tanks, push  (5bytes)
 * 
 */

/*
 * function loadfrominputline
 * the function will decrypt the data and set the parameters in a process and its steps accordingly
 * prerequsite: the data is already prepared from file or from memory and it got the starting byte and the complete sentence
 *            
 * 
 * check if the input begin with start indicator
 * 
 * if so, separate the inputline into different block with separator |
 * number of separator is the number of steps
 * go over each block and further separate them with the separator /
 * the first line is processing parater
 * 
 * byte * block = splitbyte(inputline, "|", nth_block);
 * 
 * the first block is the sepcial block that will define how many step separator there is
 * we will use a general splitstring function to locate each part of the block for the parameter
 * 
 * when nth_block == 0 
 * Program.Name = splitsbyte(block, "/", 0);
 * Program.Duration = splitsbyte(block, "/", 1);
 * Program.numberofstep = splitsbyte(block, "/", 2);
 * Program.numberofstep = splitsbyte(block, "/", 3);
 * return error if numberofstep < 1;
 * else create process array with new
 * Program.processes = new processStep[Program.numberofstep] ; // allocate enough memory for all steps
 * and continue the nth_block counter to populate the processes array
 * 
 * for nth_block == 1 to numberofstep,  
 * Program.processes[nth_block-1].stepcode = splitsbyte(block, "/", 0);
 * Program.processes[nth_block-1].inputtank = splitsbyte(block, "/", 2);
 * Program.processes[nth_block-1].duration = splitsbyte(block, "/", 1);
 * Program.processes[nth_block-1].outputtank = splitsbyte(block, "/", 3);
 * Program.processes[nth_block-1].push = splitsbyte(block, "/", 4);
 * 
 * 
 * 
 */

 /*
 * function loadfromRom
 * the function will get a inputline for loading the each program from the ROM,
 * 
 * memory ROM:
 * EEPROM.read(fixed_pointer)
 * the first byte will be the size of the program
 * 
 * 
 */

 //unused function
int loadfromRom(byte * data){
  // this function will load the rom location into a buffer and then decode the data into the programs

  int state = 0;
  // first find the length of the programs stored in the Rom
  // read the fixed eeprom location that indicate where the block is for the newest programs.
  // the location is the beginingg of the programs
  // the programs are in variable size this is why the first location stored the len of the data block
  int sector_location = EEPROM.read(1); 
  int len = EEPROM.read(sector_location); 
  data = new byte[len+1] ; // initialise the data buffer for programs in RAM
  // the +1 size is for adding the zero termining byte and conver the arary to a strong, which has many
  // useful class operator for manipulating the data
  
  // the correct data is mark by $ at the start and | at the end
  int8_t datacheck = (EEPROM.read(sector_location+1)=='$') & (EEPROM.read(sector_location+len)=='|');
  if (datacheck){
    // only load data if the data block is starting and ending correctly with the size specified
    
    //interate the entire sector of data to extract data for program 
    for (int index = 0; index< len; index++){
      data[index] = EEPROM.read(sector_location + index + 1);
    }
    
    data[len] = '\0'; //add zero terminiting byte
    state = 1; // read data succesffully
  }
  
  if (state == 1) {
    DEBUG_PRINTln("readFromRom() //**");
    DEBUG_PRINTln("data found");
    DEBUG_PRINT("data: ");
    DEBUG_PRINTbin(*data, DEC);
    DEBUG_PRINTln("");
    return 0; // function loadfromRom complete successfully
  } else {
    DEBUG_PRINTln("readFromRom() //**");
    DEBUG_PRINTln("data not found");
    DEBUG_PRINT("in location: ");
    DEBUG_PRINTln(sector_location);
    return 1; // function loadfromRom complete with error
  }
 
} 


 //unused function

void writeToRom(int strNo, const String str) {
  // each bracket of str is fixed to 200 byte in size
  
  Serial.println("writeToRom() //**");
  //str.length should be examined before this function
  //str.length < strByteLen (200)
  int len = str.length();
  int bucketStart = strNo * strByteLen;
  // updated on 20211124 so that buckfinish would allow addrshift to be the worse case at Strbytelen
  // and the program would still have abother strbytelen to write the data with
  // error is still possible if the str to be stored is longer than strByteLen
  int bucketFinish = (strNo + 2) * strByteLen;

  //note that addrshift is a random number bwteen 0 to strByteLen, line 290 at Main
  int indexStart = strNo * strByteLen + addrShift;
  int indexFinish = strNo * strByteLen + addrShift + len;
  // there will be an error is the random addrshift is bigger than strByteLen - len
  for (int i = bucketStart; i <= bucketFinish; i++) {
    Serial.print(i);
    Serial.print(": ");
    if (i == indexStart) {
      EEPROM.write(i, len);
      // the first byte of the memory indicate the len of the data to be stored
      Serial.print("len: ");
      Serial.println(len);
    } else if (i > indexStart && i <= indexFinish) {
      //when i>indexstart, it begins with indexstart + 1. 
      //error would occur if len(Str) is longer than bucketfinish - indexstart. 
      EEPROM.write(i, str[i - indexStart - 1]);
      Serial.println(str[i - indexStart - 1]);
    } else {
      EEPROM.update(i, 0);
      Serial.println("0");
    }
  }


  Serial.println("Write Complete:");
  Serial.print("bucket No:");
  Serial.println(strNo);
  Serial.print("str:");
  Serial.println(str);
  Serial.println("writeToRom() //**");

}

String splitString(String input, char separator, int index) {
  int mark = 0;
  int strIndex[] = {0, -1};
  int maxIndex = input.length() - 1; 
// this loop will look for string until mark is == to index or raech maxindex
  for (int i = 0; i <= maxIndex && mark <= index; i++) {
    // increment the index through each char of the string 
    if (input.charAt(i) == separator || i == maxIndex) {
      //increase the mark and shift index[1] value into index[0]
      mark++;
      // the starting index is +1 of the current increment because the current increment is the location
      //  of the previous separator
      strIndex[0] = strIndex[1] + 1;

      // set index[1] to the current increment of char in the string
      if (i == maxIndex) {
        strIndex[1] = i + 1;
      } else {
        strIndex[1] = i;
      }
    }
  }
// this returen -99 if the index is bigger than the mark, 
// index is input where the user is trying to get the index-th section of the string
// mark is the counter that count how many section is separaterd by the separator
// mark should be also index + 1
  if (mark > index) {
    // select the strong from inde[0] to index[1]
    return input.substring(strIndex[0], strIndex[1]);
  } else {
    return "-99";
  };

}

// unused
String constructStr(int arr[50], int size, char separator) {

  Serial.println("constructStr //****");
  Serial.print("arr: ");
  Serial.println(arr[2]);

  String str = "";

  for (int i = 0; i < size; i++) {
    str = str + String(arr[i]) + String(separator);
    Serial.print("str: ");
    Serial.println(str);
  }

  Serial.println("constructStr //----");

  return str;

}
