int my_x = 0;
int ini_step = 2;
int step=ini_step;

boolean ref = true;
boolean bez = false;

void setup() {
	size(600, 600);
}

float sw = 1;

void draw() {
	int my_x = width - mouseX;
	int my_y = mouseY;

	background(0);

	//case study
	//if (sw > 10) {
	//  sw = 1;
	//}
	//sw = sw + random(15);
	//strokeWeight(random(8));

	for (int i = 0; i <= width; i = i + 30) {
		int yp = mouseY/2;  

		//reference lines    
		int x1 = i; //change i by 200
		int y1 = mouseY + 10; //chanage j by 100
		int x2 = my_x; //my_x
		int y2 = yp;
		  
		int x1_ = my_x; //my_x
		int y1_ = height - yp;
		int x2_ = i;
		int y2_ = height - mouseY; //change by 300

		if (ref) {
			//center line
			stroke(255);
		  	line(width/2,100,width/2,height - 100);

		    //anchor reference lines
		  	stroke(255,102,0);
		  	line(x1_,y1_,x2_,y2_); 
		  	line(x1,y1,x2,y2);
		 }  
	  	if (bez) {
	    	//beziers
	  		noFill();
	  		stroke(255,0,0);
	  		bezier(x1,y1,x2,y2,x1_,y1_,x2_,y2_);

	    	//reference ellipse
	    	ellipse(width - my_x, my_y, 10, 10); //mouseY by 200
		}
	}
}

void mousePressed() {
	if (ref) {
		ref = !ref;
	} else {
		ref = true;
	}
	if (bez) {
		bez =!bez;
	} else {
		bez = true;
	}
}