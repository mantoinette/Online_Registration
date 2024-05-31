<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error 500</title>
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
        p {
            color: #333;
            font-size: 18px;
            text-align: center;
            padding: 20px;
            border: 2px solid #e74c3c;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 400px;
        }
    </style>
</head>
<body>
<p>Internal server error: <%= request.getAttribute("errorMessage") %></p>
</body>
</html>
