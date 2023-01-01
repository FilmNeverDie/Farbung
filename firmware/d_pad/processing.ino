

void processing() {

// if step parameter is not set for the current process, we load it from the datatype
  if (stepParaSet == 0) {
    //loadStepPara(); // from ROM, old data string
    loadStepPara1(loadtype); // from ROM or SD, new data struct
    stepParaSet = 1;
  }

// there are two mode of conditioning, sensor+timer base (original), timer only (added on 20220604)
// these are all dynamics memories based on global variables, which we hav eplenty of resoruce, as of 20220604

//condiitoning
bool Endremove;
bool Endadd;
// base these timing on experiment confucted on 20220618
int addtiming = 72-dummyroll*6 + 10;
int removetiming = 40; 
  if (steppingmode==0){//sensor + timer mode
    // end removing when timer is >5s and both the drum sensor, and flowout sensor are not detecting fluid
    Endremove = drumHI.isON() == 0 && drumempty.isON() == 0 && (timer / 1000 - stepTimer3) > 5;
    // end adding when timer is >5s and drum sensor detect fluid
    Endadd = drumHI.isON() == 1 && (timer / 1000 - stepTimer1) > 5;
  }else {
    // ENd remove when timer is >105s, remember ther is  15sec hold on after entering this stage
    Endremove =  (timer / 1000 - stepTimer3) > removetiming;
    // end add when timer is >90, 
    Endadd = (timer / 1000 - stepTimer1) > addtiming;
  }
 

  if (stepState == 1) {
    DEBUG_PRINTln("Processing Phase is DONE");
    if (Endremove) {
      DEBUG_PRINT("Tank is Empty & 5S Has Passed Since The Start of Removing");
      if (removeChem.State(stepOut[stepNo]) == 1 || removeChem.State(6) == 1) {
        // if the drum remove is more than 5s and both hi and flow sensor sense nothing, we turn off remove
        DEBUG_PRINTln("Turn Off remove");
        delay(15000);// delay 15 second before turning off removechem
        removeChem.OFF(flowout? 6:stepOut[stepNo]);
        return;
      } else {
        //  this should be after we turn the remove off from previous case
        DEBUG_PRINTln("Remove is Off");
        if (stepNo >= processTotalSteps[processNo] - 1) {
          DEBUG_PRINTln("this is the Last Step");
          //process done
          stopProcessing();
          //notification
          DEBUG_PRINTln("Process Done //******");
          trackID = 3; // beep 3 times at even interval
//          buzz.play_Note(500,500);
//          delay(500);
//          buzz.play_Note(500,500);
//          delay(500);
//          buzz.play_Note(500,500);

          return;
        } else {
          // not last step
          DEBUG_PRINTln("This is Not the Last Step");
          //step is done
          DEBUG_PRINTln("Step " + String(stepNo) + " Done //******");
          // move to next step by incrementing stepNo
          stepNo ++;
          DEBUG_PRINTln("Step " + String(stepNo) + " Staring");
          flowin = 0 ; //reset manual flow in toggle when go to next step
          flowout = 0; //reset maunal flow out toggle when go to next step
          stepState = 0;
          //all step timer are reset when processing is DONE
          // reset all timer at the end of each step
          stepTimer1 = 0;
          stepTimer2 = 0;
          stepTimer3 = 0;
          //delay(500);
          buzz.play_Note(500,100);
          //delay(500);
          return;
        }
      }
    } else {
      // when the remove is still active because flow or drum high still ON, or less than 5s
      DEBUG_PRINTln("Tank is Not Empty");
      if (removeChem.State(stepOut[stepNo]) == 1 || removeChem.State(6) == 1) {
        // if the active tank is the step tanks, the tank is current being remove to
        DEBUG_PRINTln("Remove is On");
        if (removeChem.tooLong() == 1) { // disable:, it NEVER TOO LONG. LOLs
          // if the remove process is too long
          DEBUG_PRINTln("Remove is too long");
          errorCode(104);
          return;
        } else {
          // before the remove process is too long we report the msg below
          DEBUG_PRINTln("Keep Removing to: " + String(stepOut[stepNo]));
          DEBUG_PRINTln("stepDoneTime Set: " + String(stepTimer3));
          DEBUG_PRINTln("timer: " + String(timer));
          DEBUG_PRINTln("Has Been Removing for: " + String(timer / 1000 - stepTimer3));
          return;
        }
      } else {
        // if the remove is not active for the step tank, we turn on
        DEBUG_PRINTln("Turn On Remove");
        // if flow out is active, then port forced to port 6 out
        removeChem.ON(flowout? 6 : stepOut[stepNo]);
        
        delay(100);
        return;
      }
    }
  } else {
    if (stepTimer1 == 0) {
      // step timer 1 will be inititated if it is 0, whennver step timer 1 got reset
      // thsee instances are: stopprocessing(), and when current step finish
      stepTimer1 = timer / 1000;
      return;
    } else {
      DEBUG_PRINTln("Processing Phase is Not Done");
      if (Endadd) {
        // this is when the tank is full
        
        // if drumHI sensor isON, and timer > 5s more than when steptimer1 begins
        DEBUG_PRINTln("Tank is Full and 5S has passed since begining of add chem");
        if (addChem.State(stepIn[stepNo]) == 1) {
          //if the current active tank is the step tank
          DEBUG_PRINTln("Addchem is ON");
          // we turn it off, except when manual flow in is active
          if(flowin==0){
          addChem.OFF(stepIn[stepNo]);
          }
          DEBUG_PRINTln(addChem.State(stepIn[stepNo])); // this sould be zero now
          return;
        } else {
          // this happened when 
          DEBUG_PRINTln("Addchem is OFF");
          // if the current active is not the step tank
          if (stepTimer2 == 0) {
            //start steptimer2 
           // delay(5000); //wait 5 second before turning timer 2 on
            
            DEBUG_PRINTln("stepStartTime NOT Set");
            stepTimer2 = timer / 1000;
            return;
          } else {
            // if time eclipsed is more than the steptime of current step
            if (timer / 1000 >= stepTimer2 + stepTime[stepNo]) {
              // this process has reached its time
              DEBUG_PRINTln("Processing Timer Reach");
              //processing timer is done
              stepState = 1;
              //reset timer 1 - when the current step begin
              // rest timer 2 - when the current tank is not the step tank (doesn't make sense)
              stepTimer1 = 0;
              stepTimer2 = 0;
              // set timer 3 - the begining of removing
              stepTimer3 = timer / 1000;
              return;
            } else {
              // if the step time is not pasted
              DEBUG_PRINTln("Keep Processing. Step: " + String(stepNo));
              DEBUG_PRINTln("stepStartTime Set: " + String(stepTimer2));
              DEBUG_PRINTln("timer: " + String(timer));
              DEBUG_PRINTln("Has Been Processing for: " + String(timer / 1000 - stepTimer2));
              return;
            }
          }
        }
      } else {
        // when adding chem is not yet fill the drum or not yet more than 5s
        DEBUG_PRINTln("Adding to Tank");
        if (addChem.State(stepIn[stepNo]) == 1) { 
          // if the add chem port is the same as the current active port,
          // the state function is return ing the port number of the active port
          DEBUG_PRINTln("Addchem is ON");
          if (timer / 1000 - stepTimer1 >= 60) {
            // if adding more than 60s, it is too long
            //errorCode(105);
            DEBUG_PRINTln("Add is too long");
            return;
          } else {
            DEBUG_PRINTln("Keep Adding from: " + String(stepIn[stepNo]));
            return;
          }
        } else {
          // if the current active tank is not the step tank, we turn on the step tank as active
          DEBUG_PRINTln("Addchem is OFF");
          addChem.ON(stepIn[stepNo]);
          return;
        }
      }
    }
  }
}
/*
 * loadsteppara routine using struct datatype update at 20220102
 */
