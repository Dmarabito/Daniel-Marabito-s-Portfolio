
package com.mycompany.section3kennel;


public class Section3Kennel {

    public static void main(String[] args) {
        Owner Daniel = new Owner("Daniel","123 baahaa", "Medina", "Ohio");
        Owner Ashly = new Owner ("Ashly","4444 goopsburg","Akron","Ohio");
        Dog Peggy = new Dog("Peggy", 28,Daniel);
        Dog Pam = new Dog("Pam", 35,Daniel);
        Dog Porky = new Dog("Porky Notadog", 49,Ashly);
        System.out.println(Peggy.speak());
        System.out.println(Pam.speak());
        System.out.println(Porky.speak());
        Peggy.poop(5.0);
        Porky.eat(10.0);
        System.out.println(Peggy.speak());
        System.out.println(Pam.speak());
        System.out.println(Porky.speak());
        System.out.println(Peggy);
        System.out.println(Pam);
        System.out.println(Porky);
        
    }
}
