package servlet;

import dao.StudentsDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/DeleteServlet")
public class StudentsDeleteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the student ID to be deleted from the form
        int studentId = Integer.parseInt(request.getParameter("studentId"));

        // Delete the student record from the database
        StudentsDao dao = new StudentsDao();
        int deleted = dao.deleteStudents(studentId);

        // Set message based on deletion result
        String message = null;
        if (deleted > 0) {
            message = "Student deleted successfully";
        } else {
            message = "Failed to delete student";
        }

        // Set message as an attribute in request
        request.setAttribute("message", message);

        // Forward back to the delete form
        request.getRequestDispatcher("studentsdelete.jsp").forward(request, response);
    }
}