void loadStepPara1(int loadtype){

  //input
  // loadtype indicate wehter it is load from ROM(0), or SD (1)
  
 //set step parameter
  Serial.println("Process Start //****");
  Serial.println("Process: " + processName[processNo]);
  Serial.println("Step Para Set //****");

  
  for (int i = 0; i < processTotalSteps[processNo] ; i++) {
    if (loadtype==1){
      stepName[i] = stepNames[userProgram[processNo].processes[i].stepcode]; // splitString(processPara[processNo][i + 1], '/', 0);
      stepIn[i] = userProgram[processNo].processes[i].inputtank; //    splitString(processPara[processNo][i + 1], '/', 1).toInt();
      stepTime[i] = userProgram[processNo].processes[i].duration; //    splitString(processPara[processNo][i + 1], '/', 2).toInt();
      stepOut[i] = userProgram[processNo].processes[i].outputtank; //    splitString(processPara[processNo][i + 1], '/', 3).toInt();
      stepPush[i] = userProgram[processNo].processes[i].push; //    splitString(processPara[processNo][i + 1], '/', 4).toInt();
    }else if (loadtype==2){
      stepName[i] = stepNames[ROMProgram[processNo].processes[i].stepcode]; // splitString(processPara[processNo][i + 1], '/', 0);
      stepIn[i] = ROMProgram[processNo].processes[i].inputtank; //    splitString(processPara[processNo][i + 1], '/', 1).toInt();
      stepTime[i] = ROMProgram[processNo].processes[i].duration; //    splitString(processPara[processNo][i + 1], '/', 2).toInt();
      stepOut[i] = ROMProgram[processNo].processes[i].outputtank; //    splitString(processPara[processNo][i + 1], '/', 3).toInt();
      stepPush[i] = ROMProgram[processNo].processes[i].push; //    splitString(processPara[processNo][i + 1], '/', 4).toInt()
    }
    else{
      stepName[i] = stepNames[ProgramList[processNo].processes[i].stepcode]; // splitString(processPara[processNo][i + 1], '/', 0);
      stepIn[i] = ProgramList[processNo].processes[i].inputtank; //    splitString(processPara[processNo][i + 1], '/', 1).toInt();
      stepTime[i] = ProgramList[processNo].processes[i].duration; //    splitString(processPara[processNo][i + 1], '/', 2).toInt();
      stepOut[i] = ProgramList[processNo].processes[i].outputtank; //    splitString(processPara[processNo][i + 1], '/', 3).toInt();
      stepPush[i] = ProgramList[processNo].processes[i].push; //    splitString(processPara[processNo][i + 1], '/', 4).toInt();
    }
    
    if (stepPush[i] == 1) {
      stepTime[i] = floor( stepTime[i] * (1 + (push * 0.3))); //get the final processing time if is subject to push
      // 20210 11 21, modify algorithm to have 0.2 duration increment for each push/pull value
      // 2022 10 24, modify back to 0.3 as par requirment
    }

//    Serial.println("Step " + String(i) + ":");
//    Serial.println("StepName: " + stepName[i]);
//    Serial.println("StepIn: " + String(stepIn[i]));
//    Serial.println("StepTime: " + String(stepTime[i]));
//    Serial.println("StepOut: " + String(stepOut[i]));
//    Serial.println("StepPush: " + String(stepPush[i]));
//    Serial.println("Push: " + String(push));
  }

  // this debug section is added on 2021/11/21
  #ifdef DEBUG
  // this debug commend pause COM to view the value of each step
//      while(Serial.available()==0){
//      }
//      while(Serial.available()>0){
//        char t = Serial.read();
//      }
  #endif

}
/*
 * loadsteppara routine using string datatype update at 20220102
 */
