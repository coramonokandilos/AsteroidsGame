SpaceShip shaceship;
Starz [] stars;
ArrayList <Asteroids> spaceblockz = new ArrayList <Asteroids>();
ArrayList <Bullet> magic = new ArrayList <Bullet>();

public void setup() 
{
  background(0);
  size(600, 600);
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
    if(dist(spaceblockz.get(i).getX(), spaceblockz.get(i).getY(), shaceship.getX(), shaceship.getY()) < 15) 
    {
      spaceblockz.remove(i);
    } 

  for (int m = 0; m < magic.size(); m++)
  {
    magic.get(m).move();  
    magic.get(m).show();
    for (int j = 0; j < spaceblockz.size(); j++)
    {
      if(dist(magic.get(m).getX(), magic.get(m).getY(), spaceblockz.get(j).getX(), spaceblockz.get(j).getY()) < 15)
      {
        spaceblockz.remove(j);
      } 
    }
  }
  }
  shaceship.move();
  shaceship.show();




}
public void keyPressed()
{
  if (keyCode == UP) 
  {
    shaceship.accelerate(0.3);
}
  else if (keyCode == DOWN) 
  {
    shaceship.accelerate(-0.3);

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
    shaceship.setX((int)(Math.random()*600));
    shaceship.setY((int)(Math.random()*600));
    shaceship.setDirectionX(0);
    shaceship.setDirectionY(0);
    shaceship.setPointDirection((int)(Math.random()*360));
  }
  else if (keyCode == 'B'){magic.add(new Bullet(shaceship));}

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
  myColor = #FF007F;
  myCenterX = 300;
  myCenterY = 300;
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
    color2 = #000000;
    myColor = #FFFFFF;
    myCenterX = (int)(Math.random() *600);
    myCenterY = (int)(Math.random() *600);
  }
  public void show()
  {
    double blink = Math.random();
    stroke(255);
    strokeWeight(0.5);
    if (blink < 0.5)
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
  xCorners[0] = 10;
  yCorners[0] = 0;
  xCorners[1] = 12;
  yCorners[1] = 12;
  xCorners[2] = 6;
  yCorners[2] = 9;
  xCorners[4] = -10;
  yCorners[4] = 9;
  xCorners[5] = -11;
  yCorners[5] = 0;
  xCorners[6] = -10;
  yCorners[6] = -9;
  xCorners[7] = -9;
  yCorners[7] = -9;
  xCorners[8] = 0;
  yCorners[8] = -11;
  xCorners[9] = 9;
  yCorners[9] = -10;
  xCorners[10] = 11;
  yCorners[10] = -9;
  xCorners[11] = 10;
  yCorners[11] = 0;
  myColor = #808080;
  myCenterX = 300;
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

class Bullet extends Floater
{
    public Bullet(SpaceShip shaceship)
    {
  myPointDirection = shaceship.getPointDirection();
  myColor = #0066FF;
  myCenterX = shaceship.getX();
  myCenterY = shaceship.getY();
  double dRadians = myPointDirection*(Math.PI/180);
  myPointDirection = shaceship.getPointDirection();
  myDirectionX = 5 * Math.cos(dRadians) + shaceship.getDirectionX(); //fix the mydirectionX + Y
  myDirectionY = 5 * Math.sin(dRadians) + shaceship.getDirectionY();

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
    stroke(myColor); 
    strokeWeight(1);                  
    ellipse((int)myCenterX, (int)myCenterY, 10, 10);
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

