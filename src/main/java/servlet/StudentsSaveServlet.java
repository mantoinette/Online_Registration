package servlet;

import dao.StudentsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Students;

import java.io.IOException;

@WebServlet("/StudentsSaveServlet")
public class StudentsSaveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        int id = Integer.parseInt(request.getParameter("id"));
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String dateOfBirth = request.getParameter("dateofbirth");

        // Create a new Student object
        Students student = new Students();
        student.setStudent_id(id);
        student.setFirst_name(firstName);
        student.setLast_name(lastName);
        student.setDate_of_birth(dateOfBirth);

        // Save the student object to the database using DAO
        StudentsDao dao = new StudentsDao();
        int result = dao.saveStudents(student);

        // Provide response based on result
        if (result > 0) {
            response.getWriter().write("success");
        } else {
            response.getWriter().write("failure");
        }
    }
}
