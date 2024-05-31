<html>
<head>
    <title>Title</title>
    <style>
        /* Container style */
        .nav-container {
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            overflow: hidden;
        }
        /* Link style */
        .nav-link {
            display: block;
            padding: 5px 10px; /* Adjust padding as needed */
            text-decoration: none;
            color: white;
            background-color: dodgerblue;
            transition: background-color 0.3s ease;
            line-height: 1; /* Adjust line-height to make the text closer to the borders */
        }
        /* Link hover effect */
        .nav-link:hover {
            background-color: #1B3058;
        }
    </style>

</head>
<body>
<h1>admin dashbord</h1>
<div class="nav-container">
    <a href="students_form.jsp" class="nav-link">STUDENTS FORM</a>
</div>
<div class="nav-container">
    <a href="addsemester.jsp" class="nav-link">ADD SEMESTER</a>
</div>
<div class="nav-container">
    <a href="updatesemester.jsp" class="nav-link">UPDATE SEMESTER</a>
</div>
<div class="nav-container">
    <a href="deletesemester.jsp" class="nav-link">DELETE SEMESTER</a>
</div>
<div class="nav-container">
    <a href="addcourses.jsp" class="nav-link">ADD COURSES</a>
</div>
<div class="nav-container">
    <a href="addteacher.jsp" class="nav-link">ADD TEACHER</a>
</div>
<!-- Add more links for other pages if needed -->
</body>
</html>
