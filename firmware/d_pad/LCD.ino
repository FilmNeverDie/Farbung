void lcdWrite1() {
   String menu_arrow[4] = {" "," "," "," "};
   menu_arrow[user_navi.row]=">";
  // menuRow=menu_navi.row;
   menuColumn = menu_navi.layer;

  //all swtich case need to be representation of rowstack[][1] = {x,x,x,x} and actionstack
  switch (menuColumn) {

    case 0: //**********************************menuColumn 0
   // rowstak = {0,0,0,0}

//      //load menu map into lcdstr base on the menu navigation, 
       lcdStr[0] = menu_arrow[0] + menuTop [menu_navi.row-user_navi.row];
       lcdStr[1] = menu_arrow[1] + menuTop [menu_navi.row-user_navi.row+1];
       lcdStr[2] = menu_arrow[2] + menuTop [menu_navi.row-user_navi.row+2];
       lcdStr[3] = menu_arrow[3] + menuTop [menu_navi.row-user_navi.row+3];

      break;

    case 1: //**********************************menuColumn 1
      
      if (rowstack[0][1] == 0 ) { //1/0 Info Screen, rowstack = {0,x,x,x}

        if (processState == 0) { //not processing

          lcdStr[0] = "--Not Processing--";
          lcdStr[1] = "";
          lcdStr[2] = "";
          lcdStr[3] = "";

        } else if (processState == 1) { //while processing
          if (infopage==0){
              lcdStr[0] = fillStr(processName[processNo], 10);
              lcdStr[0] = lcdStr[0] + "Step:" + String(stepNo + 1) + "/" + String(processTotalSteps[processNo]);
    
              if (push == 0) { //no push
                lcdStr[1] = "--";
              } else if (push < 0) { //pull
                lcdStr[1] = "-" + String(abs(push));
              } else { //push
                lcdStr[1] = "+" + String(abs(push));
              }
              // display dummy count
              lcdStr[1] = lcdStr[1] + " +" + String(dummyroll);
    
              lcdStr[1] = fillStr(stepName[stepNo], 10) + lcdStr[1];
              if (stepTimer2 > 0) {
                lcdStr[2] = getTime(timer / 1000 - stepTimer2);
              } else {
                lcdStr[2] = "--:--";
              }
              lcdStr[2] = lcdStr[2] + "/" + getTime(stepTime[stepNo]);
              lcdStr[3] = "";    
    
            if (heater.State() == 1) { //blinking temp symbol of heater is on
    
              if (timer % 1000 <= 500) {
    
                lcdStr[3] = "H";
              } else {
                lcdStr[3] = "h";
              }
            } else { //normal temp synbol if heater is off
              lcdStr[3] = "h";
            }
            
            if (flowin){
              lcdStr[2] = lcdStr[2] + " flowIN";
            }else if (flowout){
              lcdStr[2] = lcdStr[2] + " flowOUT";
            }
    
            lcdStr[3] = lcdStr[3] + getFloat(tempCurrent) + "/" + String(round(tempTarget));
          }else if (infopage==1){
            lcdStr[0] = "stepping mode";
            if (steppingmode==0){
              lcdStr[1] = "sensor";
              lcdStr[2] = "process depend on ";
              lcdStr[3] = "sensor feedback";
            }else{
              lcdStr[1] ="fixed timer";
              lcdStr[2] = "processs with ";
              lcdStr[3] = "fixed timing";
            }
            

          }
        }
      } else if (rowstack[0][1] == 1) { //this change to a coice of SD or ROM
        // 1/1-1/6 select processing 1-6 to run, rowstak = {1,x,x,x}
            lcdStr[0] = "load from skecth";
            lcdStr[1] = "load from SD";
            lcdStr[2] = "load from EEPROM";
            lcdStr[3] = "";
            for (int i = 0; i < 3; i++) {
              if (i == menuRow) {
                lcdStr[i] = ">" + lcdStr[i];
              } else {
                lcdStr[i] = " " + lcdStr[i];
              }
            }
      }  else if (rowstack[0][1] == 2) { //1/7-1/9 select stop process / clean process 1-2 to run, rowstak = {2,x,x,x}

        lcdStr[0] = "Stop Processing";
        lcdStr[1] = "Clean Process 1";
        lcdStr[2] = "Clean Process 2";

        for (int i = 0; i < 3; i++) {
          if (i == menuRow) {
            lcdStr[i] = ">" + lcdStr[i];
          } else {
            lcdStr[i] = " " + lcdStr[i];
          }
        }
      } else if (rowstack[0][1] == 3) { //1/10 break point data, rowstak = {3,x,x,x}

        lcdStr[0] = "_VOID FUNCTION_";
        lcdStr[1] = "";
        lcdStr[2] = "";
        lcdStr[3] = "";

      } else if (rowstack[0][1] == 4) { //1/11-1/16 select process 1-6 to edit, rowstak = {4,x,x,x}
        if (menuRow <= 3) { //current row could be 0-5

          // the processName is a char array pointer, in order to use strncpy both array has to be same type
          // however, lcdStr is String type not char array
          // thus instead of typing the vaiabrale out for lcd, we load the array into a temp array and add a \0 at the end
          
         for(int i=0;i<4;i++){
          char tmpName[14];
          strncpy(tmpName,ROMProgram[i].processName,13);
          tmpName[13] = '\0'; 
          lcdStr[i] =  tmpName;
          lcdStr[i] = "Edit " + lcdStr[i];
          if (i == menuRow) {
            // i will be where the menu_vai.row is
            lcdStr[i] = ">" + lcdStr[i];
          } else {
            lcdStr[i] = " " + lcdStr[i];
          }
         }
//         char tmpName[14];
//         strncpy(tmpName,ROMProgram[0].processName,13);
//         tmpName[13] = '\0'; 
//          lcdStr[0] =  tmpName;
//          strncpy(tmpName,ROMProgram[1].processName,13);
//         tmpName[13] = '\0'; 
//          lcdStr[1] =  tmpName;
//          strncpy(tmpName,ROMProgram[2].processName,13);
//         tmpName[13] = '\0'; 
//          lcdStr[2] =  tmpName;
//          strncpy(tmpName,ROMProgram[3].processName,13);
//         tmpName[13] = '\0'; 
//          lcdStr[3] =  tmpName;
//          lcdStr[0] = "Edit" + lcdStr[0];
//          lcdStr[1] = "Edit" + lcdStr[1];
//          lcdStr[2] = "Edit" + lcdStr[2];
//          lcdStr[3] = "Edit" + lcdStr[3];
//          for (int i = 0; i < 4; i++) {
//            if (i == menuRow) {
//              // i will be where the menu_vai.row is
//              lcdStr[i] = ">" + lcdStr[i];
//            } else {
//              lcdStr[i] = " " + lcdStr[i];
//            }
//          }

        } else if (menuRow > 3) {
          // this case is active when the page row scroll beyond the 4th row and starting display the 2nd row first
          // menu_navi is as big as the pagerow variable of the state, and userUI is max at 3 ( 4 rows)

          for(int i=0;i<4;i++){
            char tmpName[14];
            strncpy(tmpName,ROMProgram[menu_navi.row-user_navi.row+i].processName,13);
            tmpName[13] = '\0'; 
            lcdStr[i] =  tmpName;
          }
//          lcdStr[0] =  ROMProgram[menu_navi.row-user_navi.row].processName;
//          lcdStr[1] =  ROMProgram[menu_navi.row-user_navi.row+1].processName;
//          lcdStr[2] =  ROMProgram[menu_navi.row-user_navi.row+2].processName;
//          lcdStr[3] =  ROMProgram[menu_navi.row-user_navi.row+3].processName;
          lcdStr[0] = " Edit " + lcdStr[0];
          lcdStr[1] = " Edit " + lcdStr[1];
          lcdStr[2] = " Edit " + lcdStr[2];
          lcdStr[3] = ">Edit " + lcdStr[3];
        }
      } else if (rowstack[0][1] == 5) { //1/17-1/19 2nd Menu"Input Check"/"Output Check", rowstak = {5,x,x,x}

        lcdStr[0] = "Input Check";
        lcdStr[1] = "Output Check";
        lcdStr[2] = "Agit.Speed Setting";

        for (int i = 0; i < 3; i++) {
          if (i == menuRow) {
            lcdStr[i] = ">" + lcdStr[i];
          } else {
            lcdStr[i] = " " + lcdStr[i];
          }
        }
      } else { //default, this page should exend beyond 3 rows

      }

      break;

    case 2: //**********************************menuCloumn 2

      if (rowstack[1][1] == 0 && rowstack[0][1] == 0) { //2/0 NULL, rowstack = {0,0,x,x}

        lcdStr[0] = "!MENU POSITION NULL!";
        lcdStr[1] = "";
        lcdStr[2] = "";
        lcdStr[3] = "";

      } else if (rowstack[0][1] == 1 && rowstack[1][1] <= 2) { // change to when it is load from ROM, 1/0-2
          // remember to load SD userProgram[N].processName into global processname

          if (SD_err ==0 || rowstack[1][1] == 0 || rowstack[1][1] == 2){
            lcdStr[0] = menu_arrow[0] + processName[menu_navi.row-user_navi.row];
            lcdStr[1] = menu_arrow[1] + processName[menu_navi.row-user_navi.row+1];
            lcdStr[2] = menu_arrow[2] + processName[menu_navi.row-user_navi.row+2];
            lcdStr[3] = menu_arrow[3] + processName[menu_navi.row-user_navi.row+3];
          }else if (SD_err>0){
            lcdStr[0] = "SD error found";
            lcdStr[1] = "Error: " + String(SD_err);
            lcdStr[2] = "Press B to return";
            lcdStr[3] = " ";
          }
          //below push to layer 3
        //2/1-2/6 processing 1-6 execute confirmation, rowstack = {1,0-5,x,x}
//        lcdStr[0] = "Proc Name:" + processName[processNo];
//        lcdStr[1] = "Est. Time:" + getTime(processTime[processNo]);
//        if (push == 0) {
//          lcdStr[2] = "---";
//        } else if (push < 0) {
//          lcdStr[2] = "-" + String(abs(push));
//        } else if (push > 0) {
//          lcdStr[2] = "+" + String(push);
//        }
//        lcdStr[2] = "+/-:" + lcdStr[2];
//
//        lcdStr[3] = "Yes to Start";
      } else if (rowstack[0][1] == 2 && rowstack[1][1] == 0) { //2/7 stop process execute confirmation, rowstack = {2,0,x,x}
        lcdStr[0] = "Stop Processing";
        lcdStr[1] = "";
        lcdStr[2] = "";
        lcdStr[3] = "Yes to Stop";
      } else if (rowstack[0][1] == 2 && rowstack[1][1] == 1) { //2/8 clean process 1 execute confirmation, rowstack = {2,1,x,x}
        lcdStr[0] = "Clean Process";
        lcdStr[1] = "Insert Plug";
        lcdStr[2] = "IN 6 + OUT 6";
        lcdStr[3] = "Yes to Start";
      } else if (rowstack[0][1] == 2 && rowstack[1][1] == 2) { //2/9 clean process 2 execute confirmation, rowstack = {2,2,x,x}
        lcdStr[0] = "Deep Clean";
        lcdStr[1] = "InsertPlug";
        lcdStr[2] = "IN 1-6 + OUT 1-6";
        lcdStr[3] = "Yes to Start";
      } else if (rowstack[0][1] == 3 && rowstack[1][1] == 0) { //2/10 break point execute confirmation, rowstack = {3,0,x,x}
        lcdStr[0] = "_VOID FUNCTION_";
        lcdStr[1] = "";
        lcdStr[2] = "";
        lcdStr[3] = "";
      } else if (rowstack[0][1] == 4 && rowstack[1][1] <= 5) { //2/11-2/16 edit process 1-6, rowstack = {4,0-5,x,x}
        //edit process screen
        // this is going display a side scrolling menu with each side page allowing the user to increase or decrease the parameter

        char tempbuff[20]={};
        int displayPara[19];
        int stepnum = max(floor((editIndex-4)/5),0);
        int stepindex = max((editIndex-4)%5,0); // redunlecnet as of 2022/03/6
        // look up the data that are being edit
        int paraIndex = editIndex  - stepnum*5;
        if (editIndex==0){
          // this is process name
          displayPara[arrayIndex] = editPara[arrayIndex]  + 32;
          
          sprintf(tempbuff, "%s", ROMProgram[rowstack[1][1]].processName); // display paramter value is in char
        }else if(paraIndex==4){
          sprintf(tempbuff, "%s", stepNames[editPara[0]]); // display paramter value is in char
        }
        else{
          displayPara[0] = editPara[0];
          sprintf(tempbuff, "%d", displayPara[0]); // display paramter value is in int
        }
        
        //Serial.println(tempbuff);
        int currentstep= max(floor((editIndex-4)/5),0);
        lcdStr[0] = " Editing: Step:"+ String(currentstep + 1) + "/" + String(ROMProgram[rowstack[1][1]].numberofstep);
        lcdStr[1] = ROMProgram[rowstack[1][1]].processName; // rowstack[1][1]reflect the row of which process is selcte from the previous layer
        lcdStr[2] = paraNames[paraIndex]; //display paramter name
        lcdStr[3] = tempbuff;

        // alternative display, when user press right after editindex reached maxco
        // display "program reached the end no more step to edit" for 5 second
        if (millis()<popuptimer+5000 && editmenuEnd==1){
          lcdStr[0] = "All steps done";
          lcdStr[1] = "press B to exit"; // rowstack[1][1]reflect the row of which process is selcte from the previous layer
          lcdStr[2] = "left to revise"; //display paramter name
          lcdStr[3] = "";
        }
        else if (saving==1 && millis()<popuptimer+1000){
          lcdStr[0] = "pararmeter saved";
          lcdStr[1] = "";
          lcdStr[2] = "";
          lcdStr[3] = "";
        }else{
          saving=0;
        }
      } else if (rowstack[0][1] == 5 && rowstack[1][1] <= 0) { //2/17   input check, rowstack = {5,0,x,x}
        lcdStr[0] = "Input Check: ";
        lcdStr[1] = inputCheck(IOIndex, 0);
        lcdStr[1] = "</>" + lcdStr[1];
        lcdStr[2] = inputCheck(IOIndex, 1);
        lcdStr[2] = "Reading: " + lcdStr[2];
        lcdStr[3] = "";
        //TRACE();
      } else if (rowstack[0][1] == 5 && rowstack[1][1] <= 1) { //2/18  output check, rowstack = {5,1,x,x}
        lcdStr[0] = "Output Check:";
        lcdStr[1] = outputCheck(IOIndex, 0);
        lcdStr[1] = "</>" + lcdStr[1];
        lcdStr[2] = outputCheck(IOIndex, 1);
        lcdStr[3] = "Up: ON / Down: OFF";
        //TRACE();
      } else if (rowstack[0][1] == 5 && rowstack[1][1] <= 2) {// rowstack = {5,2,x,x}
        lcdStr[0] = "DOESNT DO IT:";
        lcdStr[1] = "";
        lcdStr[2] = "";
        lcdStr[3] = "";
      } else { //default
      }

      break;

    case 3:


      if (rowstack[0][1] == 4 && rowstack[1][1] <= 5 && rowstack[2][1] <= 0) { //3/0 NULL,  rowstack = {4,0-5,0,x}

      }else if (rowstack[0][1] == 1 && rowstack[1][1] < 3) { //3/0-1/6 processing 1-6 execute confirmation, rowstack = {1,0-1,N,x}
        
        lcdStr[0] = "Proc Name:" + processName[processNo];
        lcdStr[1] = "Est. Time:" + getTime(processTime[processNo]);
        if (push == 0) {
          lcdStr[2] = "---";
        } else if (push < 0) {
          lcdStr[2] = "-" + String(abs(push));
        } else if (push > 0) {
          lcdStr[2] = "+" + String(push);
        }
        
        
        lcdStr[2] = "+/-:" + lcdStr[2] + "  D:" +String(dummyroll);

        

        lcdStr[3] = "Yes to Start";
      } else if (rowstack[2][1] ==2) { //3/7 stop process execute confirmation

      } else if (rowstack[2][1] <=4) { //3/8-3/9 clean process 1-2 execute confirmation

      } else if (rowstack[2][1] ==5) { //3/10 break point execute confirmation

      } else if (rowstack[2][1] <=11) { //3/11-3/16 edit process 1-6 write confirmation

      } else if (rowstack[2][1] <= 16) { //3/17-3/21 input check 1-5

      } else if (rowstack[2][1] <= 21) { //3/22-3/26 output check 1-5

      } else { //default

      }

      break;

    default:

      lcdStr[0] = "LCD Got Nothing to Say";
      lcdStr[1] = "";
      lcdStr[2] = "";
      lcdStr[3] = "";

      Serial.println("LCD has nothing to say...");
  }

  lcdUpdate();

  delay(10);

  lcdStr[0] = "";
  lcdStr[1] = "";
  lcdStr[2] = "";
  lcdStr[3] = "";
}

