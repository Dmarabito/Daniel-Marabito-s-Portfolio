/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.mycompany.snakegame;

/**
 *
 * @author danie
 */
public interface Collidable {
    static void detectCollision(Collidable Obj1, Collidable Obj2, String CollisonNature)
    {
        if (Obj1.getIState() == false && Obj2.getIState() == false )
        {
            if(Obj1.getX() <= Obj2.getXOpposite() && Obj1.getXOpposite() >= Obj2.getX() && Obj1.getY() <= Obj2.getYOpposite() && Obj1.getYOpposite() >= Obj2.getY())
            {
                Obj1.setIState(true);
                Obj2.setIState(true);
                Obj1.TriggerCollision(Obj2,CollisonNature);
                Obj2.TriggerCollision(Obj1,CollisonNature);
                Obj1.setIState(false);
                Obj2.setIState(false);
            }
        }
    }
    abstract double getX();
    abstract double getY();
    abstract double getXOpposite();
    abstract double getYOpposite();
    abstract void TriggerCollision(Collidable OtherObj,String CollisonNature);
    abstract boolean getIState();
    abstract void setIState(boolean IState);
}
