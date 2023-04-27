int N = 1000;

float[] x = new float[N];
float[] y = new float[N];
float[] vx = new float[N];
float[] vy = new float[N];
float[] time = new float[N];
float[] life = new float[N];

float G;
float[] d = new float[N];
float loss;

color WHITE;

void setup() {
  fullScreen();
  //size(1500, 1000);
  

  G = 0.01;
  loss = 0.95;
  WHITE = color(255, 100);
  
  // init particles
  for (int i=0;i<N;i++) {
    x[i] = random(width);
    y[i] = random(height);
    
    vx[i] = random(-2, 2);
    vy[i] = random(-2, 2);
    
    d[i] = random(10);
    time[i] = 0;
    life[i] = 0;
  }
  
  fill(WHITE);
  noStroke();
}

void draw() {
  background(0);
  
  for (int i = 0; i < N; i++) {
    if (mousePressed && life[i] < 0.5) {
      life[i] = random(1);
      
      if (life[i] > 0.5) {
        time[i] = 0;
        
        x[i] = mouseX;
        y[i] = mouseY;
        
        vx[i] = cos(random(2*PI));
        vy[i] = sin(random(2*PI));
      }
    }
    
    if (life[i] > 0.5) {
      vx[i] += 0;
      vy[i] += (d[i] * G);
      
      x[i] += vx[i];
      y[i] += vy[i];
      
      time[i]++;
      
      if (time[i] > 200) {
        life[i] = 0;
      }
    
      circle(x[i], y[i], d[i]);
    }
    
    /*
    if (time[i] > 200 && mousePressed) { 
      x[i] = mouseX;
      y[i] = mouseY;
      
      vx[i] = 1 * cos(random(2*PI));
      vy[i] = 1 * sin(random(2*PI));
      
      time[i] = int(random(200));
    }
    */
    

    /*
    if (x[i] < d/2) {
      x[i] = d/2;
      vx[i] = -vx[i] * loss;
    }
    if (y[i] > height - d/2) {
      y[i] = height - d/2;
      vy[i] = -vy[i] * loss;
    }
    if (y[i] < d/2) {
      y[i] = d/2;
      vy[i] = -vy[i] * loss;
    }
    */
    
    
  }
  
  
  /*
  for (int i = 0; i < N; i++) {
      Gx = 0;
      Gy = 0;
      for (int j = 0; j < N; j++) {
        if (i != j) {
          dx = x[i] - x[j];
          dy = y[i] - y[j];
          r = sqrt((dx * dx) + (dy * dy));
          soft_r = sqrt((r * r) + (epsilon * epsilon));
          
          if (r > 20*d) {
            Gx += (G * dx) / (r * r * r);
            Gy += (G * dy) / (r * r * r);
          }

          //r = sqrt((dx*dx) + (dy*dy));
          //soft_r = sqrt((r*r) + (epsilon*epsilon));
          
          //Gx += (G * dx) / (soft_r * soft_r * soft_r);
          //Gy += (G * dy) / (soft_r * soft_r * soft_r);
        }
      }

      //printf("%f\n", ax[i]);

      vx[i] += Gx;
      vy[i] += Gy;

      x[i] += vx[i];
      y[i] += vy[i];
      
      set(int(x[i]), int(y[i]), WHITE);
    }
    */
}
