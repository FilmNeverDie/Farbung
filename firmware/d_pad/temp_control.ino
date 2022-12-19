void tempControl() {

  if (IOCheckMode == 1) { //turn off heater in IO Mode
    if (heater.State() == 1) {
      heater.OFF();
    }
    return;
  }

  //Serial.println("tempControl //******");
  float difference = tempCurrent - tempTarget;
  //Serial.println("Difference is : " + String(difference));

  if (soakLevel.isOFF() == 1) { //if ehough soaking water

    //temp control loop
    if (difference < -1) { //need all power heating
      //Serial.println("Heater Full ON");
      if (heater.State() == 0) { //turn on if haven't
        heater.ON();
      }
    } else if (difference <= 0) { //need half power heating
      //Serial.println("Heater 25% ON");
      if (timer % 10000 <= 3000) { //heater ON for 3 S every 10 S

        if (heater.State() == 0) { //ON if haven't
          heater.ON();
        }
      } else {
        if (heater.State() == 1) { //OFF if haven't
          heater.OFF();
        }
      }
    } else if (difference > 0) { //no heating needed
      //Serial.println("Heater OFF");
      if (heater.State() == 1) { //turn off heater if haven't
        heater.OFF();
      }
    }
  } else { //if not enough saoking water
    errorCode(109);

    if (heater.State() == 1) { //turn off heater if haven't
      heater.OFF();
    }
  }

}

void readTemp() {

  //Serial.println("readTemp //*****");
  sensors.requestTemperatures();

  tempCurrent = sensors.getTempCByIndex(0);
  //Serial.println("Temperatur is: " + String(tempCurrent));

}
