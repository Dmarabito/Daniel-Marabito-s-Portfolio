/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.snakegame;

import java.util.Random;
import javafx.scene.canvas.Canvas;
import javafx.scene.image.Image;

/**
 *
 * @author danie
 */
public class Food implements Collidable {
    private double x,y;
    private Image foodPic = new Image( "Apple.png");
    private Random Randy = new Random();
    private boolean IState = false;
    private Canvas cany;
    
    @Override
    public double getX() {
        return x;
    }

    @Override
    public double getY() {
        return y;
    }

    public void setX(double x) {
        this.x = x;
    }

    public void setY(double y) {
        this.y = y;
    }
    
    public double getXOpposite(){return this.getX()+foodPic.getWidth();}
    public double getYOpposite(){{return this.getY()+foodPic.getHeight();}}

    public Image getFoodPic() {
        return foodPic;
    }

    public Food(double x, double y,Canvas cany) {
        this.x = x;
        this.y = y;
        this.cany = cany;
    }
    
    public void TriggerCollision(Collidable OtherObj, String CollisonNature)
    {
        System.out.println("Bang");
        if (CollisonNature == "EatApple")
        {RandomizePosition();}
    }
    
    public void RandomizePosition()
    {
        
        this.setX(Randy.nextInt((int)(cany.getWidth()*0.8)));
        this.setY(Randy.nextInt((int)(cany.getHeight()*0.8)));
    }

    
    @Override
    public boolean getIState()
    {
        return IState;
    }
    
    public void setIState(boolean IState)
    {this.IState = IState;}
}
