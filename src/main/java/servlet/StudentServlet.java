// StudentServlet.java
package servlet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;
import dao.StudentDao;

import java.io.IOException;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        StudentDao studentdao = new StudentDao();
        Student student = new Student();

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        student.setEmail(email);
        student.setPassword(password);
        student.setRole(role);

        studentdao.studentRegister(student);

        // Optionally, you might redirect the user to another page after processing the form
        response.sendRedirect("login.jsp");
    }
}
