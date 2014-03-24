int ini_step = 2;
int step=ini_step;

boolean ref = true;
boolean bez = true;

void setup() {
  size(400, 400);
}

float sw = 1;

int my_x = 0;
int my_y = 0;

void draw() {
  background(0);
  
  boolean case1 = false;
  boolean case2 = false;
   
  if (case1) {
    //vibrant lines case study
    if (sw > 10) {
      sw = 1;
    }
    sw = sw + random(15);
    strokeWeight(random(8));
  }
  
  if (case2) {
    for (int p = 0; p <= width; p++) {     
      if (my_x == width) {
        my_x = 0;
      }
      if (my_y == width) {
        my_y = 0;
      }
      my_x = p;
      my_y = p;
   
      curves(my_x, my_y, 30);
    } 
  } else {
    my_x = width - mouseX;
    my_y = mouseY;
    curves(my_x, my_y, 3);
  }
}

void curves(int my_x, int my_y, int n) {
  int yp = mouseY/6; //describe
  for (int i = 0; i <= width; i = i + width/n) {
    //reference lines    
    int x1 = i; //change i by 200
    int y1 = mouseY; //change j by 100
    int x2 = my_x; //my_x
    int y2 = yp;
      
    int x1_ = my_x; //my_x
    int y1_ = height - yp;
    int x2_ = i;
    int y2_ = height - mouseY; //change by 300

    boolean centerline = false;
    if (centerline) {
      //center line
      stroke(255);
      line(width/2, 100, width/2, height - 100);
    }
    if (ref) {
      //anchor reference lines
      stroke(255,102,0);
      line(x1_, y1_,x2_, y2_);
      line(x1, y1, x2, y2);
    }  
    if (bez) {
      //beziers
      noFill();
      stroke(255,0,0);
      bezier(x1, y1, x2, y2, x1_, y1_, x2_, y2_);
      //reference ellipse
      ellipse(width - my_x, my_y, 5, 5); //mouseY by 200
    }
  }
}

void mousePressed() {
  ref = !ref;
  bez = !bez;
}
