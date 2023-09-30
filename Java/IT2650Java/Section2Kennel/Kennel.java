package com.profo.kennel;

public class Kennel {

    public static void main(String[] args) {
        /*
        Dog class
        1. A basic constructor method that supplies values to the 4 properties. [done]
        2. A poop method that accepts a double as a parameter and subtracts a dog object's weight by that amount. [done]
        3. A speak method that returns either "Yip yip", "Bark", or "Woof" as a string based on the weight of the dog object. [done
        
        Kennel Main
        1. Create three dog objects as specified in the comments of the program. [done]
        2. Have each dog speak and output the results. [done]
        3. Have the first dog poop 5 and the third dog eat 10. [done]
        4. Have each dog speak again. [done]
        Once completed, zip and upload the finished project to BlackBoard.
        */
        
        //Complete the Dog class before finishing these tasks.
        
        //Create three dog objects.
        //You can give them and name, owner, and address that you would like.
        //For weight, start with one dog that weight 28, one that weights 35, and one that weights 49.
        Dog Peggy = new Dog("Peggy", 28,"Daniel","123 baahaa");
        Dog Pam = new Dog("Pam", 35,"Daniel","1234 Pondshop");
        Dog Porky = new Dog("Porky Notadog", 49,"Daniel","1234 Pigsty");
        
        
        
        //After creating the three dogs, have each dog speak and output the resulting strings here.
        System.out.println(Peggy.speak());
        System.out.println(Pam.speak());
        System.out.println(Porky.speak());
        
        
        
        //Then, have the first dog poop an amount of 5,
        //and have the third dog eat an amount of 10.
        Peggy.poop(5.0);
        Porky.eat(10.0);
        
        
        //Finally, have each dog speak again.
        System.out.println(Peggy.speak());
        System.out.println(Pam.speak());
        System.out.println(Porky.speak());
    }
}
