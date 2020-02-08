import processing.sound.*;
import gifAnimation.*;

SoundFile sonido;
SoundFile aplauso;
SoundFile voladores;

GifMaker ficherogif;

boolean up1 = false;
boolean up2 = false;
boolean down1 = false;
boolean down2 = false;

boolean started = false;

int contador_frames = 0;

float px, py, vx, vy, v_pelota;
float muro1X, muro1Y, muro2X, muro2Y;
int anchoPelota = 30;
int radioPelota = anchoPelota/2;
int anchoMuro = 12, altoMuro = 80;
int v_muro = 5;
int ancho_pantalla = 500, alto_pantalla = 500;
int marcador1 = 0, marcador2 = 0;
int alto_marcador = 200, pie = 700;

int display_gol = 0;

void start_stop(){
   if(started){
     started = false;
     noLoop();
   }else{
     started = true;
     loop();
   }
}

float getAnguloRebote(float muroPosY){
  float angulo;
  float rango = TWO_PI/3;
  float posRelativa = (py-muroPosY) / altoMuro;
  
  if(vx < 0){
    angulo = (PI/3) - (rango * posRelativa);
  }else{
    angulo = (TWO_PI/3) + (rango * posRelativa);
  }
  
  return angulo;
}

void rebota(float muroPosY){
   
   float angulo = getAnguloRebote(muroPosY);
   vx = v_pelota * cos(angulo);
   vy = -v_pelota * sin(angulo);
   
   sonido.play(); 
}

void desplaza_muros(){
  if(up1){
    muro1Y = muro1Y - v_muro; 
  }
  
  if(down1){
    muro1Y = muro1Y + v_muro; 
  }
  
  if(up2){
    muro2Y = muro2Y - v_muro;
  }
  
  if(down2){
    muro2Y = muro2Y + v_muro;
  }  

  if(muro1Y > alto_pantalla + alto_marcador - altoMuro){
    muro1Y = alto_pantalla + alto_marcador - altoMuro; 
  }else if(muro1Y < alto_marcador){
    muro1Y = alto_marcador;
  }
  
  if(muro2Y > alto_pantalla + alto_marcador - altoMuro){
    muro2Y = alto_pantalla + alto_marcador - altoMuro; 
  }else if(muro2Y < alto_marcador){
    muro2Y = alto_marcador;
  }
}

void setup(){
  size(500,740);
  noLoop();
  
  fill(128);
  noStroke();
  
  sonido = new SoundFile(this, "rebote.wav") ;
  aplauso = new SoundFile(this, "aplauso.wav");
  voladores = new SoundFile(this, "voladores.wav");
  
  ficherogif = new GifMaker( this, "pong.gif");
  ficherogif.setRepeat(0);
  
  px = width/2;
  py = alto_pantalla/2 + alto_marcador;
  
  v_pelota = 3;
  float angulo = random(-PI/3, PI/3);
  vx = v_pelota * cos(angulo);
  vy = -v_pelota * sin(angulo);
  
  muro1X = 10;
  muro1Y = (int)(random(alto_pantalla - altoMuro)) + alto_marcador;
  
  muro2X = width - anchoMuro - 10;
  muro2Y = (int)(random(alto_pantalla - altoMuro)) + alto_marcador;
  
}

