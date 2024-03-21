<html>
  <head>
    <title>Lab 7 - Form Validation</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" type="text/css" href="./styles.css">
  </head>
  <body>
    <h1>Lab 7 - Form Submission</h1>

    <h3>Form Post Results</h3>
    <div style="padding-left:20px;">
    <?php
    $output = "";
    foreach($_POST as $key => $value) {
      $output .= $key . " = " . $value . "<br>";
    }
    if ($output == "") {
      echo "Results will display here when a form is successfully submitted from one of your problems.";
    }
    else {
      echo $output;
    }
    ?>
    </div>

    <h3>Directions</h3>
    <div style="padding-left:20px;">
    <i>Each of the following problems should be completed on the corresponding files. For example, Problem 1 should be completed in the file named problem1.html. Also, the forms should not submit if the input is found to be invalid and a message should be displayed to the user using JavaScript.</i><br><br>
    <a href="problem1.html">Problem 1</a><br>
    Use problem1.html. Check the name input element to make sure that the field is not empty when the form is submitted. If it is empty, use JavaScript to display an error message on the page that says, "Name input is required."<br><br>

    <a href="problem2.html">Problem 2</a><br>
    Add an HTML input element to accept an email address. Develop a JavaScript function that takes an input string (supposedly an email address) as an argument and validates if it conforms to the standard email format. The function should check for the presence of "@" symbol, domain name, and top-level domain (TLD) according to common email address patterns. Call the function to validate a single html form element on the page that allows an email input.
    Example: If the user inputs "example@email" without a valid TLD (e.g., ".com", ".org"), the function should return false indicating an invalid email format.<br><br>
    
    <a href="problem3.html">Problem 3</a><br>Create a HTML form with a password field and implement JavaScript code to ensure that the password meets certain criteria including: 1) At least 8 characters in length, 2) contains 1 of the following characters ! [ ., 3) has at least 1 uppercase 4) has at least 1 lowercase letter, and 5) contains at least 1 numeric digit. If the password does not meet the criteria, display an error message on the page that says, "Password does not meet requirement: " and display the requirement that it doesn't meet.<br><br>
    
    <a href="problem4.html">Problem 4</a><br>Create an HTML form that accepts first name, last name, and select list with favorite programming languages. In the select list, the first option should be "Select a Favorite Language". Make sure that one of the languages, not this option, is selected before submitting the form. Also, make sure that first and last name are not empty.<br><br>
    </div>
  </body>
</html>