void loadStepPara(){
 //set step parameter
//  Serial.println("Process Start //****");
//  Serial.println("Process: " + processName[processNo]);
//  Serial.println("Step Para Set //****");
  for (int i = 0; i < processTotalSteps[processNo] ; i++) {
    stepName[i] = splitString(processPara[processNo][i + 1], '/', 0);
    stepIn[i] = splitString(processPara[processNo][i + 1], '/', 1).toInt();
    stepTime[i] = splitString(processPara[processNo][i + 1], '/', 2).toInt();
    stepOut[i] = splitString(processPara[processNo][i + 1], '/', 3).toInt();
    stepPush[i] = splitString(processPara[processNo][i + 1], '/', 4).toInt();

    if (stepPush[i] == 1) {
      stepTime[i] = floor( stepTime[i] * (1 + (push * 0.3))); //get the final processing time if is subject to push
      // 20210 11 21, modify algorithm to have 0.2 duration increment for each push/pull value
      // 2022 10 24, modify back to 0.3 as par requirment
    }

//    Serial.println("Step " + String(i) + ":");
//    Serial.println("StepName: " + stepName[i]);
//    Serial.println("StepIn: " + String(stepIn[i]));
//    Serial.println("StepTime: " + String(stepTime[i]));
//    Serial.println("StepOut: " + String(stepOut[i]));
//    Serial.println("StepPush: " + String(stepPush[i]));
//    Serial.println("Push: " + String(push));
  }


  // this debug section is added on 2021/11/21
  #ifdef DEBUG
  // this debug commend pause COM to view the value of each step
//      while(Serial.available()==0){
//      }
//      while(Serial.available()>0){
//        char t = Serial.read();
//      }
  #endif
}

