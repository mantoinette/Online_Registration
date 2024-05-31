<%--&lt;%&ndash;<!DOCTYPE html>&ndash;%&gt;--%>
<%--&lt;%&ndash;<html lang="en">&ndash;%&gt;--%>
<%--&lt;%&ndash;<head>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <meta charset="UTF-8">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <meta name="viewport" content="width=device-width, initial-scale=1.0">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <title>Student Management System</title>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <style>&ndash;%&gt;--%>
<%--&lt;%&ndash;        table {&ndash;%&gt;--%>
<%--&lt;%&ndash;            border-collapse: collapse;&ndash;%&gt;--%>
<%--&lt;%&ndash;            width: 100%;&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;        th, td {&ndash;%&gt;--%>
<%--&lt;%&ndash;            border: 1px solid #dddddd;&ndash;%&gt;--%>
<%--&lt;%&ndash;            text-align: left;&ndash;%&gt;--%>
<%--&lt;%&ndash;            padding: 8px;&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;        th {&ndash;%&gt;--%>
<%--&lt;%&ndash;            background-color: #f2f2f2;&ndash;%&gt;--%>
<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;    </style>&ndash;%&gt;--%>
<%--&lt;%&ndash;</head>&ndash;%&gt;--%>
<%--&lt;%&ndash;<body>&ndash;%&gt;--%>
<%--&lt;%&ndash;<h2>Student Management System</h2>&ndash;%&gt;--%>
<%--&lt;%&ndash;<table id="studentTable">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <th>Student ID</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <th>First Name</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <th>Last Name</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <th>Date of Birth</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <th>Action</th>&ndash;%&gt;--%>
<%--&lt;%&ndash;    </tr>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <!-- Existing rows (if any) -->&ndash;%&gt;--%>
<%--&lt;%&ndash;</table>&ndash;%&gt;--%>
<%--&lt;%&ndash;<button onclick="addRow()">Add Student</button>&ndash;%&gt;--%>

<%--&lt;%&ndash;<script>&ndash;%&gt;--%>
<%--&lt;%&ndash;    function addRow() {&ndash;%&gt;--%>
<%--&lt;%&ndash;        var table = document.getElementById("studentTable");&ndash;%&gt;--%>
<%--&lt;%&ndash;        var row = table.insertRow(-1); // Insert row at the end&ndash;%&gt;--%>
<%--&lt;%&ndash;        var cell1 = row.insertCell(0); // Student ID cell&ndash;%&gt;--%>
<%--&lt;%&ndash;        var cell2 = row.insertCell(1); // First Name cell&ndash;%&gt;--%>
<%--&lt;%&ndash;        var cell3 = row.insertCell(2); // Last Name cell&ndash;%&gt;--%>
<%--&lt;%&ndash;        var cell4 = row.insertCell(3); // Date of Birth cell&ndash;%&gt;--%>
<%--&lt;%&ndash;        var cell5 = row.insertCell(4); // Action cell&ndash;%&gt;--%>

<%--&lt;%&ndash;        // Create input fields for each column&ndash;%&gt;--%>
<%--&lt;%&ndash;        cell1.innerHTML = '<input type="text" name="id">';&ndash;%&gt;--%>
<%--&lt;%&ndash;        cell2.innerHTML = '<input type="text" name="firstname">';&ndash;%&gt;--%>
<%--&lt;%&ndash;        cell3.innerHTML = '<input type="text" name="lastname">';&ndash;%&gt;--%>
<%--&lt;%&ndash;        cell4.innerHTML = '<input type="date" name="dateofbirth">';&ndash;%&gt;--%>
<%--&lt;%&ndash;        cell5.innerHTML = '<button onclick="saveRow()">Save</button>' +&ndash;%&gt;--%>
<%--&lt;%&ndash;            '<button onclick="updateRow()">Update</button>' +&ndash;%&gt;--%>
<%--&lt;%&ndash;            '<button onclick="deleteRow()">Delete</button>' +&ndash;%&gt;--%>
<%--&lt;%&ndash;            '<button onclick="listDatabase()">List</button>';&ndash;%&gt;--%>
<%--&lt;%&ndash;    }&ndash;%&gt;--%>

<%--&lt;%&ndash;    function saveRow() {&ndash;%&gt;--%>
<%--&lt;%&ndash;        var row = event.target.parentNode.parentNode;&ndash;%&gt;--%>
<%--&lt;%&ndash;        var id = row.cells[0].querySelector('input[name="id"]').value;&ndash;%&gt;--%>
<%--&lt;%&ndash;        var firstname = row.cells[1].querySelector('input[name="firstname"]').value;&ndash;%&gt;--%>
<%--&lt;%&ndash;        var lastname = row.cells[2].querySelector('input[name="lastname"]').value;&ndash;%&gt;--%>
<%--&lt;%&ndash;        var dateofbirth = row.cells[3].querySelector('input[name="dateofbirth"]').value;&ndash;%&gt;--%>

<%--&lt;%&ndash;        // Send data to server to save in the database (you can use AJAX or form submission)&ndash;%&gt;--%>
<%--&lt;%&ndash;        // Example: You can send this data to a servlet using AJAX or form submission&ndash;%&gt;--%>
<%--&lt;%&ndash;        var xhr = new XMLHttpRequest();&ndash;%&gt;--%>
<%--&lt;%&ndash;        xhr.open("POST", "StudentsSaveServlet", true);&ndash;%&gt;--%>
<%--&lt;%&ndash;        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");&ndash;%&gt;--%>
<%--&lt;%&ndash;        xhr.onreadystatechange = function() {&ndash;%&gt;--%>
<%--&lt;%&ndash;            if (xhr.readyState === XMLHttpRequest.DONE) {&ndash;%&gt;--%>
<%--&lt;%&ndash;                if (xhr.status === 200) {&ndash;%&gt;--%>
<%--&lt;%&ndash;                    // Handle success response&ndash;%&gt;--%>
<%--&lt;%&ndash;                    alert("Record saved successfully.");&ndash;%&gt;--%>
<%--&lt;%&ndash;                } else {&ndash;%&gt;--%>
<%--&lt;%&ndash;                    // Handle error response&ndash;%&gt;--%>
<%--&lt;%&ndash;                    alert("Failed to save record.");&ndash;%&gt;--%>
<%--&lt;%&ndash;                }&ndash;%&gt;--%>
<%--&lt;%&ndash;            }&ndash;%&gt;--%>
<%--&lt;%&ndash;        };&ndash;%&gt;--%>
<%--&lt;%&ndash;        xhr.send("id=" + id + "&firstname=" + firstname + "&lastname=" + lastname + "&dateofbirth=" + dateofbirth);&ndash;%&gt;--%>
<%--&lt;%&ndash;    }&ndash;%&gt;--%>

<%--&lt;%&ndash; &ndash;%&gt;--%>
<%--&lt;%&ndash;    function updateRow() {&ndash;%&gt;--%>
<%--&lt;%&ndash;        var row = event.target.parentNode.parentNode;&ndash;%&gt;--%>
<%--&lt;%&ndash;        var id = row.cells[0].querySelector('input[name="id"]').value;&ndash;%&gt;--%>
<%--&lt;%&ndash;        // Redirect to update form with the student ID&ndash;%&gt;--%>
<%--&lt;%&ndash;        window.location.href = 'studentsupdate.jsp?studentId=' + id;&ndash;%&gt;--%>
<%--&lt;%&ndash;    }&ndash;%&gt;--%>


<%--&lt;%&ndash;    function deleteRow() {&ndash;%&gt;--%>
<%--&lt;%&ndash;        var row = event.target.parentNode.parentNode;&ndash;%&gt;--%>
<%--&lt;%&ndash;        row.remove();&ndash;%&gt;--%>
<%--&lt;%&ndash;        // Perform delete operation in database using AJAX or form submission&ndash;%&gt;--%>
<%--&lt;%&ndash;    }&ndash;%&gt;--%>

<%--&lt;%&ndash;    function listDatabase() {&ndash;%&gt;--%>
<%--&lt;%&ndash;        // Redirect to list page or display database records using AJAX&ndash;%&gt;--%>
<%--&lt;%&ndash;        window.location.href = 'ListDatabaseServlet';&ndash;%&gt;--%>
<%--&lt;%&ndash;    }&ndash;%&gt;--%>
<%--&lt;%&ndash;</script>&ndash;%&gt;--%>
<%--&lt;%&ndash;</body>&ndash;%&gt;--%>
<%--&lt;%&ndash;</html>&ndash;%&gt;--%>

<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Student Management System</title>--%>
<%--    <style>--%>
<%--        table {--%>
<%--            border-collapse: collapse;--%>
<%--            width: 100%;--%>
<%--        }--%>
<%--        th, td {--%>
<%--            border: 1px solid #dddddd;--%>
<%--            text-align: left;--%>
<%--            padding: 8px;--%>
<%--        }--%>
<%--        th {--%>
<%--            background-color: #f2f2f2;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<h2>Student Management System</h2>--%>
<%--<table id="studentTable">--%>
<%--    <tr>--%>
<%--        <th>Student ID</th>--%>
<%--        <th>First Name</th>--%>
<%--        <th>Last Name</th>--%>
<%--        <th>Date of Birth</th>--%>
<%--        <th>Action</th>--%>
<%--    </tr>--%>
<%--    <!-- Existing rows (if any) -->--%>
<%--</table>--%>
<%--<button onclick="addRow()">Add Student</button>--%>

<%--<script>--%>
<%--    function addRow() {--%>
<%--        var table = document.getElementById("studentTable");--%>
<%--        var row = table.insertRow(-1); // Insert row at the end--%>
<%--        var cell1 = row.insertCell(0); // Student ID cell--%>
<%--        var cell2 = row.insertCell(1); // First Name cell--%>
<%--        var cell3 = row.insertCell(2); // Last Name cell--%>
<%--        var cell4 = row.insertCell(3); // Date of Birth cell--%>
<%--        var cell5 = row.insertCell(4); // Action cell--%>

<%--        // Create input fields for each column--%>
<%--        cell1.innerHTML = '<input type="text" name="id">';--%>
<%--        cell2.innerHTML = '<input type="text" name="firstname">';--%>
<%--        cell3.innerHTML = '<input type="text" name="lastname">';--%>
<%--        cell4.innerHTML = '<input type="date" name="dateofbirth">';--%>
<%--        cell5.innerHTML = '<button onclick="saveRow()">Save</button>' +--%>
<%--            '<button onclick="updateRow()">Update</button>' +--%>
<%--            '<button onclick="deleteRow()">Delete</button>' +--%>
<%--            '<button onclick="listDatabase()">List</button>';--%>
<%--    }--%>

<%--    function saveRow() {--%>
<%--        var row = event.target.parentNode.parentNode;--%>
<%--        var id = row.cells[0].querySelector('input[name="id"]').value;--%>
<%--        var firstname = row.cells[1].querySelector('input[name="firstname"]').value;--%>
<%--        var lastname = row.cells[2].querySelector('input[name="lastname"]').value;--%>
<%--        var dateofbirth = row.cells[3].querySelector('input[name="dateofbirth"]').value;--%>

<%--        // Send data to server to save in the database (you can use AJAX or form submission)--%>
<%--        // Example: You can send this data to a servlet using AJAX or form submission--%>
<%--        var xhr = new XMLHttpRequest();--%>
<%--        xhr.open("POST", "StudentsSaveServlet", true);--%>
<%--        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");--%>
<%--        xhr.onreadystatechange = function() {--%>
<%--            if (xhr.readyState === XMLHttpRequest.DONE) {--%>
<%--                if (xhr.status === 200) {--%>
<%--                    // Handle success response--%>
<%--                    alert("Record saved successfully.");--%>
<%--                } else {--%>
<%--                    // Handle error response--%>
<%--                    alert("Failed to save record.");--%>
<%--                }--%>
<%--            }--%>
<%--        };--%>
<%--        xhr.send("id=" + id + "&firstname=" + firstname + "&lastname=" + lastname + "&dateofbirth=" + dateofbirth);--%>
<%--    }--%>

<%--    function updateRow() {--%>
<%--        var row = event.target.parentNode.parentNode;--%>
<%--        var id = row.cells[0].querySelector('input[name="id"]').value;--%>
<%--        // Redirect to update form with the student ID--%>
<%--        window.location.href = 'studentsupdate.jsp?studentId=' + id;--%>
<%--    }--%>

<%--    function deleteRow() {--%>
<%--        var row = event.target.parentNode.parentNode;--%>
<%--        var id = row.cells[0].querySelector('input[name="id"]').value;--%>

<%--        // Send AJAX request to delete student--%>
<%--        var xhr = new XMLHttpRequest();--%>
<%--        xhr.open("POST", "DeleteServlet", true);--%>
<%--        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");--%>
<%--        xhr.onreadystatechange = function() {--%>
<%--            if (xhr.readyState === XMLHttpRequest.DONE) {--%>
<%--                if (xhr.status === 200) {--%>
<%--                    // Handle success response--%>
<%--                    alert("Student deleted successfully.");--%>
<%--                    row.remove(); // Remove row from table on successful deletion--%>
<%--                } else {--%>
<%--                    // Handle error response--%>
<%--                    alert("Failed to delete student.");--%>
<%--                }--%>
<%--            }--%>
<%--        };--%>
<%--        xhr.send("studentId=" + id);--%>
<%--    }--%>

<%--    function listStudents() {--%>
<%--        // Send AJAX request to fetch student data--%>
<%--        var xhr = new XMLHttpRequest();--%>
<%--        xhr.open("GET", "ListServlet", true);--%>
<%--        xhr.onreadystatechange = function() {--%>
<%--            if (xhr.readyState === XMLHttpRequest.DONE) {--%>
<%--                if (xhr.status === 200) {--%>
<%--                    // Parse the JSON response--%>
<%--                    var studentsData = JSON.parse(xhr.responseText);--%>
<%--                    // Update the table with the fetched student data--%>
<%--                    updateStudentTable(studentsData);--%>
<%--                } else {--%>
<%--                    // Handle error response--%>
<%--                    alert("Failed to fetch student data.");--%>
<%--                }--%>
<%--            }--%>
<%--        };--%>
<%--        xhr.send();--%>
<%--    }--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h2>Student Management System</h2>
<table id="studentTable">
    <tr>
        <th>Student ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Date of Birth</th>
        <th>Action</th>
    </tr>
    <!-- Existing rows (if any) -->
</table>
<button onclick="addRow()">Add Student</button>
<%--//<button onclick="listStudents()">List Students</button>--%>

<script>
    function addRow() {
        var table = document.getElementById("studentTable");
        var row = table.insertRow(-1); // Insert row at the end
        var cell1 = row.insertCell(0); // Student ID cell
        var cell2 = row.insertCell(1); // First Name cell
        var cell3 = row.insertCell(2); // Last Name cell
        var cell4 = row.insertCell(3); // Date of Birth cell
        var cell5 = row.insertCell(4); // Action cell

        // Create input fields for each column
        cell1.innerHTML = '<input type="text" name="id">';
        cell2.innerHTML = '<input type="text" name="firstname">';
        cell3.innerHTML = '<input type="text" name="lastname">';
        cell4.innerHTML = '<input type="date" name="dateofbirth">';
        cell5.innerHTML = '<button onclick="saveRow()">Save</button>' +
            '<button onclick="updateRow()">Update</button>' +
            '<button onclick="deleteRow()">Delete</button>' +
            '<button onclick="listStudents()">List</button>';
    }

    function saveRow() {
        var row = event.target.parentNode.parentNode;
        var id = row.cells[0].querySelector('input[name="id"]').value;
        var firstname = row.cells[1].querySelector('input[name="firstname"]').value;
        var lastname = row.cells[2].querySelector('input[name="lastname"]').value;
        var dateofbirth = row.cells[3].querySelector('input[name="dateofbirth"]').value;

        // Send data to server to save in the database (you can use AJAX or form submission)
        // Example: You can send this data to a servlet using AJAX or form submission
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "StudentsSaveServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // Handle success response
                    alert("Record saved successfully.");
                } else {
                    // Handle error response
                    alert("Failed to save record.");
                }
            }
        };
        xhr.send("id=" + id + "&firstname=" + firstname + "&lastname=" + lastname + "&dateofbirth=" + dateofbirth);
    }

    function updateRow() {
        var row = event.target.parentNode.parentNode;
        var id = row.cells[0].querySelector('input[name="id"]').value;
        // Redirect to update form with the student ID
        window.location.href = 'studentsupdate.jsp?studentId=' + id;
    }

    function deleteRow() {
        var row = event.target.parentNode.parentNode;
        var id = row.cells[0].querySelector('input[name="id"]').value;

        // Send AJAX request to delete student
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "DeleteServlet", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // Handle success response
                    alert("Student deleted successfully.");
                    row.remove(); // Remove row from table on successful deletion
                } else {
                    // Handle error response
                    alert("Failed to delete student.");
                }
            }
        };
        xhr.send("studentId=" + id);
    }

    function listStudents() {
        // Send AJAX request to fetch student data
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "ListServlet", true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // Parse the JSON response
                    var studentsData = JSON.parse(xhr.responseText);
                    // Clear existing table rows
                    var table = document.getElementById("studentTable");
                    while (table.rows.length > 1) {
                        table.deleteRow(1);
                    }
                    // Update the table with the fetched student data
                    studentsData.forEach(function(student) {
                        var row = table.insertRow(-1);
                        var cell1 = row.insertCell(0);
                        var cell2 = row.insertCell(1);
                        var cell3 = row.insertCell(2);
                        var cell4 = row.insertCell(3);
                        cell1.innerHTML = student.student_id;
                        cell2.innerHTML = student.first_name;
                        cell3.innerHTML = student.last_name;
                        cell4.innerHTML = student.date_of_birth;
                    });
                } else {
                    // Handle error response
                    alert("Failed to fetch student data.");
                }
            }
        };
        xhr.send();
    }
</script>
</body>
</html>