void detecta_colision(){
  
  boolean lateral = false;

  float X_Proxima = px;
  if(px < muro1X){
    X_Proxima = muro1X;
    lateral = true;
  }else if(px > muro1X + anchoMuro) X_Proxima = muro1X + anchoMuro;
  else lateral = true;

  float Y_Proxima = py;
  if (py < muro1Y) Y_Proxima = muro1Y;
  else if (py > muro1Y + altoMuro) Y_Proxima = muro1Y + altoMuro;

  float distancia = (px - X_Proxima)*(px - X_Proxima) + (py - Y_Proxima)*(py - Y_Proxima);
  
  if(distancia <= radioPelota * radioPelota && vx < 0) {
    if(!lateral){
      rebota(muro1Y);
    }else{
      vy = -vy;
      sonido.play();
    }
  }
  
  lateral = false;
  X_Proxima = px;
  
  if(px < muro2X) X_Proxima = muro2X;
  else if(px > muro2X + anchoMuro){
    X_Proxima = muro2X + anchoMuro;
    lateral = true;
  }
  else lateral = true;
  
  Y_Proxima = py;
  if (Y_Proxima < muro2Y) Y_Proxima = muro2Y;
  if (Y_Proxima > muro2Y + altoMuro) Y_Proxima = muro2Y + altoMuro;

  distancia = (px - X_Proxima)*(px - X_Proxima) + (py - Y_Proxima)*(py - Y_Proxima);
  
  if(distancia <= radioPelota * radioPelota && vx > 0) {
    if(!lateral){
      rebota(muro2Y);
    }else{
      vy = -vy;
      sonido.play();
    }
  }
    
  if(px > width + radioPelota){
    vx = -vx;
    marcador1 = marcador1 + 1;
    
    if(marcador1 < 5){
    
      aplauso.play();
      display_gol = 100;  
    
    }else{
      voladores.play();
    }
    
  }
  
  if(px < 0 - radioPelota){
    vx = -vx;
    marcador2 = marcador2 + 1;
    
    if(marcador2 < 5){
      
      aplauso.play();
      display_gol = 100;
  
    }else{
      voladores.play();
    }
    
  }
  
  if(py > alto_pantalla + alto_marcador - radioPelota || py < alto_marcador + radioPelota + 5){
    vy = -vy;
    sonido.play();
  }
}

void pinta_marcos(){
  stroke(128);
  strokeWeight(5);
  
  line(0, alto_marcador, width, alto_marcador);
  line(0, pie, width, pie);

  textFont(createFont("Arial", 30));
  textAlign(LEFT, CENTER);

  text("Jugador 1 : " + marcador1, 40, 40);
  text("Jugador 2 : " + marcador2, 290, 40);

  textFont(createFont("Arial", 20));

  text("Subir muro : q", 40, 90);
  text("Bajar muro : a", 40, 120);
  
  text("Subir muro : o", 290, 90);
  text("Bajar muro : k", 290, 120);
  
  textAlign(CENTER, CENTER);

  text("Iniciar / Pausar : \'Barra Espaciadora\'", width/2, 160);
  
  if(display_gol > 0){

    textFont(createFont("Arial", 30));
    text("¡GOOOOOL!", width/2, alto_pantalla/2 + 150);    

    px = width/2;
    py = alto_pantalla/2 + alto_marcador; 
    
    display_gol--;

  }
  
  if(marcador1 == 5 || marcador2 == 5){
  
    textFont(createFont("Arial", 30));
    if(marcador1 == 5){
      text("¡Has ganado Jugador 1!", width/2, alto_pantalla/2 + 150); 
    }else{
      text("¡Has ganado Jugador 2!", width/2, alto_pantalla/2 + 150);
    }
    
    px = width/2;
    py = alto_pantalla/2 + alto_marcador;

  }
  
  textFont(createFont("Arial", 12));
  text("Práctica 1 CIU - Juan Sebastián Ramírez Artiles", width/2, (height - pie) / 2 + pie);
  
  noStroke(); 
}

void draw(){
  background(0);
  
  pinta_marcos();
 
  ellipse(px, py, anchoPelota, anchoPelota);
   
  desplaza_muros();
  
  rect(muro1X, muro1Y, anchoMuro, altoMuro);
  rect(muro2X, muro2Y, anchoMuro, altoMuro);
 
  if(contador_frames == 3){
    ficherogif.addFrame();
    contador_frames = 0;
  }else{
    contador_frames ++;
  }
  
  if(display_gol > 0) return;
  if(marcador1 == 5 || marcador2 == 5){
    marcador1 = 0;
    marcador2 = 0;
    start_stop();
  }
  
  detecta_colision();
  
  px = px + vx;
  py = py + vy;
  
}

void keyReleased() {

  int x = key;
  
  switch(x){
    case 114:
      ficherogif.finish();
      break;
      
    case 32:
      start_stop();
      break;
        
    case 113:
      up1 = false;
      break;
    
    case 97:
      down1 = false;
      break;
    
    case 111:
      up2 = false;
      break;
    
    case 107:
      down2 = false;
      break;
  }
  
}

void keyPressed() {
  
  int x = key;
  
  switch(x){
    
    case 113:
      up1 = true;
      break;
    
    case 97:
      down1 = true;
      break;
    
    case 111:
      up2 = true;
      break;
    
    case 107:
      down2 = true;
      break;
  }
  
}
