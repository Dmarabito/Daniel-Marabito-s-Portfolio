## IT-2320 - Lab 5

#### Instructions

1. Create a class called student with properties name, major, gpa, and classesTaken (an array of course ids taken, i.e. IT-1025, IT-1050, IT-2310.
    * Include a constructor that accepts and assigns values for all of the properties.
    * Add a method to the class called displayProperties(). In displayProperties, output all of the property values in the class using document.writeln().
    * Create an object with type Student. Using the constructor method, assign values to the properties: name="Your name", major="Your major", gpa=3.0, classes taken=["IT-1025", "IT-2310", "IT-1050"].

2. Create an object (do not create a class for this one) called Course. Important: you should not create a course class. Include the following:
    * Properties and values: courseId="IT-2320", title="IT-2320", crsDesc="Interactive Internet Programming", creditHrs="4"
    * Add a method to the object called displayCourse(). Use the object properties, a loop, or Object.values() along with document.writeln() to display all of the properties for your course object on the page.

3. Create an object called planet. Add properties name=Mercury and diameterMiles=3031.9.
    * On a separate line of code after the object is created, add a property called millMilesFromEarth and assign a value of 48.
    * Output each property value using a document.writeln() and directly accessing the property. For example: document.writeln('Planet Name: ' + planet.name);

4. Create a set called favoriteLanguages. Add the following values to it: "JavaScript", "Python", "Swift", "Dart".
    * Use the following code to output all of the values in favoriteLanguages:
      ```js
      for(let language of favoriteLanguages) {
        console.log(language);
      }
      ```

5. Create a map called creditHrs. Use the map to store course numbers and the corresponding credit hours for each of the following courses: IT-1025: 3, IT-1050:3, IT-2310: 3, IT-2320:4, IT-2030:4, IT-2351:4, IT-2650:4. 
    * Use a get() to find the credit hours for IT-2030. 
    * Use a loop to output all of the values.
