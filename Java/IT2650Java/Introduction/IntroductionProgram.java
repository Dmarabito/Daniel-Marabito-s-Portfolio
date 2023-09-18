/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.introductionprogram;
import java.util.Random;
/**
 *
 * @author Zeus
 */
public class IntroductionProgram {

    public static void main(String[] args) {
        //Your name
        System.out.println("Name: Daniel Marabito");
        //Your major
        System.out.println("Major: Programming and Development");
        //Your class goals
        System.out.println("Class Goals: To have fun and learn something.");
        //One or two post degree goals
        System.out.println("Post Degree Goals: To get a good paying job that I enjoy.");
        System.out.println("");
        
        //Fun time
        
        System.out.println("Now for a fake answers");
        //First Name
        String[] FirstName = new String[6];
        FirstName[0] = "Adam";
        FirstName[1] = "Alice";
        FirstName[2] = "Ben";
        FirstName[3] = "Beth";
        FirstName[4] = "Chris";
        FirstName[5] = "Casey";
        
        //Last Name
        String[] LastName = new String[5];
        LastName[0] = "Anderson";
        LastName[1] = "Brown";
        LastName[2] = "Carter";
        LastName[3] = "Davis";
        LastName[4] = "Edwards";
        System.out.println("Name: "+Choice(FirstName)+" "+Choice(LastName));
        
        //Major
        String[] Major = new String[4];
        Major[0] = "Arts";
        Major[1] = "Business";
        Major[2] = "Criminal Justice";
        Major[3] = "Earth Science";
        System.out.println("Major: "+Choice(Major));
        
        //Class goals
        String[] ClassGoal = new String[4];
        ClassGoal[0] = "to depict human sadness as a 2D array of colors.";
        ClassGoal[1] = "to develop the means to monetize the work of others on a global scale.";
        ClassGoal[2] = "to write an algorithm that predicts criminal behavior prior to criminal acts.";
        ClassGoal[3] = "to model the flow of plastic in the ocean.";
        System.out.println("My goal for this class is "+Choice(ClassGoal));
        
        // Post Degree goals
        String[] PostDegreeGoals = new String[4];
        PostDegreeGoals[0] = "to work in the film industry, doing CGI.";
        PostDegreeGoals[1] = "to work on addictive mobile games with lootbox mechanics.";
        PostDegreeGoals[2] = "to become a prosecutor and get the highest conviction rate.";
        PostDegreeGoals[3] = "to reduce C02 emissions.";
        System.out.println("My goal after I get my degree is "+Choice(PostDegreeGoals));
        
    }
    public static String Choice(String[] possibilies)
    {
        //chooses random item from string list.
        int NumberOfPossibilites = possibilies.length;
        Random Randy = new Random();
        int ChoiceNumber = Randy.nextInt(NumberOfPossibilites);
        String Chosen = possibilies[ChoiceNumber];
        return Chosen;
    }
}
