<%@ page import="java.util.List" %>
<%@ page import="model.Students" %>
<%@ page import="dao.StudentsDao" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Update Student</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .container {
      background-color: #fff;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      padding: 30px;
      max-width: 400px;
      width: 100%;
      text-align: center;
    }
    h2 {
      color: #333;
      margin-bottom: 20px;
    }
    form {
      margin-top: 20px;
    }
    label {
      display: block;
      color: #555;
      margin-bottom: 10px;
    }
    input[type="text"],
    input[type="date"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-sizing: border-box;
      margin-bottom: 15px;
    }
    input[type="submit"] {
      background-color: #007bff;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
      width: 100%;
    }
    input[type="submit"]:hover {
      background-color: #0056b3;
    }
    .message {
      margin-top: 20px;
      padding: 10px;
      background-color: #28a745;
      color: #fff;
      border-radius: 5px;
    }
  </style>
</head>
<body>

<div class="container">
  <h2>Update Student</h2>
  <%-- Display message if present --%>
  <% String message = (String) request.getAttribute("message");
    if (message != null && !message.isEmpty()) { %>
  <div class="message"><%= message %></div>
  <% } %>
  <%
    // Retrieve student ID from query parameter
    int studentId = 0;
    String studentIdParam = request.getParameter("studentId");
    if (studentIdParam != null) {
      studentId = Integer.parseInt(studentIdParam);

      // Retrieve student information by ID and prepopulate form fields
      StudentsDao dao = new StudentsDao();
      Students student = dao.getStudentById(studentId);
      if (student != null) {
  %>
  <form action="UpdateServlet" method="post">
    <input type="hidden" id="studentId" name="studentId" value="<%= student.getStudent_id() %>">
    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" value="<%= student.getFirst_name() %>">
    <br>
    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" value="<%= student.getLast_name() %>">
    <br>
    <label for="dateofbirth">Date of Birth:</label><br>
    <input type="date" id="dateofbirth" name="dateofbirth" value="<%= student.getDate_of_birth() %>"><br>
    <br>
    <input type="submit" value="Update">
  </form>
  <%
      }
    }
  %>
</div>

</body>
</html>
