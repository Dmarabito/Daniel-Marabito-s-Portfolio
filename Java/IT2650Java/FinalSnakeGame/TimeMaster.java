/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.snakegame;

/**
 *
 * @author danie
 */
public class TimeMaster {
    static private long startTime;
    static private long CurrentTime;
    static private long TimeSinceLastFrame;
    static private long LastTime;
    static private double SecsSinceLastFrame;

    public static void setStartTime() {
        TimeMaster.startTime = System.nanoTime();
        TimeMaster.CurrentTime = TimeMaster.startTime;
    }

    public static double getSecsSinceLastFrame() {
        return SecsSinceLastFrame;
    }
    
    public static void MarkTime()
    {
        TimeMaster.LastTime = TimeMaster.CurrentTime;
        TimeMaster.CurrentTime = System.nanoTime();
        TimeMaster.TimeSinceLastFrame = TimeMaster.CurrentTime - TimeMaster.LastTime;
        //System.out.println("Current time - last time");
        //System.out.println((TimeMaster.CurrentTime - TimeMaster.LastTime)/1000000000);
        TimeMaster.SecsSinceLastFrame = TimeMaster.TimeSinceLastFrame / 1000000000.0;
    }
    
}
