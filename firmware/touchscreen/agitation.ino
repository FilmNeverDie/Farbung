void agitation() {
  if (processState == 0) { //not processing

    if (agitationMotor.State() == 0) { //turn off if haven't

    } else {
      agitationMotor.Stop();
    }

  } else if (processState == 1) { //while processing

    if ((timer / 1000) % ((agitationTime1 + agitationTime2) * 2) <= agitationTime1) {
      if (agitationMotor.State() != 1) {
        agitationMotor.Forward(agitationSpeed);
      }
    } else if ((timer / 1000) % ((agitationTime1 + agitationTime2) * 2) <= (agitationTime1 + agitationTime2)) {
      if (agitationMotor.State() != 0) {
        agitationMotor.Stop();
      }
    } else if ((timer / 1000) % ((agitationTime1 + agitationTime2) * 2) <= (agitationTime1 * 2 + agitationTime2)) {
      if (agitationMotor.State() != 2) {
        agitationMotor.Backward(agitationSpeed);
      }
    } else if ((timer / 1000) % ((agitationTime1 + agitationTime2) * 2) <= (agitationTime1 * 2 + agitationTime2 * 2)) {
      if (agitationMotor.State() != 0) {
        agitationMotor.Stop();
      }
    }
  }
}
