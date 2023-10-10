
package com.mycompany.miniproject1navigation;
import java.util.ArrayList;
import java.util.Scanner;

public class MiniProject1Navigation {

    public static void main(String[] args) {
        System.out.println("Hello World!");
        ArrayList<Location> locations = new ArrayList();

        locations.add(new Location("Cleveland",0,0,true));
        locations.add(new Location("North Pole",500, -100, true));
        locations.add(new Location("Campbell Hill", -50, -50, false));
        locations.add(new Location("Tokyo", -100, 1000, true));
        locations.add(new Location("Chicago", -200, 75,true));
        locations.add(new Location("Erie PA", 150, 0, true));
        locations.add(new Location("Allegheny Nation Forest", 300, -75, false));
        

        
        Vehicle Tardis = new Vehicle(locations.get(0));
        
        System.out.println("Let's build us a Tardis");
        boolean fuelCapacitySet = false;
        while (fuelCapacitySet == false)
        {
            fuelCapacitySet = UserSetMaxCapacity(Tardis);
        }
        Tardis.setCurrentFuel(Tardis.getMaximumFuelCapacity());
        boolean VehicleEfficencySet = false;
        
        while (VehicleEfficencySet == false)
        {
            VehicleEfficencySet = UserSetMPG(Tardis);
        }
        boolean PlayingGame = true;
        Scanner Input = new Scanner(System.in);
        System.out.println("Now that you have a Tardis let's begin");
        while(PlayingGame == true)
        {
            System.out.println("You have "+(Math.round(Tardis.getCurrentFuel()*100)/100.0)+" fuel");
            System.out.println("Would you like to travel or refuel?");
            System.out.println("1: travel");
            System.out.println("2: refuel");
            System.out.println("3: quit");
            String UserInput = Input.nextLine();
            if (UserInput.contains("3") || UserInput.contains("quit"))
            {
                PlayingGame = false;
            } else if(UserInput.contains("2") || UserInput.contains("refuel"))
            {
                if(Tardis.Refuel() == false)
                {
                    System.out.println("There is no fuel");
                }
            } else if(UserInput.contains("1") || UserInput.contains("travel"))
            {
              System.out.println(Tardis.TravelOptions(locations));
              try{
              UserInput = Input.nextLine();
              Location targetLocation = locations.get(Integer.valueOf(UserInput));
              if (Tardis.Travelto(targetLocation))
              {
                  System.out.println("You have arrived in "+Tardis.getLocation().getName());
              }
              else
              {
                  System.out.println("I'm afraid you can't make it there");
              }
              }
              catch(Exception e)
              {
                  System.out.println("hmm didn't work, try something else.");
              }
            }
            
        }
        
    }
    public static boolean UserSetMaxCapacity(Vehicle v)
    {
         Scanner Input = new Scanner(System.in);
          try{
            System.out.println("How much Arton Energy(fuel) can your Tardis hold?");
            v.setMaximumFuelCapacity(Input.nextDouble());
            return true;
        }
        catch(Exception e){
            System.out.println("Come on this is an easy question.");
            return false;
            
        }
    }
    public static boolean UserSetMPG(Vehicle v)
    {
        Scanner Input = new Scanner(System.in);
        try{
            System.out.println("How efficent is your Tardis?");
            v.setMpg(Input.nextDouble());
            return true;
        }
        catch (Exception e)
        {
            System.out.println("Not very efficent are you... Try again.");
            return false;
        }
        
    }

}
