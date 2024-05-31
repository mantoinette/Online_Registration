<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Semesters</title>
</head>
<body>
<h2>Semesters</h2>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Starting Date</th>
        <th>End Date</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="semester" items="${requestScope.semesters}">
        <tr>
            <td>${semester.semester_id}</td>
            <td>${semester.semester_name}</td>
            <td>${semester.starting_date}</td>
            <td>${semester.end_date}</td>
            <td>
                <a href="SemesterServlet?action=delete&semester_id=${semester.semester_id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<h2>Add Semester</h2>
<form action="SemesterServlet" method="post">
    <label for="semester_name">Name:</label>
    <input type="text" id="semester_name" name="semester_name" required><br>
    <!-- Add other fields as needed -->
    <input type="submit" value="Add Semester">
</form>
</body>
</html>
