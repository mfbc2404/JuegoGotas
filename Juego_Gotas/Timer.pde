class Tiempo{
int savedTime;
int totalTime;

  Tiempo(int tempTotalTiempo){
    //savedTime = millis();
    totalTime = tempTotalTiempo;
  }
  
  void empezar(){
    //calculate how much time passed
    savedTime = millis();
  }
  
  boolean acabo(){
    int passedTime = millis() - savedTime;
    if(passedTime > totalTime){
      return true;
    }
    else
    {
      return false;
    }
  }
  
  void establecer(int t){
    totalTime = t;
  }
}