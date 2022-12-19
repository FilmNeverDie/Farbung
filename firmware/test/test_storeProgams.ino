#include <SD.h>
#include <SPI.h>
#include <stdlib.h>

// arudino mega SPI pins, change below for different MCU
#define SD_MISO 50
#define SD_MOSI 51
#define SD_SCK 52
#define SD_SS 53
// change this constant for the name of the file you wish to saved the programs to
#define storedfile "progroms.txt"

/*
 * data struct for each step of any process
 */
struct processStep {
  // each step has exactly 6 bytes
  int8_t stepcode; // code that representing different process step, see stepName for the steps
  int8_t inputtank;  // input tank ID, self explaning
  uint16_t duration; // duration of the step, self explaning
  int8_t outputtank; // output tank ID, self explaning
  int8_t push; /*
            whether the step can be push or not, note that arduino use 8 bit for bool anyway,
            and this allow future expansion of individually controlled push/pull operation
*/
};
// define the data struct for step as a new type caled processStep
typedef struct processStep processStep;//define the new struct as a new type


/*
 * data strut for each process programs
 */
struct processProgram {
  // each program has 6*numberofstep + 4 + length(processName) of byte
  // ProcessName is a  max of 19 chr. so max size is 23+6*numberofstep
  char* processName; // apoint to the char array, again String is not require unless operation with it need to be done by the string class
  uint16_t duration;
  int8_t numberofstep;
  int8_t temp = 22; //default temperature value if undefined
  processStep * processes; // this is a pointer to the struct array of processtep
};
// defining a new datatype for the struct
typedef struct processProgram processProgram; //define the new struct as a new type

const int8_t numberofprogram = 8;
// initilsation of a list of programs
processProgram ProgramList[numberofprogram]; //allow up to 8 programs in CP8000, change number to increase the list

// note that string class is not required since we will only be using this stepname on the UI,
// we need not other operation in the string class
const char* const stepNames[] =  {"end","soak","rinse","fix", "hypo", "dev", "bleach", "stablizer"};


// string to buffer output
String buffer;

// change this to store the number of program you list to store on SD card


File root;
File ProgramFile;
File myFile;
int f = 0; //file incrementator
char * filelist[64] = {};

