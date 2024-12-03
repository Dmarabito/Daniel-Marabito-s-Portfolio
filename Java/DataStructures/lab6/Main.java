class Main {
  public static void main(String[] args) {
    // Use the instructions in Blackboard or instructions.md to complete Lab 6
    var creditHours =  new MyHashMap<>();
    creditHours.put("IT-1025", 3);
    creditHours.put("IT-1050", 3);
    creditHours.put("IT-1150", 3);
    creditHours.put("IT-2310", 3);
    creditHours.put("IT-2320", 4);
    creditHours.put("IT-2351", 4);
    creditHours.put("IT-2650", 4);
    creditHours.put("IT-2660", 4);
    creditHours.put("IT-2030", 4);
    System.out.print("IT-1025? "); System.out.println(creditHours.containsKey("IT-1025"));
    System.out.print("IT-2110? "); System.out.println(creditHours.containsKey("IT-2110"));
    
    //System.out.println(creditHours.values());
/*      for (Object e : creditHours.keySet()) {
      System.out.print(e+" : ");
      System.out.println(creditHours.get(e));
    } */
System.out.println(creditHours);

    System.out.println("");
   creditHours.remove("IT-2030");
   creditHours.remove("IT-1150");

    //System.out.println(creditHours.values());

/*      for (Object e : creditHours.keySet()) {
      System.out.print(e+" : ");
      System.out.println(creditHours.get(e));
    }  */
  System.out.println(creditHours);
  }
}