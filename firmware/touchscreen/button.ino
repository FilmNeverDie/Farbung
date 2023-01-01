
void buttonAction_new(byte n, int debounce_change) {
// the state should entirely depended on the updated value from each navigation class: userUI and menu_navi
// updating this variables inside the classes in any state will likely to caue problem where this overwritten the inputs

  
  //for menu structure see attached document
  //<menuColumn>/<menuRow>
  //old layout: 0 1 2 3 4 5
  //            right, down, left, cancel, up, confirm
  //new layout: 0b 1 1 1 1 1 1 x x
  //               U L R D A B x x
  //               

  menuRow = menu_navi.row; //current row
  // rowstack has historical row value
  //  Serial.print("button: ");
  //  Serial.println(n, BIN);
  menuColumn = menu_navi.layer;
if (debounce_change){
  switch (menuColumn) {
    case 0: //***************************************menuColumn 0
      ispageEnd = 0;
      pagerow = 6;
      if (menuRow == 0) { //0/0 top menu:"Info Screen"
        if ((n & A_button)>>3 == 0) {
          // shift layer to 1 after pressing A
          //            break;
        }
      } else if (menuRow <= 1) { //0/1-0/6 top menu:"Start Processing"
        if ((n & A_button)>>3 == 0) {
          //loadProc();
          Serial.println("load processes");
          // shift layer to 1 after pressing A
        }
      } else if (menuRow <= 2) { //0/7-0/9 top menu:"Stop/Clean Process"
        if ((n & A_button)>>3 == 0) {
          // shift layer to 1 after pressing A
        }
      } else if (menuRow == 3) { //0/10 top menu:"Last Program"
        if ((n & A_button)>>3 == 0) {
          // shift layer to 1 after pressing A
        }
      } else if (menuRow <= 4) { //0/11-0/16 top menu:"Edit Program"
        if ((n & A_button)>>3 == 0) {
          // shift layer to 1 after pressing A
        }
      } else if (menuRow <= 5) { //0/17-0/26 top menu:"Settings"
        if ((n & A_button)>>3 == 0) {
          // shift layer to 1 after pressing A
        }
      } else { //default
      }

      break;

    case 1: //***************************************menuColumn 1

          if (rowstack[0][1] == 0) { //1/0 Info Screen
          
              ispageEnd = 1;
              pagerow = 1;
              if (((n & A_button) >> A_shift) == 0){//press A/confirm
                 //does nothing, user have to use B to back
                 buzz.play_Note(500, 100);
                 
                 //toggle manual flow out, it is force flow out, when it is in processing mode
                if (processState == 1) {
                  if (flowout){
                    removeChem.OFF(6);
                    DEBUG_PRINTln("stop flow out");
                    flowout=0;
                    stepout = 0;
                  }else{
                    removeChem.ON(6);
                    //Serial.println("flow in");
                    flowout=1;
                   // stepout = stepOut[stepNo];
                  }
                    
                }
              }
              else if (((n & B_button) >> B_shift) == 0){//press B/cancel
                   // shift layer to 1 after pressing B
              }
              else if (((n & Down_button) >> Down_shift) == 0) {//press down
                //jump a step if the machine is processing
                if (processState == 1) {
                  if (stepState == 0) {
                    //jump to remove sequence
                    Serial.println("Jump a Step to Remove /****");
                    addChem.OFF(stepIn[stepNo]);
                    stepState = 1;
                    stepTimer1 = 0;
                    stepTimer2 = 0;
                    stepTimer3 = timer / 1000;
                  } else if (stepState == 1) {
                    //jump to finish
                    removeChem.OFF(stepOut[stepNo]);
                    stepNo ++;
                    flowin = 0;
                    flowout = 0;
                    Serial.println("Jump a Step to Finish /****");
                    stepState = 0;
                    stepTimer1 = 0;
                    stepTimer2 = 0;
                    stepTimer3 = 0;
                    buzz.play_Note(500, 100);
                    //delay(100);
                  }
                }
              }
              else if (((n & Up_button) >> Up_shift) == 0){//press up
                // usefule signle from processing
                // stepState: 0 = adding and processing; 1= removing  
                // stepTimer1: timer for adding (reset to 0 end the end of the step)
                // stepTimer2: timer for processing (reset to 0 end the end of the step)
                // stepTimer3: timer for removing (reset to 0 end the end of the step)
                
                //toggle flow input, when in infopage ==0 and processState ==1
                if (processState == 1 && infopage ==0) {
                  if (flowin){
                    addChem.OFF(stepIn[stepNo]);
                    DEBUG_PRINTln("stop flow in");
                    flowin=0;
                  }else{
                    addChem.ON(stepIn[stepNo]);
                    //Serial.println("flow in");
                    flowin=1;
                  }
                    
                }else if (infopage ==1){
                  steppingmode = 1-steppingmode;
                }
                
              }
              else if (((n & Left_button) >> Left_shift) == 0) {//press left
                // don't use since it bug the timer and the step doesn't goes into the other
               // timeJump -= 15000;
               infopage = 1- infopage;
              }
              else if (((n & Right_button) >> Right_shift) == 0) { //press right
                // don't use since it bug the timer and the step doesn't goes into the other
               // timeJump += 15000;
              }
              
          }else if (rowstack[0][1] == 1) { //1 select load process from ROm or SD
              ispageEnd = 0;
              pagerow = 3;
              if (((n & A_button) >> A_shift) == 0){//press A/confirm
                // shift layer to 2 after pressing A, done by menu_nav class
                // menuColumn = 2;

                loadtype = menuRow; //the process number is determine here when selecting the process
                if (loadtype==1){
                  //int loadSDerr = 
                  loadProc_SD(&SD_err);
                  
                  if (SD_err>0){
                    errorCode(900+SD_err); //return error to LCD
                  }else{
                    loadProcPara(program_no); // if no error load info into the processArrays
                  }
                  
                }else if (loadtype==0){
                  //loadProc();
                  loadProc1();
                }else if (loadtype==2){
                  // this doesn't need much since it is the same as loadproc1 but with another array
                  // this could potential combined into one routine with variable of type for different loading method
                  loadProc2();
                }
                
              }
              else if (((n & B_button) >> B_shift) == 0){//press B/cancel
                // shift layer to 0 after pressing B
              }
              else if (((n & Down_button) >> Down_shift) == 0) {//press down
                if (menuRow == 2) {
                  buzz.play_Note(500, 500);
                }  
              }
              else if (((n & Up_button) >> Up_shift) == 0){//press up
                if (menuRow == 0) {
                  buzz.play_Note(500, 500);
                } 
              }

/* this section is to reocate to deeper layer
 * else if (rowstack[0][1] == 1) { //1 select load process from ROm or SD
              ispageEnd = 0;
              pagerow = 6;
              if (((n & A_button) >> A_shift) == 0){//press A/confirm
                // shift layer to 2 after pressing A
                // menuColumn = 2;
                processNo = menuRow; //the process number is determine here when selecting the process
              }
              else if (((n & B_button) >> B_shift) == 0){//press B/cancel
                // shift layer to 0 after pressing B
              }
              else if (((n & Down_button) >> Down_shift) == 0) {//press down
                if (menuRow == 5) {
                  buzz.play_Note(500, 500);
                }  
              }
              else if (((n & Up_button) >> Up_shift) == 0){//press up
                if (menuRow == 0) {
                  buzz.play_Note(500, 500);
                } 
              }
              
          }
 */
          } else if (rowstack[0][1] == 2) { //1/7-1/9 select stop/clean process 1-2 to run
              ispageEnd = 0;
              pagerow = 3;
              if (((n & A_button) >> A_shift) == 0){//press A/confirm
                // shift layer to 2 after pressing A
                // menuColumn = 2;
              }
              else if (((n & B_button) >> B_shift) == 0){//press B/cancel
                // shift layer to 0 after pressing B
                // menuColumn = 0;
              }
              else if (((n & Down_button) >> Down_shift) == 0) {//press down
                if (menuRow == 2) {
                  buzz.play_Note(500, 500);
                } 
              }
              else if (((n & Up_button) >> Up_shift) == 0){//press up
                if (menuRow == 0) {
                  buzz.play_Note(500, 500);
                } 
              }
              
          } else if (rowstack[0][1] == 3) { //1/10 break point data
              ispageEnd = 0;
              pagerow = 4;
              if (((n & A_button) >> A_shift) == 0){//press A/confirm
                //menuColumn = 2;
              }
              else if (((n & B_button) >> B_shift) == 0){//press B/cancel
               // menuColumn = 0;
              }
              
          } else if (rowstack[0][1] == 4) { //1/11-1/16 select process 1-6 to edit
              ispageEnd = 0;
              pagerow = 6;
              if (((n & A_button) >> A_shift) == 0){//press A/confirm
                // menuColumn = 2;
              }
              else if (((n & B_button) >> B_shift) == 0){//press B/cancel
                // menuColumn = 0;
              }
              else if (((n & Down_button) >> Down_shift) == 0) {//press down
                if (menuRow == 5) {
                  buzz.play_Note(500, 500);
                } 
              }
              else if (((n & Up_button) >> Up_shift) == 0){//press up
                if (menuRow == 0) {
                  buzz.play_Note(500, 500);
                } 
              }
              
          } else if (rowstack[0][1] == 5) { //1/17-1/19 setting menu
              ispageEnd = 0;
              pagerow = 3;
              if (((n & A_button) >> A_shift) == 0){//press A/confirm
                if (menuRow <= 1) {
                  // enter IO check mode when row - and 1 is selected
                  IOCheckMode = 1;
                }
                // menuColumn = 2;
              }
              else if (((n & B_button) >> B_shift) == 0){//press B/cancel
                // menuColumn = 0;
              }
              else if (((n & Down_button) >> Down_shift) == 0) {//press down
                if (menuRow == 2) {
                  buzz.play_Note(500, 500);
                } 
              }
              else if (((n & Up_button) >> Up_shift) == 0){//press up
                if (menuRow == 0) {
                  buzz.play_Note(500, 500);
                } 
              }
              
          } else { //default

          }

          break;

        case 2: //***************************************menuColumn 2

          if (rowstack[1][1] == 0 && rowstack[0][1] == 0) { //2/0 NULL, check the previous row value of the layer before confirm button
            ispageEnd = 1;
            pagerow = 1;
            if (((n & B_button) >> B_shift) == 0 ){//press B/cancel/
                menuColumn = 0;
            }else if (((n & A_button) >> A_shift) == 0){// press A/confirm
                 //does nothing, user have to use B to back
                 buzz.play_Note(500, 100); 
            }
          } else if (rowstack[0][1] == 1 && rowstack[1][1] == 0 ) { //2/1 selected 0 to load from script
              ispageEnd = 0;
              pagerow = 6;
              if (((n & A_button) >> A_shift) == 0){//press A/confirm
                // shift layer to 2 after pressing A
                // menuColumn = 2;
                processNo = menuRow; //the process number is determine here when selecting the process
              }
              else if (((n & B_button) >> B_shift) == 0){//press B/cancel
                // shift layer to 0 after pressing B
              }
              else if (((n & Down_button) >> Down_shift) == 0) {//press down
                if (menuRow == 5) {
                  buzz.play_Note(500, 500);
                }  
              }
              else if (((n & Up_button) >> Up_shift) == 0){//press up
                if (menuRow == 0) {
                  buzz.play_Note(500, 500);
                } 
              }
              
          } else if (rowstack[0][1] == 1 && rowstack[1][1] == 1 ) { //2/1 selected 1 to load from SD
              ispageEnd = SD_err>0?1:0;
              //Serial.println(program_no);
              pagerow = max(4,program_no); //number of row reflect how many program stored in the file or at least 4 rows to display
              if (((n & A_button) >> A_shift) == 0){//press A/confirm
                // shift layer to 2 after pressing A
                // menuColumn = 2;
                if (SD_err==0){
                  processNo = menuRow; //the process number is determine here when selecting the process
                } //else do nothing
              }
              else if (((n & B_button) >> B_shift) == 0){//press B/cancel
                // shift layer to 0 after pressing B
              }
              else if (((n & Down_button) >> Down_shift) == 0) {//press down
                if (menuRow == program_no-1) {
                  buzz.play_Note(500, 500);
                }  
              }
              else if (((n & Up_button) >> Up_shift) == 0){//press up
                if (menuRow == 0) {
                  buzz.play_Note(500, 500);
                } 
              }
              
          } else if (rowstack[0][1] == 1 && rowstack[1][1] == 2 ) { //2/1 selected 2 to load from ROM
              ispageEnd = 0;
              pagerow = max(4,program_no); //number of row reflect how many program stored in the file or at least 4 rows to display
              if (((n & A_button) >> A_shift) == 0){//press A/confirm
                // shift layer to 2 after pressing A
                // menuColumn = 2;
                processNo = menuRow; //the process number is determine here when selecting the process
              }
              else if (((n & B_button) >> B_shift) == 0){//press B/cancel
                // shift layer to 0 after pressing B
              }
              else if (((n & Down_button) >> Down_shift) == 0) {//press down
                if (menuRow == 5) {
                  buzz.play_Note(500, 500);
                }  
              }
              else if (((n & Up_button) >> Up_shift) == 0){//press up
                if (menuRow == 0) {
                  buzz.play_Note(500, 500);
                } 
              }
              
          } else if (rowstack[0][1] == 2 && rowstack[1][1] == 0) { //2/7 stop process execute confirmation
              ispageEnd = 1;
              pagerow = 1;
              if (((n & A_button) >> A_shift) == 0){//press A/confirm
                stopProcessing();
                menuColumn = 1; //go to info screen
                // if this action is done, menu skip button update
                menu_skipupdate =1;
                // wrap to info screen
                menu_navi.wrappoint(0,0,1);
                rowstack[0][1]  = 0;
                rowstack[1][1]  = 0;
                rowstack[2][1]  = 0;
                rowstack[3][1]  = 0;
                rowstack[0][2]  = 0;
                rowstack[1][2]  = 0;
                rowstack[2][2]  = 0;
                rowstack[3][2]  = 0;
                user_navi.wrappoint(0,0,1);
              }
              else if (((n & B_button) >> B_shift) == 0){//press B/cancel
               // menuColumn = 1;
              }
               
          } else if (rowstack[0][1] == 2 && rowstack[1][1] <=2) { //2/8-2/9 clean process 1-2 execute confirmation
              ispageEnd = 1;
              pagerow = 1;
              if (((n & A_button) >> A_shift) == 0){//press A/confirm

                if (processState == 1) {
                  buzz.play_Note(500, 500);
                } else {

                  processStateClean = menuRow - 0;
                  menuColumn = 1; //back to info screen
                  // if this action is done, menu skip button update
                  menu_skipupdate =1;
                  menu_navi.wrappoint(0,0,1);
                  rowstack[0][1]  = 0;
                  rowstack[1][1]  = 0;
                  rowstack[2][1]  = 0;
                  rowstack[3][1]  = 0;
                  rowstack[0][2]  = 0;
                  rowstack[1][2]  = 0;
                  rowstack[2][2]  = 0;
                  rowstack[3][2]  = 0;
                  user_navi.wrappoint(0,0,1);
                  
                  Serial.println("Start Cleaning Process in Button Action //******");
                  Serial.println("processStateClean" + String(processStateClean));
                }
              }
              else if (((n & B_button) >> B_shift) == 0){//press B/cancel
                // menuColumn = 1;
              }
               

          } else if (rowstack[0][1] == 3 && rowstack[1][1] ==0) { //2/10 break point execute confirmation
              ispageEnd = 1;
              pagerow = 1;
              if (((n & A_button) >> A_shift) == 0){//press A/confirm
                //WIP
                //load varible from BP data
                //and start processing
                menuColumn = 1; //back to info screen
                // if this action is done, menu skip button update
                menu_skipupdate =1;
                
                menu_navi.wrappoint(0,0,1);
                rowstack[0][1]  = 0;
                rowstack[1][1]  = 0;
                rowstack[2][1]  = 0;
                rowstack[3][1]  = 0;
                rowstack[0][2]  = 0;
                rowstack[1][2]  = 0;
                rowstack[2][2]  = 0;
                rowstack[3][2]  = 0;
                user_navi.wrappoint(0,0,1);
              }
              else if (((n & B_button) >> B_shift) == 0){//press B/can
                // menuColumn = 1;
              }
              

          } else if (rowstack[0][1] == 4 && rowstack[1][1] <=5) { //2/11-2/16 edit process 1-6

           /* 
            *  this section should allow ppl to select the program they would like to change
            *  the parameter of each processing program, the current data structure has a fxied program header
            *  and the pointer could create a new array of based on the number of step
            *  
            *  the left right button will scrolling thru the different parameter in the program haeder of the selected
            *  program on rowstack[1][1] 
            *  
            *  the up and down button will cycle thru the allowing range of value for each data entry of the program
            *  
            *  A to confirm
            *  
            *  for exmaple 
            *  processName was "---"
            *  
            *  editName_buffer[20];
            *  for the range of ascii value between 32 to 122
            *  90 chrs selectible
            *  line 1: "process Name"
            *  line 2: editName_buffer[0]....[19]
            *  
            *  Editing procedure
            *  load paramter value from exisitng data structure
            *  press A to enable editing, this enable lcd.cursor(),lcd.setcurosr(0,2);;
            *  press left right to select the chr position, lcd.setcurosr(paraindex,2)
            *  press up down to increment or decrease the chr value
            *  press A to confirm changes or B to cancel, this enable lcd.nocursor(),lcd.setcurosr(0,2);
            *  press A to load the buffer into the actual data structure
            *  press B to remove buffer data and do nothing to actual data structure
            *  
            *  similar for nurmical value paramter
            *  for exmplae:
            *  
            *  para_type = 0;
            *  line 1: "parameter Name (unit)"
            *  line 2: para_type
            *  
            *  Editing procedure
            *  load paramter value from exisitng data structure
            *  press A to enable editing, this enable lcd.cursor(),lcd.setcurosr(0,2);;
            *  press left right to add or subtract by 10 (if the value is big sch as duration)
            *  press up down to increment or decrease the chr value
            *  press A to confirm changes or B to cancel, this enable lcd.nocursor(),lcd.setcurosr(0,2);
            *  press A to load the buffer into the actual data structure
            *  press B to remove buffer data and do nothing to actual data structure
            *  
            *  require a list of parameterName
            */
          
              ispageEnd = 1; //this page is to edit the program header, and the next page is to add each steps
              
              pagerow = 4; //every parameter should only need 4 lines
              // line 0 : editing processName
              // line 1 : paramtersName
              // line 2 : parametersArray
              // line 3 : BLANK
              // maxcol depend on how many step there is, default value is 3, since no step
              maxcol = 3+ROMProgram[rowstack[1][1]].numberofstep*5;
              int stepnum = max(floor((editIndex-4)/5),0);
              int menuIndex = editIndex  - stepnum*5;
              // load parameter from exisitng data strucutre if any, this always happen as user need to preview the existing value if existed
              if (editing==0){
                EditsParameters(editIndex,0,&editPara[0],0); // pull parameter from existing data for editing only when not editing, in order to preview values
              }
                //Serial.print("pulled");
                //Serial.println(editPara[0]);
              if (((n & A_button) >> A_shift) == 0){//press A/confirm
               //press A to toggle between editting and not
               if(editing==0){ //it was not editing now
//                lcd.setCursor(0,3); //set cursor just underneath first chr of the parameter
//                lcd.cursor(); //display cursor
//                lcd.blink(); //blink cursor
                tft.setCursor(0,ROW_THREE); //set cursor just underneath first chr of the parameter
                // draw white border around row three, indicating editing
                tft.drawRect(0, ROW_THREE-textsize, 240, 56+textsize*2, WHITE);
                tft.drawRect(0, ROW_THREE, 240, 56, BLACK);
                editing = 1;
               // EditsParameters(editIndex,0,editPara,0); // pull parameter from existing data for editing only when not editing
               }else if (editing==1){ // it was editing 
//                lcd.setCursor(0,3); 
//                lcd.noCursor();
//                lcd.noBlink();
                tft.setCursor(0,ROW_THREE); //set cursor just underneath first chr of the parameter
                //remove white border when not editing
                tft.drawRect(0, ROW_THREE-textsize, 240, 56+textsize*2, BLACK); 
                editing = 0; // stop editing
                // save buffer value to actual data structure
                EditsParameters(editIndex,arrayIndex,editPara,1); // push edit is a function to change the ROM program parameters
                //editPara = 0; //reset parameter value
                saving =1;
                popuptimer = millis();
                
                arrayIndex = 0; //reset array index after confirming a change
               }
               

               
              }
              else if (((n & B_button) >> B_shift) == 0){//press B/can
               // menuColumn = 1;
               editmenuEnd =0; //hide popup msg
               saving=0; //hide popup msg
               if (editing==1){ //if it was editing, quit being editing
//                lcd.setCursor(2,0); 
//                lcd.noCursor();
//                lcd.noBlink();
                tft.setCursor(2*textsize*6,0); 
                //remove white border when not editing
                tft.drawRect(0, ROW_THREE-textsize, 240, 56+textsize*2, BLACK); 
                editing = 0; // stop editing
                //editPara = 0;
                //editIndex = 0;
                // return to non editing without saving, and next lopp will pull form rom again. 
                menu_skipupdate=1; // doesn't need to update menu location, since it is same page
                arrayIndex =0; //reset array index after cancelling a change
               }else if(editing==0){ //if it was not editing, go back to last page
                // this should bring the menu back to program selection, 
                // and save all changes to EEPROM
//                Serial.println(rowstack[1][1]);
                savetoROM(rowstack[1][1]); // write the current program selection to the ROM
                editIndex = 0; //index to begining once reenter
               }
              }
              else if (((n & Down_button) >> Down_shift) == 0) {//press down
                if(editing){
                  
                  editPara[arrayIndex]--;
                  if (editPara[arrayIndex]<0) editPara[arrayIndex]=0;
                  EditsParameters(editIndex,arrayIndex,editPara,1);  
                }
                else{
                  buzz.play_Note(500, 500); // you can't move up or down when not editing
                }
              }
              else if (((n & Up_button) >> Up_shift) == 0){//press up
                if(editing){
                  editPara[arrayIndex]++;
                  if(editPara[arrayIndex]>=maxRanges[menuIndex]){ // if incrementing bigger than max range, the value is mamx range -1
                    editPara[arrayIndex]=maxRanges[menuIndex];
                  }
                  EditsParameters(editIndex,arrayIndex,editPara,1); 
                }
                else{
                  buzz.play_Note(500, 500); // you can't move up or down when not editing
                }
              }
              else if (((n & Right_button) >> Right_shift) == 0) { //press right
                if(editing && editIndex==0){
                  EditsParameters(editIndex,arrayIndex,editPara,1);    
                  arrayIndex++;  // if editing the array index is shifted,in para other than name, it can fast increase/decrease value  
                  
                }else if (editing && editIndex>0){
                  editPara[arrayIndex]+= 10; // skip 10 when it is editing non Name data
                  if(editPara[arrayIndex]>=maxRanges[menuIndex]){ // if incrementing bigger than max range, the value is mamx range -1
                    editPara[arrayIndex]=maxRanges[menuIndex];
                  }
                  EditsParameters(editIndex,arrayIndex,editPara,1); 
                }
                else if (editing==0){
                  editIndex++;  // if not editing, the para index is shifted
                  if(editIndex>maxcol){
                    editIndex = maxcol;
                    buzz.play_Note(500, 500);
                    editmenuEnd =1;
                    popuptimer = millis();
                  }
                 //editPara[arrayIndex] = 0; // reset edit para for the next parameter, when it is not editing, we pull from ROM, so no need to reset
                }else{
                  buzz.play_Note(500, 500); // beep when there is no increment in array (when editing name), or para (when not editing)
                }
              }
              else if (((n & Left_button) >> Left_shift) == 0) {//press left
                if(editing && editIndex==0){
                  EditsParameters(editIndex,arrayIndex,editPara,1);   
                  arrayIndex--; // if editing the array index is shifted,in para other than name, it can fast increase/decrease value
                     
                }
                else if (editing && editIndex>0){ // skip 10 when it is editing non Name data
                  editPara[arrayIndex]-= 10;
                  if (editPara[arrayIndex]<0) editPara[arrayIndex]=0;
                  EditsParameters(editIndex,arrayIndex,editPara,1); 
                }
                else if (editing==0){
                  editIndex--; // if not editing, the para index is shifted
                  if(editIndex<0){
                    editIndex=0;
                    buzz.play_Note(500, 500);
                  }
                  //editPara[arrayIndex] = 0; // reset edit para for the next parameter, when it is not editing, we pull from ROM, so no need to reset
                }else{
                  buzz.play_Note(500, 500);// beep when there is no increment in array (when editing name), or para (when not editing)
                }
              }
//              Serial.print("paraedit:");
//              Serial.print(maxcol);
//              
//              Serial.print(",");
//              Serial.print(rowstack[1][1]);
//              Serial.print(",");
//              Serial.print(editIndex);
//              Serial.print(",");
//              Serial.print(arrayIndex);
//              Serial.print(",");
//              Serial.print(editPara[arrayIndex]);
//              Serial.print(",");
//              
//              
//              Serial.print(editing);
//              Serial.println(",");
              

          } else if (rowstack[0][1] == 5 && rowstack[1][1] ==0) { //2/17 select input check
            ispageEnd = 1;
            pagerow = 1;
            if (IOCheckMode != 1) {
              // amkse sure it is in IOcheckmode, if not
              IOCheckMode = 1;
            }
            if (((n & B_button) >> B_shift) == 0){//press B/can
              // menuColumn = 1;
              // reset IO check mode parameter upon quitting the interface
              IOCheckMode = 0;
              IOIndex = 0;
            }
            else if (((n & Right_button) >> Right_shift) == 0) { //press right
              if (IOIndex == 20) {
                IOIndex = 20;
                buzz.play_Note(500, 500);
              } else {
                IOIndex ++;
              }
            }
            else if (((n & Left_button) >> Left_shift) == 0) {//press left
              if (IOIndex == 0) {
                IOIndex = 0;
                buzz.play_Note(500, 500);
              } else {
                IOIndex --;
              }
            }

          } else if (rowstack[0][1] == 5 && rowstack[1][1] ==1) { //2/18 select output check
            ispageEnd = 1;
            pagerow = 1;
            if (IOCheckMode != 1) {
              IOCheckMode = 1;
            }
            if (((n & B_button) >> B_shift) == 0){//press B/can
             // menuColumn = 1;
              IOCheckMode = 0;
              IOIndex = 0;
              outputCheckAction = 0;

            }
            else if (((n & Down_button) >> Down_shift) == 0) {//press down
              if (outputCheckAction == 1) {
                outputCheckAction = 0;
              }

            }
            else if (((n & Up_button) >> Up_shift) == 0){//press up
              if (outputCheckAction == 0) {
                outputCheckAction = 1;
              }

            }
            else if (((n & Right_button) >> Right_shift) == 0) { //press right
              outputCheckAction = 0;
              if (IOIndex == 20) {
                IOIndex = 20;
                buzz.play_Note(500, 500);
              } else {
                IOIndex ++;
              }
            }
            
            else if (((n & Left_button) >> Left_shift) == 0) {//press left
              outputCheckAction = 0;
              if (IOIndex == 0) {
                IOIndex = 0;
                buzz.play_Note(500, 500);
              } else {
                IOIndex --;
              }
            }
            

          } else if (rowstack[0][1] == 5 && rowstack[1][1] ==2) { //2/19 agitation speed setting
            ispageEnd = 1;
            pagerow = 1;

            if (((n & B_button) >> B_shift) == 0){//press B/can
              // menuColumn = 1;
            }

          } else { //default
          }



          break;

        case 3: //***************************************menuColumn 3


          if (rowstack[0][1] == 4 && rowstack[1][1] <=5 && rowstack[2][1] ==0) { //3/0 NULL

          } else if (rowstack[0][1] == 1 && rowstack[1][1] <= 2 ) { //3/1-2/6 processing 1-6 execute confirmation
            //          else if (rowstack[0][1] == 1 && rowstack[1][1] <= 5) { //
              ispageEnd = 1;
              pagerow = 1;
              if (((n & A_button) >> A_shift) == 0){//press A/confirm
                // enter processing mode, and start processing
                processState = 1;

                menuColumn = 1; //go to info screen
                // if this action is done, menu skip button update
                menu_skipupdate =1;
                // wrap to info screen
                menu_navi.wrappoint(0,0,1);
                rowstack[0][1]  = 0;
                rowstack[1][1]  = 0;
                rowstack[2][1]  = 0;
                rowstack[0][2]  = 0;
                rowstack[1][2]  = 0;
                rowstack[2][2]  = 0;
                user_navi.wrappoint(0,0,1);
                
                Serial.println("Start Processing in Button Action //******");
                Serial.println("ProcessState: " + String(processState));
                Serial.println("ProcessNo: " + String(processNo));
                Serial.println("stepNo: " + String(stepNo));
                Serial.println("ProcessName: " + processName[processNo]);

              }
              else if (((n & B_button) >> B_shift) == 0){//press B/cancel
                // menuColumn = 1;
              }
              else if (((n & Down_button) >> Down_shift) == 0) {//press down
                if (push <= -3) {
                  push = -3;
                  buzz.play_Note(500, 500);
                } else {
                  push--;
                }
              }
              else if (((n & Up_button) >> Up_shift) == 0){//press up
                if (push >= 5) {
                  push = 5;
                  buzz.play_Note(500, 500);
                } else {
                  push++;
                }
              }
              else if (((n & Right_button) >> Right_shift) == 0) { //press right
                if (dummyroll <= 0) {
                  dummyroll = 0;
                  buzz.play_Note(500, 500);
                } else {
                  dummyroll--;
                }
              }
              
              else if (((n & Left_button) >> Left_shift) == 0) {//press left
                if (dummyroll >= 8) {
                  dummyroll = 8;
                  buzz.play_Note(500, 500);
                } else {
                  dummyroll++;
                }
              }
              
          }
            else if (rowstack[2][1] ==2) { //3/7 stop process execute confirmation

          } else if (rowstack[2][1] <=4) { //3/8-3/9 clean process 1-2 execute confirmation

          } else if (rowstack[2][1] ==5) { //3/10 break point execute confirmation

          } else if (rowstack[2][1] <=11) { //3/11-3/16 edit process 1-6 write confirmation

          } else if (rowstack[2][1] <= 16) { //3/17-3/21 input check 1-5

          } else if (rowstack[2][1] <= 21) { //3/22-3/26 output check 1-5

          } else { //default

          }

          break;
        }
}
//        Serial.print("Menu Column/Row: ");
//        Serial.print(menuColumn);
//        Serial.print(" / ");
//        Serial.print(menu_navi.row);
//        Serial.print(" / ");
//        Serial.println(menuRow);


}
