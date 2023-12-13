/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.snakegame;

/**
 *
 * @author danie
 */
public interface Moveable {
    static public void Move(Moveable MoveingObject) 
    {
        MoveingObject.SetTarget();
        MoveingObject.SetLastX(MoveingObject.getX());
        MoveingObject.SetLastY(MoveingObject.getY());
        double Xmag = MoveingObject.getTargetX()-MoveingObject.getX();
        double XSign;
        double YSign;
        double Ymag = MoveingObject.getTargetY()-MoveingObject.getY();
        if (Xmag > 0) {XSign = 1;} else if (Xmag < 0) {XSign = -1;} else {XSign =0;}
        if (Ymag > 0) {YSign = 1;} else if (Ymag < 0) {YSign = -1;} else {YSign =0;}
        //System.out.println(TimeMaster.getSecsSinceLastFrame());
        if (MoveingObject.getX() != MoveingObject.getTargetX() || MoveingObject.getY() != MoveingObject.getTargetY())
        {
            if (Math.abs(Xmag)>Math.abs(Ymag))
            {
                MoveingObject.setX((MoveingObject.getX() + (1*XSign*MoveingObject.getSpeed()*TimeMaster.getSecsSinceLastFrame())));
            }
            else if (Math.abs(Ymag)>Math.abs(Xmag))
            {
                MoveingObject.setY((MoveingObject.getY() + (1*YSign*MoveingObject.getSpeed()*TimeMaster.getSecsSinceLastFrame())));
            }
        }
        
        //System.out.println("x: " + Xmag);
        //System.out.println("y: "+Ymag);
        /*
        if(Math.abs((MoveingObject.getX()- MoveingObject.getTargetX()))<= Math.abs(MoveingObject.getY()- MoveingObject.getTargetY()))
        {
        MoveingObject.setX(MoveingObject.getX()+1);
        }
        */
    }
    
    static public double DistanceBetween(Moveable obj1, Moveable obj2)
    {
        return Math.sqrt(Math.pow(obj2.getX()-obj1.getX(), 2)+Math.pow(obj2.getY()-obj1.getY(), 2));
    }
    
    abstract public double getX();
    abstract public double getY();
    abstract public void setX(double x);
    abstract public void setY(double y);
    abstract public double getTargetX();
    abstract public double getTargetY();
    abstract public void SetTarget();
    abstract public double getSpeed();
    abstract public void SetLastX(double x);
    abstract public void SetLastY(double y);
    abstract public double getLastX();
    abstract public double getLastY();
}
