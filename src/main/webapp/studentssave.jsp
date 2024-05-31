<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management System</title>
</head>
<body>
<h2>Student Management System</h2>

<!-- Add unique ID to the form -->
<form id="saveStudentForm" action="StudentsSaveServlet" method="post">
    <label for="id">Student ID:</label><br>
    <input type="text" id="id" name="id"><br>

    <label for="firstname">First Name:</label><br>
    <input type="text" id="firstname" name="firstname"><br>

    <label for="lastname">Last Name:</label><br>
    <input type="text" id="lastname" name="lastname"><br>

    <label for="dateofbirth">Date of Birth:</label><br>
    <input type="date" id="dateofbirth" name="dateofbirth"><br>

    <input type="submit" value="Save">
</form>

</body>
</html>
