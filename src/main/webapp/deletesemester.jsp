<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Semester</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
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
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: 20px auto;
        }
        label {
            display: block;
            margin-bottom: 10px;
            color: #333;
            font-weight: bold;
        }
        input[type="number"] {
            width: calc(100% - 22px); /* Subtract padding and border width */
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #ff0000;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            margin-top: 20px;
        }
        input[type="submit"]:hover {
            background-color: #cc0000;
        }
    </style>
</head>
<body>
<h2>Delete Semester</h2>
<form id="deleteSemesterForm" action="deleteSemester" method="post" onsubmit="return onSubmit()">
    <label for="semester_id">Semester ID:</label>
    <input type="number" id="semester_id" name="semester_id" required><br>
    <!-- Add other fields as needed -->
    <input type="submit" value="Delete Semester">
</form>

<script>
    function onSubmit() {
        // Show an alert when the form is submitted successfully
        alert("Semester deleted successfully!");
        return true; // Returning true allows the form submission to proceed
    }
</script>
</body>
</html>
