import gab.opencv.*;
import processing.video.*;
import java.awt.*;
import processing.sound.*;

Capture video;
OpenCV opencv;
SoundFile file;
SoundFile base2;
SoundFile hit;
SoundFile pianoA;
SoundFile pianoB;
SoundFile pianoC;
SoundFile pianoD;

SoundFile pianistA;
SoundFile pianoB_Small;
SoundFile pianoE;
SoundFile pianoF;

SoundFile chordA;
SoundFile guitarB;
SoundFile guitarC;
SoundFile guitarD;

SoundFile cutA;
SoundFile guitarE;
SoundFile guitarF;
SoundFile guitarG;
PImage img;


int h;
int v;
int w;


void setup() {
  size(1280, 720);
  video = new Capture(this, 1280/2, 720/2);
  opencv = new OpenCV(this, 1280/2, 720/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  file = new SoundFile(this, "Abletunes808_03.wav");
  base2 = new SoundFile(this, "Abletunes808_02.wav");
  hit = new SoundFile(this, "hihat127b.wav");
  pianoA = new SoundFile(this, "pianoA.wav");
  pianoB = new SoundFile(this, "pianoB.wav");
  pianoC = new SoundFile(this, "pianoC.wav");
  pianoD = new SoundFile(this, "pianoD.wav");
  
  pianistA = new SoundFile(this, "pianistA.wav");
  pianoB_Small = new SoundFile(this, "pianistB_small.wav");
  pianoE = new SoundFile(this, "pianoE.wav");
  pianoF = new SoundFile(this, "pianoF.wav");
  
  chordA = new SoundFile(this, "chordA.wav");
  guitarB = new SoundFile(this, "guitarB.wav");
  guitarC = new SoundFile(this, "guitarC.wav");
  guitarD = new SoundFile(this, "guitarD.wav");
  
   cutA = new SoundFile(this, "cutA.wav");
  guitarE = new SoundFile(this, "guitarE.wav");
  guitarF = new SoundFile(this, "guitarF.wav");
  guitarG = new SoundFile(this, "guitarG.wav");
  img = loadImage("note.png");
  

  video.start();
}

void draw() {
  scale(2);
  
  opencv.loadImage(video);

  image(video, 0, 0 );

  noFill();
  fill(0, 0, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);
   println(width);

  for (int i = 0; i < faces.length; i++) {
    v = faces[i].y + (faces[i].height/2);
    h = faces[i].x + (faces[i].width/2);
    w = faces[i].width;
    println(faces[i].x + "," + faces[i].y + "," + w);
    println(h + "," + v);
    //image(img, 50, 60);
    image(img, (h-(faces[i].width/9)), (v-(faces[i].height/9)) , (faces[i].width/4), (faces[i].height/4));
    //stroke(153);
    //noFill();
    //rect(h, v, 1, 1);
    
    stroke(153);
    
    if(w >= 50 && w<100){
    
    if(v < 100 && h >235 && h<400){
      hit.play();
  } else if(v > 250 && h >235 && h<400){
     base2.play();
  } 
  
  else if(h < 235 && v > 75 && v<125){
    pianoA.play();
  } else if(h < 235 && v > 125 && v<175){
    pianoB.play();
  } else if(h < 235 && v > 175 && v<225){
    pianoC.play();
  }  else if(h < 235 && v > 225 && v<275){
    pianoD.play();
  }
  
   else if(h > 400 && v > 75 && v<125){
    chordA.play();
  } else if(h > 400 && v > 125 && v<175){
    guitarB.play();
  } else if(h > 400 && v > 175 && v<225){
    guitarC.play();
  }  else if(h > 400 && v > 225 && v<275){
    guitarD.play();
  }
  //delay(100);
  }
  
  else if(w>100){
    
     if(v < 100 && h >235 && h<400){
      hit.play();
  } else if(v > 250 && h >235 && h<400){
     base2.play();
  } 
  
  else if(h < 235 && v > 75 && v<125){
    pianistA.play();
  } else if(h < 235 && v > 125 && v<175){
    pianoB_Small.play();
  } else if(h < 235 && v > 175 && v<225){
    pianoE.play();
  }  else if(h < 235 && v > 225 && v<275){
    pianoF.play();
  }
  
   else if(h > 400 && v > 75 && v<125){
    cutA.play();
  } else if(h > 400 && v > 125 && v<175){
    guitarE.play();
  } else if(h > 400 && v > 175 && v<225){
    guitarF.play();
  }  else if(h > 400 && v > 225 && v<275){
    guitarG.play();
  }
    
  }
}
}
void captureEvent(Capture c) {
  c.read();
 
  
}
