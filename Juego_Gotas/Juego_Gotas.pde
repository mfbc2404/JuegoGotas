Tiempo tiempo;
Gota[] gotas;
Atrapador atrapador;
int totalGotas = 0;

int puntaje;
int nivel;
int vidas;
int contadorNivel;

boolean gameOver = false;

PFont f;

void setup(){
  fullScreen();
  //size(400,400);
  atrapador = new Atrapador(32);
  gotas = new Gota[1000];
  tiempo = new Tiempo(500);
  tiempo.empezar();
  vidas = 10;
  
  f = createFont("Arial", 12, true);
}

void draw(){
  background(255);
  
  
  if(gameOver){
    textFont(f, 48);
    textAlign(CENTER);
    fill(0);
    text("GAME OVER", width/2, height/2);
  }
  else
  {
    
    atrapador.setLocation(mouseX,mouseY);
    atrapador.mostrar();
    
    if(tiempo.acabo()){
      
      if(totalGotas < gotas.length){
        gotas[totalGotas] = new Gota();
        totalGotas++;
      }
      tiempo.empezar();
    }
    
    for(int i = 0; i< totalGotas; i++){
      if(!gotas[i].termino){
        gotas[i].mover();
        gotas[i].mostrar();
      
      if(gotas[i].tocaFondo()){
          contadorNivel++;
          gotas[i].termino(); 
          
          vidas--;

        if (vidas <= 0) {
          gameOver = true;
        }
      }
      
      if(atrapador.interseccion(gotas[i])){
        gotas[i].termino();
        contadorNivel++;
        puntaje++;
      }
    }     
  }
  
    if (contadorNivel >= gotas.length) {

      nivel++;

      contadorNivel = 0;
      vidas = 10;
      tiempo.establecer(constrain(300-nivel*25, 0, 300));
      totalGotas = 0;
    }

    textFont(f, 14);
    fill(20);
    text("Vidas: " + vidas, 10, 20);
    rect(10, 24, vidas*10, 10);
  }
}