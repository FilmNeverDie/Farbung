String inputCheck(int checkIndex, bool outputIndex) { //outputIndex: 0:name 1:reading
  switch (checkIndex) {
    case 0:
      if (outputIndex == 0) { //to get the name of this input check
        return "ButtonPinVal:";
      } else if (outputIndex == 1) {
        return String(analogRead(A0)); //to get the reading of this input check
      }
      break;

    case 1:
      if (outputIndex == 0) {
        return "TankFullPinVal:";
      } else if (outputIndex == 1) {
        return String(digitalRead(drum_high));
      }

    case 2:
      if (outputIndex == 0) {
        return "TankLvlisFull:";
      } else if (outputIndex == 1) {
        return String(drumHI.isON());
      }
      break;

    case 3:
      if (outputIndex == 0) {
        return "TankEmptyPinVal:";
      } else if (outputIndex == 1) {
        return String(digitalRead(drum_empty));
      }

    case 4:
      if (outputIndex == 0) {
        return "TankLvlisEmpty";
      } else if (outputIndex == 1) {
        return String(drumempty.isOFF());
      }
      break;

    case 5:
      if (outputIndex == 0) {
        return "SoakLvlPinVal:";
      } else if (outputIndex == 1) {
        return String(analogRead(tanks_full));
      }

    case 6:
      if (outputIndex == 0) {
        return "SoakLvlisEnough";
      } else if (outputIndex == 1) {
        return String(soakLevel.isOFF());
      }
      break;

    case 7:
      if (outputIndex == 0) {
        return "SoakTankTemp";
      } else if (outputIndex == 1) {
        return String(tempCurrent);
      }
      break;

    default:
      if (outputIndex == 0) {
        return "---";
      } else if (outputIndex == 1) {
        return "---";
      }
      break;
  }
}

String outputCheck(int checkIndex, bool outputIndex) {
  switch (checkIndex) {
    case 0: //agitation motor forward
      if (outputIndex == 0) { //to get the name of this output check
        return "Motor Forward";
      } else if (outputIndex == 1) { //to act this output check
        if (outputCheckAction == 1) { //to switch this output check
          agitationMotor.Forward(agitationSpeed);
          return "ON";
        } else {
          agitationMotor.Stop();
          return "OFF";
        }
      }
      break;

    case 1: //agitation motor backward
      if (outputIndex == 0) {
        return "Motor Backward";
      } else if (outputIndex == 1) {
        if (outputCheckAction == 1) {
          agitationMotor.Backward(agitationSpeed);
          return "ON";
        } else {
          agitationMotor.Stop();
          return "OFF";
        }
      }
      break;

    case 2: //add chem 1
      if (outputIndex == 0) {
        return "addChem 1";
      } else if (outputIndex == 1) {
        if (outputCheckAction == 1) {
          addChem.ON(1);
          return "ON";
        } else {
          addChem.OFF(1);
          return "OFF";
        }
      }
      break;

    case 3: //add chem 2
      if (outputIndex == 0) {
        return "addChem 2";
      } else if (outputIndex == 1) {
        if (outputCheckAction == 1) {
          addChem.ON(2);
          return "ON";
        } else {
          addChem.OFF(2);
          return "OFF";
        }
      }
      break;

    case 4: //add chem 3
      if (outputIndex == 0) {
        return "addChem 3";
      } else if (outputIndex == 1) {
        if (outputCheckAction == 1) {
          addChem.ON(3);
          return "ON";
        } else {
          addChem.OFF(3);
          return "OFF";
        }
      }

    case 5: //add chem 4
      if (outputIndex == 0) {
        return "addChem 4";
      } else if (outputIndex == 1) {
        if (outputCheckAction == 1) {
          addChem.ON(4);
          return "ON";
        } else {
          addChem.OFF(4);
          return "OFF";
        }
      }

    case 6: //add chem 5
      if (outputIndex == 0) {
        return "addChem 5";
      } else if (outputIndex == 1) {
        if (outputCheckAction == 1) {
          addChem.ON(5);
          return "ON";
        } else {
          addChem.OFF(5);
          return "OFF";
        }
      }

    case 7: //add chem 6
      if (outputIndex == 0) {
        return "addChem 6";
      } else if (outputIndex == 1) {
        if (outputCheckAction == 1) {
          addChem.ON(6);
          return "ON";
        } else {
          addChem.OFF(6);
          return "OFF";
        }
      }

    case 8: //remove chem 1
      if (outputIndex == 0) {
        return "removeChem 1";
      } else if (outputIndex == 1) {
        if (outputCheckAction == 1) {
          removeChem.ON(1);
          return "ON";
        } else {
          removeChem.OFF(1);
          return "OFF";
        }
      }

    case 9: //remove chem 2
      if (outputIndex == 0) {
        return "removeChem 2";
      } else if (outputIndex == 1) {
        if (outputCheckAction == 1) {
          removeChem.ON(2);
          return "ON";
        } else {
          removeChem.OFF(2);
          return "OFF";
        }
      }

    case 10: //remove chem 3
      if (outputIndex == 0) {
        return "removeChem 3";
      } else if (outputIndex == 1) {
        if (outputCheckAction == 1) {
          removeChem.ON(3);
          return "ON";
        } else {
          removeChem.OFF(3);
          return "OFF";
        }
      }

    case 11: //remove chem 4
      if (outputIndex == 0) {
        return "removeChem 4";
      } else if (outputIndex == 1) {
        if (outputCheckAction == 1) {
          removeChem.ON(4);
          return "ON";
        } else {
          removeChem.OFF(4);
          return "OFF";
        }
      }

    case 12: //remove chem 5
      if (outputIndex == 0) {
        return "removeChem 5";
      } else if (outputIndex == 1) {
        if (outputCheckAction == 1) {
          removeChem.ON(5);
          return "ON";
        } else {
          removeChem.OFF(5);
          return "OFF";
        }
      }

    case 13: //remove chem 6
      if (outputIndex == 0) {
        return "removeChem 6";
      } else if (outputIndex == 1) {
        if (outputCheckAction == 1) {
          removeChem.ON(6);
          return "ON";
        } else {
          removeChem.OFF(6);
          return "OFF";
        }
      }

    case 14: //heater
      if (outputIndex == 0) {
        return "heater **DO NOT LEAVE ON**";
      } else if (outputIndex == 1) {
        if (outputCheckAction == 1) {
          heater.ON();
          return "ON";
        } else {
          heater.OFF();
          return "OFF";
        }
      }

    default:
      if (outputIndex == 0) {
        return "---";
      } else if (outputIndex == 1) {
        return "---";
      }
      break;


  }
}
