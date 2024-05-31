<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Course</title>
</head>
<body>
<h2>Add Course</h2>
<form id="courseForm" action="AddCourseServlet" method="post">
    <label for="courseCode">Course Code:</label>
    <input type="text" id="courseCode" name="courseCode" required><br><br>
    <label for="courseName">Course Name:</label>
    <input type="text" id="courseName" name="courseName" required><br><br>
    <button type="submit">Submit</button>
</form>
<script>
    // JavaScript to show alert after successful submission
    const form = document.getElementById('courseForm');
    form.addEventListener('submit', function(event) {
        event.preventDefault();
        fetch(this.action, {
            method: this.method,
            body: new FormData(this)
        })
            .then(response => {
                if (response.ok) {
                    alert("Course added successfully!");
                    this.reset();
                } else {
                    alert("Failed to add course. Please try again.");
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("An error occurred. Please try again later.");
            });
    });
</script>
</body>
</html>
