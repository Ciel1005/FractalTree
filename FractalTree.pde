private double fractionLength = .6; 
private double fractionLength2 = .8; 
private int smallestBranch = 5; 
private double branchAngle = .5;  
public void setup() 
{   
  size(1000, 1000);    
} 
public void draw() 
{   
  background(0);   
 
 stroke((int)(Math.random()*5)+25);  
strokeWeight(50);
  line(0,1000,25,900);   
   otherWorld(540, 560, 800, 100);
  drawBranch(25, 900, 200, 3*Math.PI/2, 0, 50, true);
  drawBranch(25, 900, 200, 3*Math.PI/2, 0, 50, false);
   curveL(250, 784, 200, 5*Math.PI/2, 0, 46, true); 
     curveL(250, 784, 200, 5*Math.PI/2, 0, 46, false); 
       
   
   
     
   strokeWeight(20);
       line(0,1000,25,900);   
   stroke((int)(Math.random()*5)+25);  
   line(550,900,550,700);   
  drawBranches(550, 700, 100, 3*Math.PI/2, 20);

} 
public void drawBranch(int x,int y, double branchLength, double angle, int spiral, int thicc, boolean main) 
{   
 double angle1 = angle + branchAngle;
 branchLength*=fractionLength;
 int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  if(main){
  stroke((int)(Math.random()*5)+25);  
    strokeWeight(thicc);
  line(x, y, endX1, endY1);
  } else {
  
   stroke((int)(Math.random()*50)+150, 0, 0);
    strokeWeight(thicc/4);
  line(x, y-8, endX1, endY1-8);
  }
  if(spiral < 4){
  drawBranch(endX1, endY1, branchLength+10, angle1, spiral+1, thicc-1, main);
  }
} 
public void curveL(int x,int y, double branchLength, double angle, int spiral, int thicc, boolean main) 
{   
 double angle1 = angle - 0.52;
 branchLength*=fractionLength;
 int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
 if(main){
 stroke((int)(Math.random()*5)+25);  
    strokeWeight(thicc);
  line(x, y, endX1, endY1);
  } else {
      drawBranches(endX1,endY1, 30, angle, 10);
    stroke((int)(Math.random()*50)+150, 0, 0);
    strokeWeight(thicc/4);
  line(x, y-8, endX1, endY1-8);
  }

  
  if(spiral < 10){
   
  curveL(endX1, endY1, branchLength+150, angle1, spiral+1, thicc-2, main);
  }
} 
public void drawBranches(int x,int y, double branchLength, double angle, int thicc) 
{   
 double angle1 = angle + branchAngle;
 double angle2 = angle - branchAngle;
 int rando = (int)(Math.random()*2);
 branchLength*=fractionLength2;
 int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
   int endX2 = (int)(branchLength*Math.cos(angle2) + x);
    int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  if(branchLength > 20){
 stroke((int)(Math.random()*5)+25);  
  strokeWeight(thicc);
  line(x+rando, y, endX1+rando, endY1);
  line(x-rando, y, endX2-rando, endY2);
  }else{
  stroke((int)(Math.random()*50)+150, 0, 0);
  line(x, y, endX1+rando, endY1+2);
  line(x, y, endX2-rando, endY2+2);
  }
  if(branchLength > smallestBranch){
  drawBranches(endX1, endY1, branchLength, angle1, thicc-3);
  drawBranches(endX2, endY2, branchLength, angle2, thicc-3);
  }
}

public void otherWorld(int x, int y, int siz, int fade){
  fill((int)(Math.random()*50)+50, 5,(int)(Math.random()*50)+50, fade+(int)(Math.random()*50)+50);
  noStroke();
 ellipse(x, y, siz-10, siz);
  if(siz > 10){
   otherWorld(x, y, siz-100, fade/2); 
  }
}
