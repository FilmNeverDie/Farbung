// this routine is run everytime process from SD is selected
void loadProc_SD(int * SD_err) {
  File ProgramFile;
  int loaderr=0; // indicate whether there is a loading error
  if (!SD.begin(SD_SS)) {
    // Serial.println("Card failed, or not present");
    // lcd display
    // [0] 
    // [1]Card failed, or not present"
    // [2]
    // [3]press A/B to return
    //return 1; //Can not find SD card
    loaderr = 1;
    
  }
  if (loaderr==0){
  if( SD.exists("programs.txt")) {
    ProgramFile = SD.open("programs.txt", FILE_READ);
    DEBUG_PRINTln(ProgramFile);
  }else{
    //return 4; //missing program
    loaderr = 4;
  }
  }
  if (loaderr==0){
  if (ProgramFile) {
    // read from the file until there's nothing else in it:
    program_no = 0; //reset program number count to 0 before each load/refresh
    int program_counter = 0;
    int Isseperator=1;

    //load file and check if it is correct
    char file_info[3];
    for (int in = 0; in<3; in++){
      file_info[in] = ProgramFile.read();
    }

    // the thrid entry should be the sum of the first two with the second one being the number of program
    int datafault=0;
    if (file_info[2] != file_info[1]+file_info[0]){ 
      datafault = 1; 
      //return 2; //  incorrect file header
      loaderr = 2;
    }else{
      //create program list from SD card based on the info from a proper header
      userProgram  = new processProgram [file_info[1]];
    }
    // create a buffer for each program
    char * buff_ary; 
    buff_ary = new char[100];

    while (ProgramFile.available() ) {
        char inchar = ProgramFile.read();
        if (program_no>0){
          // after the program read a $ sign
          // store the input into a buffer

          //load inchar until read the symbol |
          if (inchar== '|'){
            Isseperator = 1; // stop loading anymore for other inchar until next $

            //load all previous input to respective data struct
            userProgram[program_no-1].temp = buff_ary[program_counter-1];
            userProgram[program_no-1].duration  = (buff_ary[program_counter-3]&0b0000000011111111) | buff_ary[program_counter-4]<<8;
            userProgram[program_no-1].numberofstep = buff_ary[program_counter-2];
            
            //Serial.println(program_counter);

            userProgram[program_no-1].processName = new char[program_counter-4];
            
            for (int n=0;n<(program_counter-4);n++){
              userProgram[program_no-1].processName[n] = buff_ary[n]; 
              
            }
//            DEBUG_PRINTln("loading program: ");
//            DEBUG_PRINTln(userProgram[program_no-1].processName);
//            DEBUG_PRINTln("program paramters:");
//            DEBUG_PRINT("program duration: ");
//            DEBUG_PRINTln(userProgram[program_no-1].duration);
//            DEBUG_PRINT("number of step: ");
//            DEBUG_PRINTln(userProgram[program_no-1].numberofstep);
//            DEBUG_PRINT("target temp: ");
//            DEBUG_PRINTln(userProgram[program_no-1].temp);
            
            //after loading the program paramter, we load the step after the seperator
            // the total size of the data is 6*numberofste + | 
            
            for (int n=0; n<(7*userProgram[program_no-1].numberofstep); n++){
              //load the rest of the stesps data into the buffer
              buff_ary[program_counter+n] = ProgramFile.read();
              
//              DEBUG_PRINT(buff_ary[program_counter+n]);
//              DEBUG_PRINTln(ProgramFile.position());
              
            }
            
            // the next read from the file should be '|' that mark the end after exact 6*numberofstep bytes
            char endchar = buff_ary[program_counter+7*userProgram[program_no-1].numberofstep-1];
//            DEBUG_PRINTln(endchar);

            if (endchar=='|'){
              // this should mark the end of the program
              //only initialise the process steps of the program if all data check out
              userProgram[program_no-1].processes = new processStep[userProgram[program_no-1].numberofstep];

              //then we unload the buffer with the correct data into each process steps
              for (int ps=0;ps<userProgram[program_no-1].numberofstep;ps++){
                
                userProgram[program_no-1].processes[ps].stepcode = buff_ary[program_counter+ps*7] ;
                userProgram[program_no-1].processes[ps].inputtank = buff_ary[program_counter+1+ps*7] ;
                userProgram[program_no-1].processes[ps].duration = buff_ary[program_counter+2+ps*7]<<8 | (buff_ary[program_counter+3+ps*7]&0b0000000011111111);
                userProgram[program_no-1].processes[ps].outputtank = buff_ary[program_counter+4+ps*7];
                userProgram[program_no-1].processes[ps].push = buff_ary[program_counter+5+ps*7];
              }
              Serial.println("dataload complete");
//              Serial.println("the data is : ");
//              Serial.println(&buff_ary[program_counter]);
              loaderr = 0; // exist without error
            }else{
              Serial.println("step data load fail, incorrect sizes");
//              Serial.print("skip loading program ");
//              Serial.println(&buff_ary[program_counter]);
              loaderr = 3; // some program are not loaded properly
              
            }
          //Serial.println(Isseperator);
          }
          if (Isseperator==0){
            // only load data into the buffer if it is not separator
            buff_ary[program_counter] = inchar;
            // if it is seperator the routine will check end byte and load all step data into the buffer
            // no more data should be load into the buffer after checking '|' until the next '$'
            program_counter++; //increment the program reader count
            if (program_counter>99){
              program_counter=0; //loop the buffer back to zero. 
            }
          }

          
        }
        if (inchar == '$'){
          //start new program
          program_no++;
          program_counter =0; //reset program counter
          Isseperator=0; //the next byte is not seperator

          //reset data in the buff
          memset (buff_ary,0,100);
          //Serial.println("found new program");
        }
        
      }
    //loadProcPara(program_no);
    ProgramFile.close(); // close file before return   
    delay(100); // give time to closes file
    //load userprogram data into global varibale
    // variable to be loaded: processName, processTime, push by LCD
    //                        processTotalSteps, processTemp, by processing

    // step information to be loaded in processing these can be loaded from new datastype
    //      stepName[i]
    //      stepIn[i]
    //      stepTime[i]
    //      stepOut[i]
    //      stepPush[i]


    //return loaderr;
  }else {
    // if the file didn't open, print an error:
    // Serial.println("error opening PROGROMS1.txt");

   // return 5; // can't open file from SD card
   loaderr =5;
  }
  }
  *SD_err = loaderr;
  SD.end(); //end Sd communication after loading. 
  delay(100);
}

