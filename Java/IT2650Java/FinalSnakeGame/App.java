package com.mycompany.snakegame;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Random;
import javafx.animation.AnimationTimer;
import javafx.application.Application;
import javafx.event.EventHandler;
import javafx.scene.Group;
import javafx.scene.Scene;
import javafx.scene.canvas.Canvas;
import javafx.scene.canvas.GraphicsContext;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.input.KeyEvent;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;


/**
 * JavaFX App
 */
public class App extends Application {
    Boolean GameOver = false;
    ArrayList <Integer> Scores = new ArrayList<Integer>();
    Boolean SaveMade = false;

    @Override
    public void start(Stage stage) {
        Snake slithers = new Snake();
        Random Randy = new Random();
        
        Image Background = new Image("BlankBackground.png");
        Image GameOverImage = new Image("GameOver.png");
        
        Group root = new Group();
        Scene scene = new Scene(root, 640, 480);
        Canvas canvas = new Canvas( 640, 480 );
        Food Apple = new Food(Randy.nextInt((int)(canvas.getWidth()*0.8)),Randy.nextInt((int)(canvas.getHeight()*0.8)),canvas);
        root.getChildren().add( canvas );
        GraphicsContext GraphicContext = canvas.getGraphicsContext2D();
        TimeMaster.setStartTime();
        scene.setOnKeyPressed(new EventHandler<KeyEvent>(){
        public void handle(KeyEvent e)
        {
            //System.out.println(e.getCode().toString());
            slithers.getHead().setHeader(e.getCode().toString());
        }
        });
         new AnimationTimer()
         {
            @Override
            public void handle(long currentNanoTime) 
            {
                TimeMaster.MarkTime();
                
                // Plan Check Collision Here
                Collidable.detectCollision(slithers.getHead(), Apple,"EatApple");
                for (int i=3; i <slithers.getBody().size();i++)
                {
                    Collidable.detectCollision(slithers.getHead(), slithers.getBody().get(i),"Autocannibalism");
                }
                if (slithers.getHead().isAutoCan() == true)
                {GameOver = true;}
                if (slithers.getHead().IsOnScreen() == false){GameOver = true;}
                
                // Move here
                Moveable.Move(slithers.getHead());
                for (int i=0; i< slithers.getBody().size();i++)
                {
                    Moveable.Move(slithers.getBody().get(i));
                    //System.out.println("Snake Part number "+i+" is at" + "("+slithers.getBody().get(i).getX()+","+slithers.getBody().get(i).getY()+")");
                }
                
                // Depict it
                // Need to add a image to clear it.
                if (GameOver == false)
                {
                    GraphicContext.drawImage(Background, 0, 0);
                    GraphicContext.drawImage(Apple.getFoodPic(), Apple.getX(), Apple.getY());
                    for (int i=0; i < slithers.getBody().size(); i++)
                    {
                        GraphicContext.drawImage(slithers.getBody().get(i).getBodyImage(),slithers.getBody().get(i).getX(),slithers.getBody().get(i).getY());
                    }
                    GraphicContext.drawImage(slithers.getHead().getSnakeHeadImage(),slithers.getHead().getX(), slithers.getHead().getY());
                }
                else
                {
                    GraphicContext.drawImage(Background, 0, 0);
                    GraphicContext.drawImage(GameOverImage, -100, -300);
                    if (SaveMade==false)
                    {
                        Scores = LoadScore ();
                        Scores.add(slithers.getBody().size());
                        SaveScore(Scores);
                        SaveMade = true;
                    }
                    GraphicContext.fillText(Integer.toString(slithers.getBody().size()), 300, 350);
                    GraphicContext.fillText("High Score: "+Integer.toString(MaxScore(Scores)), 300, 400);
                    
                    
                }
            }
         }.start();
        stage.setScene(scene);
        stage.show();
    }
    
    public static void SaveScore(ArrayList<Integer> Scores)
    {
        try{
        FileWriter Writes = new FileWriter("HighScores.csv");
        for (int i = 0; i< Scores.size();i++)
        {
            Writes.write(Scores.get(i)+",");
        }
        Writes.close();
        }
        catch (Exception e) {
        System.out.println("Write Failed");
        }
    }
    
    public ArrayList<Integer> LoadScore ()
     {
         ArrayList<Integer> LoadScore = new ArrayList<Integer>();
         try
         {
         File FileObj = new File("HighScores.csv");
         FileReader Reader = new FileReader(FileObj);
         BufferedReader Buff = new BufferedReader(Reader);
         String Content;
         if ((Content = Buff.readLine()) != null)
         {
            for (int i=0;i<Content.split(",").length;i++)
            {LoadScore.add(Integer.parseInt(Content.split(",")[i]));}
            Buff.close();
            return LoadScore;
         }
         else{return LoadScore;}
         }
         catch(Exception e)
         {return LoadScore;}
     }

    public int MaxScore(ArrayList<Integer> Scores)
    {
        int TopScore = 0;
        for (int i = 0; i<Scores.size();i++)
        {
            if (TopScore < Scores.get(i)){TopScore = Scores.get(i);}
        }
        return TopScore;
    }
    
    public static void main(String[] args) {
        launch();
    }

}