void lcdWrite() {
   String menu_arrow[4] = {" "," "," "," "};
   menu_arrow[user_navi.row]=">";
  // menuRow=menu_navi.row;
  switch (menuColumn) {

    case 0: //**********************************menuColumn 0
       // rowstak = {x,x,x,x}
//      //load menu map into lcdstr base on the menu navigation, 
       lcdStr[0] = menu_arrow[0] + menuTop [menu_navi.row-user_navi.row];
       lcdStr[1] = menu_arrow[1] + menuTop [menu_navi.row-user_navi.row+1];
       lcdStr[2] = menu_arrow[2] + menuTop [menu_navi.row-user_navi.row+2];
       lcdStr[3] = menu_arrow[3] + menuTop [menu_navi.row-user_navi.row+3];

      break;

    case 1: //**********************************menuColumn 1

      if (rowstack[0][1] == 0) { //1/0 Info Screen, rowstack = {0,x,x,x}

        if (processState == 0) { //not processing

          lcdStr[0] = "--Not Processing--";
          lcdStr[1] = "";
          lcdStr[2] = "";
          lcdStr[3] = "";

        } else if (processState == 1) { //while processing

          lcdStr[0] = fillStr(processName[processNo], 10);
          lcdStr[0] = lcdStr[0] + "Step:" + String(stepNo + 1) + "/" + String(processTotalSteps[processNo]);

          if (push == 0) { //no push
            lcdStr[1] = "--";
          } else if (push < 0) { //pull
            lcdStr[1] = "-" + String(abs(push));
          } else { //push
            lcdStr[1] = "+" + String(abs(push));
          }

          lcdStr[1] = fillStr(stepName[stepNo], 10) + lcdStr[1];
          if (stepTimer2 > 0) {
            lcdStr[2] = getTime(timer / 1000 - stepTimer2);
          } else {
            lcdStr[2] = "--:--";
          }
          lcdStr[2] = lcdStr[2] + "/" + getTime(stepTime[stepNo]);
          lcdStr[3] = "";
        }

        if (heater.State() == 1) { //blinking temp symbol of heater is on

          if (timer % 1000 <= 500) {

            lcdStr[3] = "H";
          } else {
            lcdStr[3] = "h";
          }
        } else { //normal temp synbol if heater is off
          lcdStr[3] = "h";
        }

        lcdStr[3] = lcdStr[3] + getFloat(tempCurrent) + "/" + String(round(tempTarget));

      } else if (rowstack[0][1] == 1) { //1/1-1/6 select processing 1-6 to run, rowstak = {1,x,x,x}


          lcdStr[0] = menu_arrow[0] + processName[menu_navi.row-user_navi.row];
          lcdStr[1] = menu_arrow[1] + processName[menu_navi.row-user_navi.row+1];
          lcdStr[2] = menu_arrow[2] + processName[menu_navi.row-user_navi.row+2];
          lcdStr[3] = menu_arrow[3] + processName[menu_navi.row-user_navi.row+3];

      }  else if (rowstack[0][1] == 2) { //1/7-1/9 select stop process / clean process 1-2 to run, rowstak = {2,x,x,x}

        lcdStr[0] = "Stop Processing";
        lcdStr[1] = "Clean Process 1";
        lcdStr[2] = "Clean Process 2";

        for (int i = 0; i < 3; i++) {
          if (i + 7-7 == menuRow) {
            lcdStr[i] = ">" + lcdStr[i];
          } else {
            lcdStr[i] = " " + lcdStr[i];
          }
        }
      } else if (rowstack[0][1] == 3) { //1/10 break point data, rowstak = {3,x,x,x}

        lcdStr[0] = "_VOID FUNCTION_";
        lcdStr[1] = "";
        lcdStr[2] = "";
        lcdStr[3] = "";

      } else if (rowstack[0][1] == 4) { //1/11-1/16 select process 1-6 to edit, rowstak = {4,x,x,x}
        if (menuRow <= 14-11) { //current row could be 0-5

          lcdStr[0] = "Edit" + processName[0];
          lcdStr[1] = "Edit" + processName[1];
          lcdStr[2] = "Edit" + processName[2];
          lcdStr[3] = "Edit" + processName[3];

          for (int i = 0; i < 4; i++) {
            if (i == menuRow) {
              // i ranging from 11 to 15 
              lcdStr[i] = ">" + lcdStr[i];
            } else {
              lcdStr[i] = " " + lcdStr[i];
            }
          }

        } else if (menuRow > 14-11) {
          lcdStr[0] = " Edit " + processName[menuRow - 3];
          lcdStr[1] = " Edit " + processName[menuRow - 2];
          lcdStr[2] = " Edit " + processName[menuRow - 1];
          lcdStr[3] = ">Edit " + processName[menuRow - 0];
        }
      } else if (rowstack[0][1] == 5) { //1/17-1/19 2nd Menu"Input Check"/"Output Check", rowstak = {5,x,x,x}

        lcdStr[0] = "Input Check";
        lcdStr[1] = "Output Check";
        lcdStr[2] = "Agit.Speed Setting";

        for (int i = 0; i < 3; i++) {
          if (i + 17-17 == menuRow) {
            lcdStr[i] = ">" + lcdStr[i];
          } else {
            lcdStr[i] = " " + lcdStr[i];
          }
        }
      } else { //default

      }

      break;

    case 2: //**********************************menuCloumn 2

      if (rowstack[1][1] == 0 && rowstack[0][1] == 0) { //2/0 NULL, rowstack = {0,0,x,x}

        lcdStr[0] = "!MENU POSITION NULL!";
        lcdStr[1] = "";
        lcdStr[2] = "";
        lcdStr[3] = "";

      } else if (rowstack[0][1] == 1 && rowstack[1][1] <= 5) { //2/1-2/6 processing 1-6 execute confirmation, rowstack = {1,0-5,x,x}

        lcdStr[0] = "Proc Name:" + processName[processNo];
        lcdStr[1] = "Est. Time:" + getTime(processTime[processNo]);
        if (push == 0) {
          lcdStr[2] = "---";
        } else if (push < 0) {
          lcdStr[2] = "-" + String(abs(push));
        } else if (push > 0) {
          lcdStr[2] = "+" + String(push);
        }
        lcdStr[2] = "+/-:" + lcdStr[2];

        lcdStr[3] = "Yes to Start";
      } else if (rowstack[0][1] == 2 && rowstack[1][1] <= 0) { //2/7 stop process execute confirmation, rowstack = {2,0,x,x}

        lcdStr[0] = "Stop Processing";
        lcdStr[1] = "";
        lcdStr[2] = "";
        lcdStr[3] = "Yes to Stop";
      } else if (rowstack[0][1] == 2 && rowstack[1][1] <= 1) { //2/8 clean process 1 execute confirmation, rowstack = {2,1,x,x}
        lcdStr[0] = "Clean Process";
        lcdStr[1] = "Insert Plug";
        lcdStr[2] = "IN 6 + OUT 6";
        lcdStr[3] = "Yes to Start";
      } else if (rowstack[0][1] == 2 && rowstack[1][1] <= 2) { //2/9 clean process 2 execute confirmation, rowstack = {2,2,x,x}
        lcdStr[0] = "Deep Clean";
        lcdStr[1] = "InsertPlug";
        lcdStr[2] = "IN 1-6 + OUT 1-6";
        lcdStr[3] = "Yes to Start";
      } else if (rowstack[0][1] == 3 && rowstack[1][1] <= 0) { //2/10 break point execute confirmation, rowstack = {3,0,x,x}
        lcdStr[0] = "_VOID FUNCTION_";
        lcdStr[1] = "";
        lcdStr[2] = "";
        lcdStr[3] = "";
      } else if (rowstack[0][1] == 4 && rowstack[1][1] <= 5) { //2/11-2/16 edit process 1-6, rowstack = {4,0-5,x,x}

        //edit process screen

        lcdStr[0] = " WIP ";
        lcdStr[1] = "";
        lcdStr[2] = "";
        lcdStr[3] = "";
      } else if (rowstack[0][1] == 5 && rowstack[1][1] <= 0) { //2/17   input check, rowstack = {5,0,x,x}
        lcdStr[0] = "Input Check: ";
        lcdStr[1] = inputCheck(IOIndex, 0);
        lcdStr[1] = "</>" + lcdStr[1];
        lcdStr[2] = inputCheck(IOIndex, 1);
        lcdStr[2] = "Reading: " + lcdStr[2];
        lcdStr[3] = "";
        //TRACE();
      } else if (rowstack[0][1] == 5 && rowstack[1][1] <= 1) { //2/18  output check, rowstack = {5,1,x,x}
        lcdStr[0] = "Output Check: ";
        lcdStr[1] = outputCheck(IOIndex, 0);
        lcdStr[1] = "</>" + lcdStr[1];
        lcdStr[2] = outputCheck(IOIndex, 1);
        lcdStr[3] = "Up: ON / Down: OFF";
        //TRACE();
      } else if (rowstack[0][1] == 5 && rowstack[1][1] <= 2) {// rowstack = {5,2,x,x}
      } else { //default
      }

      break;

    case 3:


      if (rowstack[0][1] == 4 && rowstack[1][1] <= 5 && rowstack[2][1] <= 0) { //3/0 NULL,  rowstack = {4,0-5,0,x}

      } else if (rowstack[2][1] ==1) { //3/1-3/6 processing 1-6 execute confirmation{ //3/0 NULL,  rowstack = {4,0-5,1,x}

      } else if (rowstack[2][1] ==2) { //3/7 stop process execute confirmation

      } else if (rowstack[2][1] <=4) { //3/8-3/9 clean process 1-2 execute confirmation

      } else if (rowstack[2][1] ==5) { //3/10 break point execute confirmation

      } else if (rowstack[2][1] <=11) { //3/11-3/16 edit process 1-6 write confirmation

      } else if (rowstack[2][1] <= 16) { //3/17-3/21 input check 1-5

      } else if (rowstack[2][1] <= 21) { //3/22-3/26 output check 1-5

      } else { //default

      }

      break;

    default:

      lcdStr[0] = "LCD Got Nothing to Say";
      lcdStr[1] = "";
      lcdStr[2] = "";
      lcdStr[3] = "";

      Serial.println("LCD has nothing to say...");
  }

  lcdUpdate();

  delay(10);

  lcdStr[0] = "";
  lcdStr[1] = "";
  lcdStr[2] = "";
  lcdStr[3] = "";
}

