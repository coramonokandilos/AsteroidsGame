import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class AsteroidsGame extends PApplet {

SpaceShip shaceship;
Starz [] stars;
ArrayList <Asteroids> spaceblockz = new ArrayList <Asteroids>();

public void setup() 
{
  background(0);
  size(400, 400);
  spaceblockz.add(new Asteroids());
  spaceblockz.add(new Asteroids());
  spaceblockz.add(new Asteroids());
  shaceship = new SpaceShip();
  stars = new Starz[100];
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Starz();
  }

}
public void draw() 
{
  background(0);
  for (int j = 0; j <stars.length; j++)
  {
    stars[j].show();
  }
  for (int i = 0; i < spaceblockz.size(); i++)
  {
    spaceblockz.get(i).move();
    spaceblockz.get(i).show();
    if(dist(spaceblockz.get(i).getX(), spaceblockz.get(i).getY(), shaceship.getX(), shaceship.getY()) < 15) //fix the syntax?
    {
      spaceblockz.remove(i);
    } 


  }
  shaceship.move();
  shaceship.show();  


}
public void keyPressed()
{
  if (keyCode == UP) 
  {
    shaceship.accelerate(0.3f);
}
  else if (keyCode == DOWN) 
  {
    shaceship.accelerate(-0.3f);

  }
  else if (keyCode == RIGHT)
  {
    shaceship.rotate(5);
  }
  else if (keyCode == LEFT)
  {
    shaceship.rotate(-5); 
  }
  else if (key == ' ')
  {
    shaceship.setX((int)(Math.random()*400));
    shaceship.setY((int)(Math.random()*400));
    shaceship.setDirectionX(0);
    shaceship.setDirectionY(0);
    shaceship.setPointDirection((int)(Math.random()*360));
  }

}

class SpaceShip extends Floater  
{   
  SpaceShip()
  {
  corners = 8;
  xCorners = new int[corners];
  yCorners = new int[corners];
  xCorners[0] = -8;
  yCorners[0] = 8;
  xCorners[1] = -2;
  yCorners[1] = 0;
  xCorners[2] = -8;
  yCorners[2] = -8;
  xCorners[3] = 6;
  yCorners[3] = -4;
  xCorners[4] = 6;
  yCorners[4] = -8;
  xCorners[5] = 16;
  yCorners[5] = 0;
  xCorners[6] = 6;
  yCorners[6] = 8;
  xCorners[7] = 6;
  yCorners[7] = 4;
  myColor = 0xffFF007F;
  myCenterX = 200;
  myCenterY = 200;
  myDirectionX = 0;
  myDirectionY = 0;
  myPointDirection = 0;
  }
  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY = y;}   
  public int getY(){return (int)myCenterY;}    
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return myDirectionY;} 
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;} 

    public void show ()    
  {             
    fill(myColor);   
    stroke(255); 
    strokeWeight(1);  
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
 
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    } 
   
    endShape(CLOSE);
  }

}

class Starz 
{
  private int myColor, myCenterX, myCenterY,  color2;
  Starz()
  {
    color2 = 0xff000000;
    myColor = 0xffFFFFFF;
    myCenterX = (int)(Math.random() *400);
    myCenterY = (int)(Math.random() *400);
  }
  public void show()
  {
    double blink = Math.random();
    stroke(255);
    strokeWeight(0.5f);
    if (blink < 0.5f)
    {
      fill(color2);
    }
    else
    {
      fill(myColor);
    }

    ellipse(myCenterX, myCenterY, 5, 5);
  }
}

class Asteroids extends Floater
{
  private int rotateRock;
  public Asteroids()
  {

  corners = 12;
  xCorners = new int[corners];
  yCorners = new int[corners];
  xCorners[0] = 6;
  yCorners[0] = 0;
  xCorners[1] = 7;
  yCorners[1] = 5;
  xCorners[2] = 5;
  yCorners[2] = 7;
  xCorners[3] = -5;
  yCorners[3] = 6;
  xCorners[4] = -6;
  yCorners[4] = 5;
  xCorners[5] = -7;
  yCorners[5] = 0;
  xCorners[6] = -6;
  yCorners[6] = -5;
  xCorners[7] = -5;
  yCorners[7] = -5;
  xCorners[8] = 0;
  yCorners[8] = -7;
  xCorners[9] = 5;
  yCorners[9] = -6;
  xCorners[10] = 7;
  yCorners[10] = -5;
  xCorners[11] = 6;
  yCorners[11] = 0;
  myColor = 0xff808080;
  myCenterX = 200;
  myCenterY = 0;
  myDirectionX = (double)((Math.random()*6)-3);
  myDirectionY = (double)((Math.random()*6)-3);;
  myPointDirection = 0;
  rotateRock = (int)((Math.random()*10)-5);
  }
  public void setX(int x){myCenterX = x;}  
  public int getX(){return (int)myCenterX;}   
  public void setY(int y){myCenterY = y;}   
  public int getY(){return (int)myCenterY;}    
  public void setDirectionX(double x){myDirectionX = x;}   
  public double getDirectionX(){return myDirectionX;}   
  public void setDirectionY(double y){myDirectionY = y;}   
  public double getDirectionY(){return myDirectionY;} 
  public void setPointDirection(int degrees){myPointDirection = degrees;}   
  public double getPointDirection(){return myPointDirection;} 
  public void move()
  {
    rotate(rotateRock);
    super.move();
  }
  
}

abstract class Floater 
{   
  protected int corners; 
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; 
  protected double myDirectionX, myDirectionY; 
  protected double myPointDirection;
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);            
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "AsteroidsGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
