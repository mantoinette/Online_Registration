package servlet;
import dao.StudentsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward to the update form
        request.getRequestDispatcher("studentsupdate.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the updated information from the form
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String dob = request.getParameter("dateofbirth"); // This line retrieves the date of birth

        // Update the student record in the database
        StudentsDao dao = new StudentsDao();
        boolean updated = dao.updateStudent(studentId, firstName, lastName, dob);

        // Set message based on update result
        String message = updated ? "Student information updated successfully" : "Failed to update student information";

        // Set message as an attribute in request
        request.setAttribute("message", message);

        // Forward back to the update form
        request.getRequestDispatcher("studentsupdate.jsp").forward(request, response);
    }

}
