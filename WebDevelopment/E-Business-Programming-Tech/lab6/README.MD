# So this lesson was focused on form validation in php.

# Here are the requirements
The attached file is an HTML form with six fields on it. You will write PHP code to check the form is filled out correctly and check there is no malicious code entered.
The form should submit to itself, that is, the form tag will use $_SERVER["PHP_SELF"]. The form will submit using the POST method.  You will need to fill in the rest of the form tag.
The form tag should also be set up so it converts any special HTML characters entered into the browser's URL. (htmlspecialchars)
All fields except Comments are required. If a field is left blank, display the message "Field is required" in red to the right of the field.
The first name and last name should only have characters or white space allowed.  If any bad characters are entered, display the message "Only letters and white space allowed" in red to the right of the field.
All fields should be checked for special characters (htmlspecialchars), back slashes (stripslashes) and trimmed (trimmed) of any extra spaces.
If there is an error, then the user can correct the errors and submit the form again.  
If there are no errors display the entered values in the area at the bottom of the page.
Name your file lastname-lab6.html and submit it to this page.
