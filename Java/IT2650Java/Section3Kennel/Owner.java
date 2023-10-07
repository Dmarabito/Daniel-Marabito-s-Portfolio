
package com.mycompany.section3kennel;

public class Owner {
    private String name;
    private String streetAddress;
    private String city;
    private String state;
    

    public Owner(String name, String streetAddress, String city, String state) {
        this.name = name;
        this.streetAddress = streetAddress;
        this.city = city;
        this.state = state;
    }

    public String getName() {
        return name;
    }

    public String getStreetAddress() {
        return streetAddress;
    }
   
    
}
