<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Semester</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-top: 20px;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: 20px auto;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
        }
        input[type="text"],
        input[type="date"] {
            width: calc(100% - 22px); /* Subtract padding and border width */
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
<h2>Add Semester</h2>
<form id="addSemesterForm" action="saveSemester" method="post" onsubmit="return onSubmit()">
    <input type="hidden" name="action" value="add">
    <label for="semester_name">Name:</label>
    <input type="text" id="semester_name" name="semester_name" required><br>
    <label for="starting_date">Starting Date:</label>
    <input type="date" id="starting_date" name="starting_date" required><br>
    <label for="end_date">End Date:</label>
    <input type="date" id="end_date" name="end_date" required><br>
    <!-- Add other fields as needed -->
    <input type="submit" value="Add Semester">
</form>

<script>
    function onSubmit() {
        // Perform any additional validation here if needed

        // Show an alert when the form is submitted successfully
        alert("Semester added successfully!");
        return true; // Returning true allows the form submission to proceed
    }
</script>
</body>
</html>
