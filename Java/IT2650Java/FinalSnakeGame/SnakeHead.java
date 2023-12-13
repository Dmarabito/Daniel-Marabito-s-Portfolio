/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.snakegame;

import javafx.scene.image.Image;

/**
 *
 * @author danie
 */
public class SnakeHead implements Moveable, Collidable {
    private double x,y;
    private Image SnakeHeadImage;
    private double TargetX;
    private double TargetY;
    private Header header;
    private double Speed = 200;
    private double PreviousX;
    private double PreviousY;
    private Snake WholeSnake;
    private boolean IState = false;
    private boolean AutoCan = false;
    public SnakeHead(double x, double y, Snake WholeSnake) {
        this.x = x;
        this.y = y;
        TargetX = this.x;
        TargetY = this.y;
        SnakeHeadImage = new Image( "SnakeHead.png");
        this.WholeSnake = WholeSnake;
    }

    public Image getSnakeHeadImage() {
        return SnakeHeadImage;
    }

    @Override
    public double getX() {
        return x;
    }

    @Override
    public double getY() {
        return y;
    }

    @Override
    public void setX(double x) {
        this.x = x;
    }

    @Override
    public void setY(double y) {
        this.y = y;
    }

    @Override
    public double getTargetX() {
        return TargetX;
    }

    @Override
    public double getTargetY() {
        return TargetY;
    }
    @Override
    public void SetTarget()
    {
        if (this.header == Header.Up) 
        {

            this.setTargetX(this.getX());
            this.setTargetY(this.getY()-100);
        }
        else if (this.header == Header.Down) 
        {

            this.setTargetX(this.getX());
            this.setTargetY(this.getY()+100);
        }
        else if (this.header == Header.Left) 
        {

            this.setTargetY(this.getY());
            this.setTargetX(this.getX()-100);
        }
        else if (this.header == Header.Right) 
        {

            this.setTargetY(this.getY());
            this.setTargetX(this.getX()+100);
        }
        else if (this.header == Header.None)
        {
            this.setTargetX(this.getX());
            this.setTargetY(this.getY());
        }
    }

    public void setTargetX(double TargetX) {
        this.TargetX = TargetX;
    }

    public void setTargetY(double TargetY) {
        this.TargetY = TargetY;
    }
    
    

    public void setHeader(Header header) {
        this.header = header;
    }
    public void setHeader(String header)
    {
        if(header == "UP" && this.header != Header.Down)
        {
            this.header = Header.Up;
            
        }
        else if(header == "DOWN" && this.header != Header.Up)
        {
            this.header = Header.Down;
        }
        else if(header == "LEFT"&& this.header != Header.Right)
        {
            this.header = Header.Left;
        }
                else if(header == "RIGHT"&& this.header != Header.Left)
        {
            this.header = Header.Right;
        }
        //System.out.println(this.header);
    }
    
    public double getSpeed()
    {
        return Speed;
    }
    
       public void SetLastX(double x)
   {
       this.PreviousX = x;
   }
   
      public void SetLastY(double y)
   {
       this.PreviousX = y;
   }
   public double getLastX(){return this.PreviousX;}
   public double getLastY(){return this.PreviousY;}
   
    @Override
   public double getXOpposite(){return this.getX()+SnakeHeadImage.getWidth();}
    @Override
   public double getYOpposite(){{return this.getY()+SnakeHeadImage.getHeight();}}
   
   public void TriggerCollision(Collidable OtherObj, String CollisonNature)
    {
        if (CollisonNature == "EatApple")
        {WholeSnake.embiggen();}
        if (CollisonNature == "Autocannibalism")
        {AutoCan = true;}
        //System.out.println("Bang");
    }
   
     @Override
    public boolean getIState()
    {
        return IState;
    }
    
    public void setIState(boolean IState)
    {this.IState = IState;}
    
    public boolean IsOnScreen()
    {
        if
        (
        this.getX() < 640
        && this.getX() > 0
        && this.getY() < 480
        && this.getY() > 0
        )
        {return true;}
        else
        {return false;}
    }

    public boolean isAutoCan() {
        return AutoCan;
    }
    
    
}
