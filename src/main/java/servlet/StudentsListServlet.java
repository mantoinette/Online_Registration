package servlet;

import dao.StudentsDao;
import model.Students;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/ListServlet")
public class StudentsListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        StudentsDao dao = new StudentsDao();
        List<Students> studentsList = dao.getAllStudents();

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><head><title>List Students</title></head><body>");
        out.println("<h2>Student List</h2>");
        out.println("<table border='1'>");
        out.println("<tr><th>Student ID</th><th>First Name</th><th>Last Name</th><th>Date of Birth</th></tr>");
        for (Students student : studentsList) {
            out.println("<tr>");
            out.println("<td>" + student.getStudent_id() + "</td>");
            out.println("<td>" + student.getFirst_name() + "</td>");
            out.println("<td>" + student.getLast_name() + "</td>");
            out.println("<td>" + student.getDate_of_birth() + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");
        out.println("</body></html>");
    }
}
