class Gota {
  float x;
  float y;
  float radio;
  color colorGota;
  float velocidad;
  
  boolean termino;
  
  Gota(){
    radio = 8;
    colorGota = color(50,100,150);
    x = random(width);
    y = -radio*4;
    velocidad = random(1,5);
  }
  
  void mover()
  {
    y += velocidad;
  }
  
  boolean tocaFondo(){
    if(y>height+radio*4){
      return true;
    }
    else
    {
      return false;
    }
  }
  
  void mostrar()
  {
    fill(colorGota);
    noStroke();
    for(int i = 2; i < radio;i++)
      ellipse(x,y+i*8,i*4,i*4);
  }
    
  void desaparecer(){
    velocidad = 0;
    y = -1000;
  }
  
  void termino(){
    termino = true;
  }
}