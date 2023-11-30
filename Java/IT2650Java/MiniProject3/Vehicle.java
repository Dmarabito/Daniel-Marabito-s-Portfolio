
package com.mycompany.miniproject3navigatiofxwithsave;

import java.util.ArrayList;

public class Vehicle {
    private Location location;
    private double maximumFuelCapacity;
    private double currentFuel;
    private double mpg;

    public Vehicle(Location location, double maximumFuelCapacity, double currentFuel, double mpg) {
        this.location = location;
        this.maximumFuelCapacity = maximumFuelCapacity;
        this.currentFuel = currentFuel;
        this.mpg = mpg;
    }
    
    public Vehicle(Location location) {
        this.location = location;
    }

    public double getCurrentFuel() {
        return currentFuel;
    }

    public void setCurrentFuel(double currentFuel) {
        this.currentFuel = currentFuel;
    }

    
    
    public void setMaximumFuelCapacity(double maximumFuelCapacity) {
        this.maximumFuelCapacity = maximumFuelCapacity;
    }

    public void setMpg(double mpg) {
        this.mpg = mpg;
    }

    public double getMpg() {
        return mpg;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public Location getLocation() {
        return location;
    }

    
    
    
    public double getMaximumFuelCapacity() {
        return maximumFuelCapacity;
    }
    
    
    
    public boolean Refuel(double amount){
        
        if (this.location.HasGas())
        {
        this.setCurrentFuel(amount);
            return true;
        }
        else
        {
            return false;
        }
    }
    
    public boolean Refuel(){
        return this.Refuel(this.getMaximumFuelCapacity());
    }
    
    public double DistanceCan0Travel()
    {
        return this.getCurrentFuel()*this.getMpg();
    }
    
    public double fuelCost(double Distance)
    {
        return Distance/this.getMpg();
    }
    
    public boolean Travelto(Location l)
    {
        if (this.location.Distance(l)>this.DistanceCan0Travel())
        {
            return false;
        }
        else
        {
            this.setCurrentFuel(currentFuel-this.fuelCost(this.location.Distance(l)));
            this.setLocation(l);
            return true;
        }
        
    }
    
    public String TravelOptions(ArrayList<Location> lList)
    {
        String Output = "";
        for(int i=0;i<lList.size();i++)
        {
            Output += Integer.toString(i) + ") " + lList.get(i).getName()+" miles: "+Math.round(this.location.Distance(lList.get(i))*100)/100.0+"\n";
        }
        return Output;
    }
    
}
