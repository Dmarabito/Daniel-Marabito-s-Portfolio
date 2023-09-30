package com.profo.kennel;

public class Dog {
    
    private String name;
    private double weight;
    private String owner;
    private String address;

    //Add a constructor method that assigns values to all properties

    public Dog(String name, double weight, String owner, String address) {
        this.name = name;
        this.weight = weight;
        this.owner = owner;
        this.address = address;
    }
    
    
    public void eat(double amount){
        weight += amount;
    }

    //Create a 'poop' method that takes and amount at a parameter
    //And subtracts that amount from the weight property
    
    public void poop (double amount){
        weight -= amount;
    }
    

    //Create a 'speak' method that returns
    //"Yip yip!" if the object's weight is less than 25
    //"Bark!" if the object's weight is between 25 and 50
    //"WOOF!!!" if the object's weight is over 50
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
        // Considered having it return "Oink" instead
            return "WOOF!!!";
        }
        return "Weightless dog????";
    }
    
}
