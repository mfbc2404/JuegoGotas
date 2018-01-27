class Atrapador{
  float r;
  float x,y;
  color c;
  
  Atrapador(float tempR){
    r = tempR;
    c = color(50,10,10,150);
    x = 0;
    y = 0; 
  }
  
  void setLocation(float tempX, float tempY){
    x = tempX;
    y = tempY;
  }
  
  void mostrar(){
    fill(c);
    stroke(0);
    ellipse(x,y,r+8,r+8);
  }
  
  boolean interseccion(Gota g){
    float distancia = dist(x,y,g.x,g.y);
    if(distancia < r+ g.radio){
      return true;
    }
    else
    {
      return false;
    }
  }
}