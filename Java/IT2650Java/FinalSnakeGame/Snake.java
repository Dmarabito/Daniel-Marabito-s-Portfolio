/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.snakegame;

import java.util.ArrayList;
import javafx.scene.image.Image;

/**
 *
 * @author danie
 */
public class Snake {
    private SnakeHead Head;
    private ArrayList<SnakeBodySegment> Body;
    

    public Snake() {
        this.Head = new SnakeHead(100,100,this);
        Body = new ArrayList<SnakeBodySegment>();
        this.Body.add(new SnakeBodySegment(90,100,this.Head));
        this.Body.add(new SnakeBodySegment(80,100,this.getBody().get(0)));
    }


    public SnakeHead getHead() {
        return Head;
    }

    public ArrayList<SnakeBodySegment> getBody() {
        return Body;
    }
    
    public void embiggen()
    {
        this.Body.add(new SnakeBodySegment(Body.get(Body.size()-1).getX(),Body.get(Body.size()-1).getY(),getBody().get(Body.size()-1)));
    }
    
}
