void errorCode(int i) {

  if (i == 0) { //clear all errorCode
    return;
  }

  //with errorCode
  //display on screen
  lcd.setCursor(16, 3);
  lcd.print("E" + String(i));

  //display on Serial
  Serial.println("****E" + String(i) + "****");

  //other actions
  switch (i) {
    case 100: //steup string is not loaded
      Led.ON();

      buzz.play_Note(500,500);
      break;
    case 101: //button pin value ordinary (analogRead<400) in button pin value calb.
      Led.ON();

      buzz.play_Note(500,500);
      break;

    case 102: //process para for the current processNo not set

      break;

    case 103: //soak temp. not ready

      break;

    case 104: //removeChem takes too long

      break;

    case 105: //addChem takes too long

      break;

    case 106: //temp sensor - no more sensors on chain
      break;
    case 107: //temp sensor - CRC is not valid!
      break;
    case 108: //temp sensor - Device is not recognized
      break;

    case 109: //soak tank not enough
      break;
    case 901: //Can not find SD card
      break; 
    case 902: //incorrect file header
      break;
    case 903: //some program are not loaded properly
      break;
    case 904: //missing program file
      break;
    default: //unknow error code
      break;

  }

}