String getTime(int S) {
  int min = S / 60;
  int sec = S % 60;

  String minStr = "";
  String secStr = "";

  if (min < 10) {
    minStr = "0" + String(min);
  } else if (min <= 99) {
    minStr = String(min);
  } else {
    minStr = "EE";
  }

  if (sec < 10) {
    secStr = "0" + String(sec);
  } else if (sec <= 99) {
    secStr = String(sec);
  } else {
    secStr = "EE";
  }

  return minStr + ":" + secStr;
}

String fillStr(const String str, byte len) {

  int repeat = len - str.length();
  String fill;

  if (repeat == 0) {
    return str;
  } else if (repeat < 0) {
    return str.substring(0, abs(repeat));
  } else if (repeat > 0) {
    while (repeat >= 0) {
      str = str + " ";
      repeat --;
    }
    return str;
  }
}

String getFloat(float a) {
  int i = round(a * 10);
  if (i > 990) {
    return "HIGH";
  } else {
    return String(i).substring(0, 2) + "." + String(i).substring(2, 3);
  }
}

void lcdUpdate() {
  lcdStr[0] = fillStr(lcdStr[0], 19);
  lcdStr[1] = fillStr(lcdStr[1], 19);
  lcdStr[2] = fillStr(lcdStr[2], 19);
  lcdStr[3] = fillStr(lcdStr[3], 19);

  lcdStr[0].toCharArray(lcdBuff0, 21);
  lcdStr[1].toCharArray(lcdBuff1, 21);
  lcdStr[2].toCharArray(lcdBuff2, 21);
  lcdStr[3].toCharArray(lcdBuff3, 21);

 // lcd.clear();
  for (int r=0; r<4;r++){
    lcd.setCursor(user_navi.col, r);
    lcd.print(lcdStr[r]);
  }
//  for (int i = 0; i < 20; i++) { //update lcd line 1
//
//    if (lcdBuff0[i] != lcdBuffPrevious0[i]) {
//      lcd.setCursor(i, 0);
//      lcd.print(lcdBuff0[i]);
//    }
//    lcdBuffPrevious0[i] = lcdBuff0[i];
//  }
//
//  for (int i = 0; i < 20; i++) { //update lcd line 2
//
//    if (lcdBuff1[i] != lcdBuffPrevious1[i]) {
//      lcd.setCursor(i, 1);
//      lcd.print(lcdBuff1[i]);
//    }
//    lcdBuffPrevious1[i] = lcdBuff1[i];
//  }
//
//  for (int i = 0; i < 20; i++) { //update lcd line 3
//
//    if (lcdBuff2[i] != lcdBuffPrevious2[i]) {
//      lcd.setCursor(i, 2);
//      lcd.print(lcdBuff2[i]);
//    }
//    lcdBuffPrevious2[i] = lcdBuff2[i];
//  }
//
//  for (int i = 0; i < 20; i++) { //update lcd line 4
//
//    if (lcdBuff3[i] != lcdBuffPrevious3[i]) {
//      lcd.setCursor(i, 3);
//      lcd.print(lcdBuff3[i]);
//    }
//    lcdBuffPrevious3[i] = lcdBuff3[i];
//  }
}
