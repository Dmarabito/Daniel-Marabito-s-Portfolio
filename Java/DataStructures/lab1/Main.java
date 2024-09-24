
/*
 * IT-2660 - Lab 1
 * Student Name: 
 */

/*
Tasks: In Lab 1 (attached), add the following methods to the already created Lab1 class:
max(int a, int b): Use an if-statement to return the maximum value. [done]
min(int a, int b): Use an if-statement to return the minimum value.[done]
sum(int[] nums): Return the sum of all values in the array. [done]
average(int[] nums): Use a foreach loop to return the average. [done]
max(int[] nums): Use a for loop to return the maximum value. [done]
min(int[] nums): Use a for loop to return the minimum value. [done]
*/

/*Create an array with values {5, 9, 3, 12, 7, 3, 11, 5}. [done]
Output the array in order using a while loop. [done]
Output the array in reverse using a for loop. [done]
Output the first and last values of the array. [done]
Call the methods created in Lab1. [done]*/

public class Main {
  public static void main(String[] args) {
    System.out.println("hello, world!");

    Lab1 lab = new Lab1();
    System.out.println(lab.increment(1));
    int[] TheFancyArray ={5, 9, 3, 12, 7, 3, 11, 5};
    int Whilei = 0;
    //System.out.println("pre forward");
    while(Whilei<TheFancyArray.length){System.out.println(TheFancyArray[Whilei]);Whilei++;}
    //System.out.println("Pre reverse");
    for (int i = TheFancyArray.length-1;i>=0;i--) {System.out.println(TheFancyArray[i]);}
    //System.out.println("First & last");
    System.out.println(TheFancyArray[0]);
    System.out.println(TheFancyArray[TheFancyArray.length-1]);

    //System.out.println("Testing created methods");
    //System.out.println("Max int");
    System.out.println(lab.max(12,5));
    //System.out.println("Min int");
    System.out.println(lab.min(12,5));
    //System.out.println("Sum");
    System.out.println(lab.sum(TheFancyArray));
    //System.out.println("Average");
    System.out.println(lab.average(TheFancyArray));
    //System.out.println("Max Array");
    System.out.println(lab.max(TheFancyArray));
    //System.out.println("Min array");
    System.out.println(lab.min(TheFancyArray));
  }
  
}     

// Add all of the methods here
class Lab1 {
  public int increment(int num) {
    return ++num;
  }
  
  public int max(int a, int b){
  if (a>b){return a;} else if (b>a){return b;} else {return a;}
  }

public int max(int[] nums){
  int currentValue = nums[0];
  for(int i = 1; i<nums.length;i++){
    if (nums[i]>currentValue){currentValue=nums[i];}
  }
  return currentValue;
}

  public int min(int a, int b){
  if (a<b){return a;} else if (b<a){return b;} else {return a;}
  }

public int min(int[] nums){
  int currentValue = nums[0];
  for(int i = 1; i<nums.length;i++){
    if (nums[i]<currentValue){currentValue=nums[i];}
  }
  return currentValue;
}

  public int sum(int[] nums){
    int subTotal = 0;
    for (int i = 0; i < nums.length; i++) {
      subTotal += nums[i];
    }
    return subTotal;
  }
  public double average (int[] nums){
    int subTotal = 0;
    for(int i : nums){subTotal += i;}
    return ((double)subTotal/(double)nums.length);
  }
}