
package com.mycompany.miniproject1navigation;
import java.lang.Math;

public class Location {
    private String Name;
    private double x;
    private double y;
    private boolean hasGas;

    public Location(String Name, double x, double y, boolean hasGas) {
        this.Name = Name;
        this.x = x;
        this.y = y;
        this.hasGas = hasGas;
    }

    public boolean HasGas() {
        return hasGas;
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public String getName() {
        return Name;
    }
    
    
    
    public double Distance(Location other){
        // a^2+b^2=c^2
        double a = Math.abs(this.getX() - other.getX());
        double b = Math.abs(this.getY() - other.getY());
        return Math.sqrt(Math.pow(a, 2)+Math.pow(b, 2));
    }
    
    
}
