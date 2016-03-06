float xnoise, ynoise, xStart, yStart;


void setup(){
  size(800,600, P3D);
  
  sphereDetail(8);
  noStroke();  
  xStart = random(15);
  yStart = random(15);
}

void draw(){
  background(255,100,100);
  
  xStart += 0.01;
  yStart += 0.01;
  
  xnoise = xStart;
  ynoise = yStart;
  
  camera(350,0,100, 350,-1,0, 0,1,0);
  
  for(int y = 0; y <= height; y+=5){
    ynoise += 0.1;
    xnoise = xStart;
    for(int x = 0; x <= width; x += 5){
      xnoise += 0.1;
      drawSphere(x, y, noise(xnoise, ynoise));
    }
  }
}


void drawSphere(float x, float y, float noiseFactor){
  pushMatrix();
    translate(x,250-y,-y);
    float sphereSize = noiseFactor * 20;
    float grey = 150 + (noiseFactor * 120);
    float alpha = 150 + (noiseFactor * 120);
    fill(grey,120,120, alpha);
    sphere(sphereSize);
  popMatrix();
}