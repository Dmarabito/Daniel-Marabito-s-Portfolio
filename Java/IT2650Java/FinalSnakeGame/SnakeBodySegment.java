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
public class SnakeBodySegment implements Moveable, Collidable {
    private double x,y,TargetX,TargetY;
    private double Speed = 200;
    private static Image BodyImage = new Image( "SnakeBody.png");
    private Moveable PreviousBodyPart;
    private double PreviousX;
    private double PreviousY;
    private boolean IState = false;
    public SnakeBodySegment(double x, double y,Moveable PreviousBodyPart) {
        this.x = x;
        this.y = y;
        this.PreviousBodyPart = PreviousBodyPart;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public Image getBodyImage() {
        return BodyImage;
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
    public void SetTarget() {
        /*
        if (PreviousBodyPart.getLastX() == PreviousBodyPart.getX() && PreviousBodyPart.getLastY() != PreviousBodyPart.getY())
        {
            if (PreviousBodyPart.getX() > PreviousBodyPart.getLastX())
            {
                TargetY = this.getY();
                TargetX = this.getX()+100;
            }
            else if (PreviousBodyPart.getX() < PreviousBodyPart.getLastX())
            {
                TargetY = this.getY();
                TargetX = this.getX()-100;
            }
        }
        else if (PreviousBodyPart.getLastY() == PreviousBodyPart.getY() && PreviousBodyPart.getLastX() == PreviousBodyPart.getX())
        {
            if (PreviousBodyPart.getY() > PreviousBodyPart.getLastY())
            {
                TargetX = this.getX();
                TargetY = this.getY()+100;
            }
            else if (PreviousBodyPart.getY() < PreviousBodyPart.getLastY())
            {
                TargetX = this.getX();
                TargetY = this.getY()-100;
            }
        }
        */
        
        // Works pretty well
        if (Moveable.DistanceBetween(this,PreviousBodyPart)>15)
        {
        TargetX = PreviousBodyPart.getX();
        TargetY = PreviousBodyPart.getY();
        }
        else 
        {
            TargetX = this.getX();
            TargetY = this.getY();
        }
        /*
        if (Math.abs(PreviousBodyPart.getX()-this.getX())>Math.abs(PreviousBodyPart.getY()-this.getY()))
        {
            if (PreviousBodyPart.getX() > this.getX())
            {
                TargetX = this.getX() + 100;
            }
            else if (PreviousBodyPart.getY() > this.getY())
            {
                TargetX = this.getY() + 100;
            }
        }
        else
        {
      
            if (this.getY() > PreviousBodyPart.getY() )
            {
                TargetX = this.getY() - 100;
            }
            else if (this.getX() > PreviousBodyPart.getX() )
            {
                TargetX = this.getX() - 100;
            }
        }
        */
        /*
        System.out.println("("+this.x + ","+this.y+")");
        if (Math.abs(PreviousBodyPart.getX()-this.getX())+Math.abs(PreviousBodyPart.getY()-this.getY())< 50.0)
        {
            TargetX = this.getX();
            TargetY = this.getY();
            System.out.println("Option 1 triggered");
        }
        else if (Math.abs(PreviousBodyPart.getX()-this.getX())< Math.abs(PreviousBodyPart.getY()-this.getY()))
        {
            TargetX = PreviousBodyPart.getX();
            TargetY = this.getY();
            System.out.println("Option 2 triggered");
        }
        else if (Math.abs(PreviousBodyPart.getY()-this.getY())< Math.abs(PreviousBodyPart.getX()-this.getX()))
        {
            TargetX = this.getX();
            TargetY = PreviousBodyPart.getY();
            System.out.println("Option 3 triggered");
        }
        System.out.println("Distance");
        System.out.println(Math.abs(PreviousBodyPart.getX()-this.getX())+Math.abs(PreviousBodyPart.getY()-this.getY()));
        */
    }

    
    @Override
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
   public double getXOpposite(){return this.getX()+BodyImage.getWidth();}
    @Override
   public double getYOpposite(){{return this.getY()+BodyImage.getHeight();}}
   
    @Override
    public void TriggerCollision(Collidable OtherObj, String CollisonNature) {
    System.out.println("Yummy");
    }

    @Override
    public boolean getIState()
    {
        return IState;
    }
    
    public void setIState(boolean IState)
    {this.IState = IState;}
}