void stopProcessing() {

  Serial.println("stopProcessing() //****");

  //loadtype
  loadtype =0;
  //reset process para
  processState = 0;
  processStateClean = 0;
  processStartTime = 0;

  //reset step para
  stepNo = 0;
  stepState = 0;
  stepTimer1 = 0;
  stepTimer2 = 0;
  stepTimer3 = 0;

  for (int i = 0; i <= 20; i++) {
    stepName[i] = "----";
    stepIn[i] = 0;
    stepTime[i] = 0;
    stepOut[i] = 0;
    stepPush[i] = 0;
  }
  stepParaSet = 0;

  //turn off agitation
  agitationMotor.Stop();

  //turn off pump
  addChem.OFF(1);
  addChem.OFF(2);
  addChem.OFF(3);
  addChem.OFF(4);
  addChem.OFF(5);
  addChem.OFF(6);
  removeChem.OFF(1);
  removeChem.OFF(2);
  removeChem.OFF(3);
  removeChem.OFF(4);
  removeChem.OFF(5);
  removeChem.OFF(6);

  delay(10);

  Led.OFF();
  Led.OFF();

  buzz.play_Note(500,500);

  Serial.println("Stop Processing");

}

void processClean() {


  if (processStateClean == 0) {
    return;
  }

  if (processStateClean == 1) { //clean process 1
    if (processStartTime == 0) {

      processStartTime = timer;
    }

    if (processCleanCycles <= 5) {

      if (timer - processStartTime <= 5000) {

        if (addChem.State(6) == 0) {

          addChem.ON(6);
        }
        if (removeChem.State(6) == 0) {

          removeChem.ON(6);
        }
      } else if (timer - processStartTime <= 6000) {

        if (addChem.State(6) == 1) {

          addChem.OFF(6);
        }
        if (removeChem.State(6) == 1) {

          removeChem.OFF(6);
        }
      } else {

        processStartTime = timer;
        processCleanCycles++;
      }
    } else {

      processStartTime = 0;
      processCleanCycles = 0;
      processStateClean = 0;
      stopProcessing();
    }
  } else if (processStateClean == 2) { //clean process 2

    if (processStartTime == 0) {

      processStartTime = timer;
    }

    if (processCleanCycles <= 5) {

      if (timer - processStartTime <= 10000) {

        if (addChem.State(processCleanCycles + 1) == 0) {

          addChem.ON(processCleanCycles + 1);
        }
        if (removeChem.State(processCleanCycles + 1) == 0) {

          removeChem.ON(processCleanCycles + 1);
        }
      } else if (timer - processStartTime <= 11000) {
        if (addChem.State(processCleanCycles + 1) == 1) {

          addChem.OFF(processCleanCycles + 1);
        }
        if (removeChem.State(processCleanCycles + 1) == 1) {

          removeChem.OFF(processCleanCycles + 1);
        }
      } else {

        processStartTime = timer;
        processCleanCycles++;
      }
    } else {

      processStartTime = 0;
      processCleanCycles = 0;
      processStateClean = 0;
      stopProcessing();
    }
  } else {

    stopProcessing();
  }
}
