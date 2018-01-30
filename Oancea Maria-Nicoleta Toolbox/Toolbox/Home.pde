/*
  created by Oancea Maria-Nicoleta
  email: oanceamarianicoleta@gmail.com
  MIT license
*/ 

//the function where the interface for the home page is created
void home(){
  strokeWeight(3);
  stroke(#0000ff);
  fill(#0000ff);
  textAlign(CENTER, TOP);
  textSize(height/14);
  imageMode(CORNER);
  rect(0, 0, width, height/10 );
  fill(#ffffff);
  text("Toolbox", width/2, height/40);
  
  textSize(height/35);
  strokeWeight(5);
  stroke(#b3b3b3);
  fill(#000000);
  noFill();
  rect(25, height/8, width/3-50, height/3.5-35);
  image(colorPickerImg, 50, height/7+30, width/3-100, height/8);
  text("Color Picker", width/6, 2*height/7+30);
  
  rect(width/3+25, height/8, width/3-50, height/3.5-35);
  image(soundIntensityImg, width/3+50, height/7+5, width/3-100, height/8);
  text("Sound \nIntensity", width/2, 2*height/7+5);
  
  rect(2*width/3+25, height/8, width/3-50, height/3.5-35);
  image(locationImg, 2*width/3+50, height/7+40, width/3-100, height/8+20);
  text("Location", width-width/6, 2*height/7+20);
  
  rect(25, height/8+height/3.5-5, width/3-50, height/3.5-35);
  image(distanceImg, 50, 3.15*height/7, width/3-100, height/8+20);
  text("Distance", width/6, 4.1*height/7);
  
  rect(width/3+25, height/8+height/3.5-5, width/3-50, height/3.5-35);
  image(inclinationImg, width/3+50, 3.2*height/7, width/3-100, height/8);
  text("Inclination", width/2, 4.1*height/7);
  
  rect(2*width/3+25, height/8+height/3.5-5, width/3-50, height/3.5-35);
  image(bubbleLevelImg, 2*width/3+50, 3.1*height/7, width/3-100, height/8);
  text("Bubble \nLevel", width-width/6, 3.85*height/7);
  
  rect(25, height/8+2*height/3.5-5, width/3-50, height/3.5-35);
  image(converterImg, 50, 5*height/7, width/3-100, height/8);
  text("Unit \nConverter", width/6, 6*height/7);
  
  rect(width/3+25, height/8+2*height/3.5-5, width/3-50, height/3.5-35);
  image(pavImg, width/3+50, 4.95*height/7, width/3-100, height/8);
  text("Perimeter \nArea \nVolume", width/2, 5.9*height/7);
}

//the function, where defines actions for the home page
void homeClick(){
  if ( mouseX > 25 && mouseX < width/3-25 && mouseY > height/8 && mouseY < height/8+height/3.5-35 ) {
    page = 1;
    camera.start();
  }
  if ( mouseX > width/3+25 && mouseX < 2*width/3-25 && mouseY > height/8 && mouseY < height/8+height/3.5-35 ) {
    page = 2; 
    if (soundRunner == null){ 
        soundRunner = new Thread(){
            public void run(){
                while (soundRunner != null) {
                    try {
                        Thread.sleep(300);
                    } catch (InterruptedException e) { };
                    soundHendler.post(soundUpdater);
                }
            }
        };
        soundRunner.start();
    }
    startRecorder();
  }
  if ( mouseX > 2*width/3+25 && mouseX < width-25 && mouseY > height/8 && mouseY < height/8+height/3.5-35 ) {
    page = 3;
    activity.runOnUiThread(new Runnable(){
      public void run(){
        if ( !myLocation.canAccessGPS() ) myLocation.showSettings();
      }
    });
  }
  if ( mouseX > 25 && mouseX < width/3-25 && mouseY > height/8+height/3.5-5 && mouseY < height/8+2*height/3.5-40 ) {
    page = 4;
    activity.runOnUiThread(new Runnable(){
      public void run(){
        if ( !myLocation.canAccessGPS() ) myLocation.showSettings();
      }
    });
    xCloud1 = width;
    yCloud1 = height/9;
    xCloud2 = width + width/2.5;
    yCloud2 = height/7;
    xCloud3 = width + width/1.5;
    yCloud3 = height/8;
  }
  if ( mouseX > width/3+25 && mouseX < 2*width/3-25  && mouseY > height/8+height/3.5-5 && mouseY < height/8+2*height/3.5-40 ) page = 5;
  if ( mouseX > 2*width/3+25 && mouseX < width-25 && mouseY > height/8+height/3.5-5 && mouseY < height/8+2*height/3.5-40 ) {
    page = 6;
    xBL = width/2.7;
    yBL = height/2.2;
    xBLV = width - width/6;
    yBLV = height/1.9;
    xBLH = width/2;
    yBLH  = height/5.8;
  }
  if ( mouseX > 25 && mouseX < width/3-25 && mouseY > height/8+2*height/3.5-5 && mouseY < height/8+3*height/3.5-40 ) {
    page = 7;
    pageUC = 0 ;
  }
  if ( mouseX > width/3+25 && mouseX < 2*width/3-25 && mouseY > height/8+2*height/3.5-5 && mouseY < height/8+3*height/3.5-40 ) {
    page = 8;
    pagePAV = 0;
  }
}