<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Teacher</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h2 {
            color: #333;
            text-align: center; /* Center the heading */
            margin-top: 20px; /* Add margin to the top */
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: 20px auto;
        }
        input[type="text"],
        select {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: dodgerblue;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #0073e6;
        }
    </style>
</head>
<body>
<h2>Add Teacher</h2>
<form action="addTeacher" method="post" onsubmit="return onSubmit()">
    First Name: <input type="text" name="firstName" required><br> <!-- Adding 'required' attribute for mandatory fields -->
    Last Name: <input type="text" name="lastName" required><br> <!-- Adding 'required' attribute for mandatory fields -->
    Qualification:
    <select name="qualification" required> <!-- Adding 'required' attribute for mandatory fields -->
        <option value="BACHELOR">Bachelor</option>
        <option value="MASTER">Master</option>
        <option value="PHD">PhD</option>
    </select><br>
    Course ID: <input type="text" name="courseId" required><br> <!-- Adding 'required' attribute for mandatory fields -->
    <input type="submit" value="Submit">
</form>

<script>
    function onSubmit() {
        // You may add more validation here if needed
        // For example, checking if the course ID is a valid number
        // If validation fails, return false to prevent form submission

        // Show an alert when the form is submitted successfully
        alert("Teacher added successfully!");
        return true; // Returning true allows the form submission to proceed
    }
</script>
</body>
</html>