void setup() {
  Serial.begin(115200);

// change the process Name for each entry of the program list with the program name you wish to stored
  ProgramList[0].processName = "5 step";
  ProgramList[1].processName = "BW_15min";
  ProgramList[2].processName = "colorC41";
  ProgramList[3].processName = "random2";
  ProgramList[4].processName = "random3";
  ProgramList[5].processName = "random4";
  ProgramList[6].processName = "random5";
  ProgramList[7].processName = "random6";   
  
  Serial.println(ProgramList[2].processName);
  //Serial.println(sizeof(ProgramList[0].processName));

// duration is in second, change the respective entry of the program list with the duration of each process
  ProgramList[0].duration = 10 * 60;
  ProgramList[1].duration = 15 * 60;
  ProgramList[2].duration = 37 * 60;
  ProgramList[3].duration = 12 * 60;
  ProgramList[4].duration = 9 * 60;
  ProgramList[5].duration = 19 * 60;
  ProgramList[6].duration = 16 * 60;
  ProgramList[7].duration = 20 * 60;

// change the respective entry of the list with the number of step of each program 
  ProgramList[0].numberofstep = 5;
  ProgramList[1].numberofstep = 7;
  ProgramList[2].numberofstep = 8;
  ProgramList[3].numberofstep = 7;
  ProgramList[4].numberofstep = 7;
  ProgramList[5].numberofstep = 7;
  ProgramList[6].numberofstep = 7;
  ProgramList[7].numberofstep = 7;


   ProgramList[2].temp = 38;
  // a loop that quickly initialise the number of step struct require for each program on the list
for( int i=0;i<numberofprogram;i++){
  ProgramList[i].processes = new processStep[ProgramList[i].numberofstep] ;
}

  // change below to edit the name of each step, these should be standard process step, refer to StepNames array
  // Make sure the length of process is consistent with the number of step defined in each program previously
  ProgramList[0].processes[0].stepcode = 1; //soak
  ProgramList[0].processes[1].stepcode = 5; //dev
  ProgramList[0].processes[2].stepcode = 2; //rinse
  ProgramList[0].processes[3].stepcode = 4; //hypo
  ProgramList[0].processes[4].stepcode = 2; //rinse
  ProgramList[0].processes[5].stepcode = 6; //Bleach

  // change the inputtank varaibles to represeent which valve is use for the input of each respective process step
  ProgramList[0].processes[0].inputtank = 6; //soak
  ProgramList[0].processes[1].inputtank = 1; //dev
  ProgramList[0].processes[2].inputtank = 6; //rinse
  ProgramList[0].processes[3].inputtank = 5; //hypo
  ProgramList[0].processes[4].inputtank = 6; //rins
  ProgramList[0].processes[5].inputtank = 2; //Bleach
 // change the outputtank varaibles to represeent which valve is use for the output of each respective process step
  ProgramList[0].processes[0].outputtank = 5; //soak
  ProgramList[0].processes[1].outputtank = 5; //dev
  ProgramList[0].processes[2].outputtank = 5; //rinse
  ProgramList[0].processes[3].outputtank = 4; //hypo
  ProgramList[0].processes[4].outputtank = 5; //rinse
  ProgramList[0].processes[5].outputtank = 5; //Bleach
  // change the duration  varaibles to represent the duration of each step
  ProgramList[0].processes[0].duration = 60; //soak
  ProgramList[0].processes[1].duration = 60 * 10; //dev
  ProgramList[0].processes[2].duration = 60; //rinse
  ProgramList[0].processes[3].duration = 180; //hypo
  ProgramList[0].processes[4].duration = 60; //rinse
  ProgramList[0].processes[5].duration = 60; //bleach
  // change the push varaibles to indicate whether each respective step is push-able
  ProgramList[0].processes[0].push = 0; //soak
  ProgramList[0].processes[1].push = 1; //dev
  ProgramList[0].processes[2].push = 0; //rinse
  ProgramList[0].processes[3].push = 0; //hypo
  ProgramList[0].processes[4].push = 0; //rinse
  ProgramList[0].processes[5].push = 0; //bleach

  /* 
   *  copy annd paste the program for each  process program and fill in the value of each step
   *  make sure the step all 5 variables of each process step is filled
   *  make sure each program has fill the same number of step as it was define
   *  and make sure fill all program as define in the begining. 
   */
  ProgramList[1].processes[0].stepcode = 1; //soak
  ProgramList[1].processes[1].stepcode = 5; //dev
  ProgramList[1].processes[2].stepcode = 2; //rinse
  ProgramList[1].processes[3].stepcode = 3; //fix
  ProgramList[1].processes[4].stepcode = 2; //rinse
  ProgramList[1].processes[5].stepcode = 4; //hypo
  ProgramList[1].processes[6].stepcode = 2; //rinse

  ProgramList[1].processes[0].inputtank = 6; //soak
  ProgramList[1].processes[1].inputtank = 1; //dev
  ProgramList[1].processes[2].inputtank = 6; //rinse
  ProgramList[1].processes[3].inputtank = 2; //fix
  ProgramList[1].processes[4].inputtank = 6; //rinse
  ProgramList[1].processes[5].inputtank = 5; //hypo
  ProgramList[1].processes[6].inputtank = 6; //rinse

  ProgramList[1].processes[0].outputtank = 5; //soak
  ProgramList[1].processes[1].outputtank = 5; //dev
  ProgramList[1].processes[2].outputtank = 5; //rinse
  ProgramList[1].processes[3].outputtank = 2; //fix
  ProgramList[1].processes[4].outputtank = 5; //rinse
  ProgramList[1].processes[5].outputtank = 4; //hypo
  ProgramList[1].processes[6].outputtank = 5; //rinse

  ProgramList[1].processes[0].duration = 60; //soak
  ProgramList[1].processes[1].duration = 60 * 15; //dev
  ProgramList[1].processes[2].duration = 60; //rinse
  ProgramList[1].processes[3].duration = 60 * 15; //fix
  ProgramList[1].processes[4].duration = 60; //rinse
  ProgramList[1].processes[5].duration = 180; //hypo
  ProgramList[1].processes[6].duration = 60; //rinse

  ProgramList[1].processes[0].push = 0; //soak
  ProgramList[1].processes[1].push = 1; //dev
  ProgramList[1].processes[2].push = 0; //rinse
  ProgramList[1].processes[3].push = 0; //fix
  ProgramList[1].processes[4].push = 0; //rinse
  ProgramList[1].processes[5].push = 0; //hypo
  ProgramList[1].processes[6].push = 0; //rinse


  //stepNames[] = {"end", "soak", "rinse", "fix", "hypo", "dev","bleach", "stabaliser"};
  ProgramList[2].processes[0].stepcode = 2; //rinse
  ProgramList[2].processes[1].stepcode = 5; //dev
  ProgramList[2].processes[2].stepcode = 6; //bleach
  ProgramList[2].processes[3].stepcode = 2; //rinse
  ProgramList[2].processes[4].stepcode = 3; //fix
  ProgramList[2].processes[5].stepcode = 2; //rinse
  ProgramList[2].processes[6].stepcode = 7; //stabliser
  ProgramList[2].processes[7].stepcode = 2; //rinse

  ProgramList[2].processes[0].inputtank = 6; //
  ProgramList[2].processes[1].inputtank = 1; //
  ProgramList[2].processes[2].inputtank = 2; //
  ProgramList[2].processes[3].inputtank = 6; //
  ProgramList[2].processes[4].inputtank = 5; //
  ProgramList[2].processes[5].inputtank = 6; //
  ProgramList[2].processes[6].inputtank = 4; //
  ProgramList[2].processes[7].inputtank = 6; //

  ProgramList[2].processes[0].outputtank = 5; //
  ProgramList[2].processes[1].outputtank = 5; //
  ProgramList[2].processes[2].outputtank = 5; //
  ProgramList[2].processes[3].outputtank = 5; //
  ProgramList[2].processes[4].outputtank = 5; //
  ProgramList[2].processes[5].outputtank = 5; //
  ProgramList[2].processes[6].outputtank = 5; //
  ProgramList[2].processes[7].outputtank = 5; //

  ProgramList[2].processes[0].duration = 180; //rinse
  ProgramList[2].processes[1].duration = 60 * 4; //dev
  ProgramList[2].processes[2].duration = 70; //bleach
  ProgramList[2].processes[3].duration = 60 *3; //rinse
  ProgramList[2].processes[4].duration = 140; //fix
  ProgramList[2].processes[5].duration = 180; //rinse
  ProgramList[2].processes[6].duration = 120; //stabliser
  ProgramList[2].processes[7].duration = 180; //rinse

  ProgramList[2].processes[0].push = 0; //rins
  ProgramList[2].processes[1].push = 1; //dev
  ProgramList[2].processes[2].push = 0; //bleach
  ProgramList[2].processes[3].push = 0; //rinse
  ProgramList[2].processes[4].push = 0; //fix
  ProgramList[2].processes[5].push = 0; //rinse
  ProgramList[2].processes[6].push = 0; //stabliser
  ProgramList[2].processes[7].push = 0; //rinse
  
// do not change below //
/////////////////////////////////////////////////////////////////

  // reserve 1kB for String used as a buffer
  buffer.reserve(1024);

  if (!SD.begin(SD_SS)) {
    Serial.println("Card failed, or not present");
    //     don't do anything more:
    while (1);
  }

  // list files from SD card
  root = SD.open("/");
  // all names are saved in an array called filelist
  printDirectory(root, 0);

  Serial.println("before datablock");

  // open the file. note that only one file can be open at a time,
  // so you have to close this one before opening another.
  myFile = SD.open("myfile.txt", FILE_WRITE);
  myFile.close();
  char myname[] = "myfile1.txt";
  myFile = SD.open(myname, FILE_WRITE);
  myFile.close();
  char filename[] = storedfile;
  ProgramFile = SD.open(filename, FILE_WRITE);
  ProgramFile.close();
  if (SD.exists(filename)) {

    Serial.println("file exists.rename defualt ");
    while (SD.exists(filename)) {
      f++;
      char conv[3];
      itoa(f, conv, 10);
      conv[2] = '\0';
      //if filename exist, change it with added iteration nnumber
      sprintf(filename, "programs%u.txt", f);
    }
  } else {

    Serial.println("file doesn't exist. create new");

  }
  Serial.println(filename);
  // int p=1;
  //  char *str;
  //  int e = sprintf(str,"%s/%c/%c%c/%c/%c|",ProgramList[p].processName,ProgramList[p].duration>>8,ProgramList[p].duration,ProgramList[p].numberofstep,ProgramList[p].temp);
  //  Serial.println(str);

  // if the file is available, write to it:
    SD.remove("progroms.txt");
  ProgramFile = SD.open("programs.txt", FILE_WRITE);

  if (ProgramFile) {
    //  char dataString[100];
    // this functio will flatten the programList strcut into a single array
    // flattenprogram(dataString, ProgramList,2);



    Serial.println("asa");

    /*
       writing data

       first write the file data: &, number of progams, parity check.
       parity check = number of progams + &

       then for each program
       stored each steps

    */
    ProgramFile.write('&');
    ProgramFile.write(numberofprogram);
    int8_t parity = numberofprogram + '&';
    ProgramFile.write(parity);
    Serial.println("ddd");
    for (int p = 0; p < numberofprogram; p++) {
      char str[64];
      int e = sprintf(str, "$%s%c%c%c%c|", ProgramList[p].processName, ProgramList[p].duration >> 8, ProgramList[p].duration, ProgramList[p].numberofstep, ProgramList[p].temp);
      Serial.println(str);
      Serial.println(e);
      //  while (ProgramFile.available()) {
      ProgramFile.write(str,e);
      // }


      for (int n = 0; n < ProgramList[p].numberofstep; n++) {
        char str[64];
        int e = sprintf(str, "%c%c%c%c%c%c|", ProgramList[p].processes[n].stepcode, ProgramList[p].processes[n].inputtank, ProgramList[p].processes[n].duration >> 8,
                ProgramList[p].processes[n].duration, ProgramList[p].processes[n].outputtank, ProgramList[p].processes[n].push);
        Serial.println(str);
        Serial.println(e);
        // while (ProgramFile.available()) {
        ProgramFile.write(str,e);
        Serial.print("wrote");
        // }
      }
      // above process is obselete given we can't use str to store data, we write direct to the file

    }
    //     ProgramFile.write(dataString);
    //   ProgramFile.write(dataString);
    ProgramFile.close();
  }
  // if the file isn't open, pop up an error:
  else {
    Serial.println("error opening userprogram.txt");
  }


  Serial.println("ENDO");
}