void loadProcPara(int program_no){
  for (int i = 0; i < program_no; i++) {// for all program found in the SD file
    processTime[i] = userProgram[i].duration ;
    processTotalSteps[i] = userProgram[i].numberofstep;
    processName[i] = userProgram[i].processName; //get name
    processTemp[i] = userProgram[i].temp ; //get process temperature

    processTime[i] = processTime[i] * 1.2; //get estimated process time

    processParaSet[i] = 1; //flag the processed has been prepared is parameters set
  } 
  delay(1);
  tempTarget = processTemp[0];
}
/*
 * loadproc1 is an update version that load from the actual data instead of from a string
 */
void loadProc1() {
  static int Proc_load =1;

  Serial.println("loadProc() //****");

  if  (Proc_load==1){
    for (int i = 0; i < 6; i++) {// for all program found in the SD file
      processTime[i] = ProgramList[i].duration ;
      processTotalSteps[i] = ProgramList[i].numberofstep;
      processName[i] = ProgramList[i].processName; //get name
      processTemp[i] = ProgramList[i].temp ; //get process temperature
  
      processTime[i] = processTime[i] * 1.2; //get estimated process time
  
      processParaSet[i] = 1; //flag the processed has been prepared is parameters set
    }

    delay(1);
  }
  Proc_load=1;
  tempTarget = processTemp[0];

}
void loadProc2() {
  static int Proc_load =1;

  Serial.println("loadProc() //****");
  program_no = 0;
  if  (Proc_load==1){
    for (int i = 0; i < 6; i++) {// for all program found in the SD file
      if (validROMprogram[i]==1){
        // only load valid program from ROM to processing
        processTime[i] = ROMProgram[i].duration ;
        processTotalSteps[i] = ROMProgram[i].numberofstep;
        processName[i] = ROMProgram[i].processName; //get name
        processTemp[i] = ROMProgram[i].temp ; //get process temperature
    
        processTime[i] = processTime[i] * 1.2; //get estimated process time
    
        processParaSet[i] = 1; //flag the processed has been prepared is parameters set
        program_no ++;
        Serial.println(i);
      }
    }

    delay(1);
  }
  Proc_load=1;
  tempTarget = processTemp[0];

}
/*
 * old routine, where the load processing is from a string instead of a datatype
 */
