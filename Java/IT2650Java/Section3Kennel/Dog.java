
package com.mycompany.section3kennel;


public class Dog {
    
    private String name;
    private double weight;
    private Owner owner;

    public Dog(String name, double weight, Owner owner) {
        this.name = name;
        this.weight = weight;
        this.owner = owner;

    }
    
    
    public void eat(double amount){
        weight += amount;
    }

    
    public void poop (double amount){
        weight -= amount;
    }
    
    public String speak()
    {
        if (weight<25)
        {
            return "Yip yip!";
        }
        else if (weight>=25 && weight<=50)
        {
            return "Bark!";
        }
        else if (weight>50)
        {
            return "WOOF!!!";
        }
        return "Weightless dog????";
    }
    
    public String getOwnersName () 
    {
        return this.owner.getName();
    }

    @Override
    public String toString() {
        return this.name +" "+this.owner.getStreetAddress();
    }
    
    
    
}