void loop() {
  // put your main code here, to run repeatedly:
  int a = 1;


}
void flattenprogram(char* datastring , processProgram* programlist, int programNo) {
  int len = 0;

  /*
     datat format

     (size of program)$(programName)/duration/numberofstep/temp|stepcode1/inputtank1/duration1/outputtank1/push1|......stepcodeN/inputankN/durationN/outputtankN/pushN|
  */
  // ProcessName is a  max of 19 chr. so max size is 23+6*numberofstep

  //calculte the total size fo the program list
  // for (int p = 0; p<programNo;p++){
  //     len +=
  //  }


  for (int p = 0; p < programNo; p++) {
    // begining of each process program
    *datastring = * datastring + 'S'; // all data block begin with $ sign
    //int NameLen = programlist[p].processName
    char str[64];
    sprintf(str, "%s/%c/%c%c/%c|", programlist[p].processName, programlist[p].duration >> 8, programlist[p].duration, programlist[p].numberofstep, programlist[p].temp);
    Serial.println(str);
    *datastring = * datastring + str;
    //*datastring.concat(str);

    for (int n = 0; n < programlist[p].numberofstep; n++) {
      char str[64];
      sprintf(str, "%c/%c/%c%c/%c/%c|", programlist[p].processes[n].stepcode, programlist[p].processes[n].inputtank, programlist[p].processes[n].duration >> 8,
              programlist[p].processes[n].duration, programlist[p].processes[n].outputtank, programlist[p].processes[n].push);
      //*datastring.concat(str);
      *datastring = * datastring + str;
    }
  }
  Serial.println(datastring);
}

void printDirectory(File dir, int numTabs) {
  int n = 0;
  while (true) {

    File entry =  dir.openNextFile();
    if (! entry) {
      // no more files
      break;
    }

    for (uint8_t i = 0; i < numTabs; i++) {
      Serial.print('\t');
    }
    Serial.print(entry.name());
    // stored filename in an array
    filelist[n] = entry.name();
    n++;
    if (entry.isDirectory()) {
      Serial.println("/");
      printDirectory(entry, numTabs + 1);
    } else {
      // files have sizes, directories do not
      Serial.print("\t\t");
      Serial.println(entry.size(), DEC);
    }
    entry.close();
  }
}