void loadProc() {
  static int Proc_load=1;
  //load process string from EEPROM bucket 2-9 and transfor to variable
  String processStr[6] = {};

  Serial.println("loadProc() //****");

  if  (Proc_load==1){
    for (int i = 0; i < 6; i++) {
      //processStr[i] = readFromRom(i + 2);
      switch (i){
        case 0:
        processStr[i] =  " "; //    
        break;
        case 1:
        processStr[i] = " "; //    
        break;  
        case 2:
        processStr[i] = " "; // 
        break;  
        case 3:
        processStr[i] = " "; //  
        break;        
        case 4:
        processStr[i] = " "; //   
        break;        
        case 5:
        processStr[i] = " "; //    
        break;  

      }
  
     DEBUG_PRINTln(processStr[i]);
     // enter if loop when str loaded is not empty
     // i represent each processing program
      if (processStr[i].length() > 0) {
        
        processTime[i] = 0;
        processTotalSteps[i] = 0;
        // j represent each step orsection separated by | in each processing program
        for (int j = 0; j < 20; j++) {
          
          processPara[i][j] = splitString(processStr[i], '|', j); //get process parameter as string
  
          if (processPara[i][j].length() > 5) { //means there is somnething
  
            processTime[i] += splitString(processPara[i][j], '/', 2).toInt(); //get process time
            processTotalSteps[i] ++; //get process total steps
  
            Serial.print("Process Parameter ");
            Serial.print(i);
            Serial.print("/");
            Serial.print(j);
            Serial.print(": ");
            Serial.println(processPara[i][j]);
          }
        }
  
        processName[i] = splitString(processPara[i][0], '/', 0); //get name
        processTemp[i] = splitString(processPara[i][0], '/', 1).toInt(); //get process temperature
  
        processTime[i] = processTime[i] * 1.2; //get estimated process time
        processTotalSteps[i] -= 1; //get the total step
  
        Serial.println("processName" + String(i) + ":" + processName[i]);
        Serial.println("processTime" + String(i) + ":" + String(processTime[i]));
        Serial.println("processTemp" + String(i) + ":" + String(processTemp[i]));
        Serial.println("processTotalSteps" + String(i) + ":" + String(processTotalSteps[i]));
  
        processParaSet[i] = 1;
      } else {
        Serial.print("Process Parameter ");
        Serial.print(i);
        Serial.println(" Not Found");
      }
    }
      delay(1);
  }
  Proc_load=1;
  tempTarget = processTemp[0];

}

void loadSetup() {

  String str;
  
  //str = readFromRom(0);
  Serial.println("loadSetup() //****");

  if (str.length() > 0) {

    lcd.setCursor(0, 2);
    lcd.print("Setup Loaded");

//    for (int i = 0; i <= 5; i++) {
//
//      buttonPinValMark[i] = splitString(splitString(str, '|', 0), '/', i).toInt();
//      Serial.print("buttonPinVal ");
//      Serial.print(i);
//      Serial.print(" : ");
//      Serial.println(buttonPinValMark[i]);
//    }
//  } else {
//
//    lcd.setCursor(0, 2);
//    lcd.print("Setup Not Loaded");
//    errorCode(100);
//
//    Serial.println("Setup Not Loaded");
  }
}

void writeProc(int bucketNo, int stepNo, String str) {

}

//void writeSetup(int stepNo, String inputStr, char separator) {
//
//  Serial.println("writeSetup //****");
//
//  String previousStr = readFromRom(0);
//  String keepStr = "";
//  String newStr = "";
//
//  char buff[previousStr.length() + 1];
//
//  previousStr.toCharArray(buff, (previousStr.length() + 1));
//
//  int index = 0;
//  int indexPrevious = 0;
//  int count = 0;
//
//  for (int i = 0; i < previousStr.length() + 1; i++) {
//    Serial.print("buff[i]: ");
//    Serial.println(buff[i]);
//    if (String(buff[i]) == String(separator)) {
//      Serial.println("found separator");
//      indexPrevious = index;
//      index = i;
//      Serial.print("indexPrevious: ");
//      Serial.print(indexPrevious);
//      Serial.print(" index: ");
//      Serial.print(index);
//      Serial.print(" count: ");
//      Serial.println(count);
//
//      if (count == stepNo) {
//        if (stepNo == 0) {
//          newStr = '$' + inputStr + previousStr.substring(index);
//        } else {
//          newStr = '$' + keepStr + String(separator) + inputStr + previousStr.substring(index);
//        }
//      } else {
//        keepStr = previousStr.substring(0, index);
//      }
//
//      count++;
//    }
//  }
//
//  Serial.print("newStr: ");
//  Serial.println(newStr);
//
//  writeToRom(0, newStr);
//
//}
