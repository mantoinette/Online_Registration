package servlet;

import dao.SemesterDao;
import model.Semester;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;

@WebServlet("/updateSemester")
public class UpdateSemesterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve semester details from request parameters
        int semesterId = Integer.parseInt(request.getParameter("semester_id"));
        String semesterName = request.getParameter("semester_name");
        String startDateStr = request.getParameter("starting_date");
        String endDateStr = request.getParameter("end_date");

        // Convert date strings to appropriate types
        Timestamp startDate = Timestamp.valueOf(startDateStr + " 00:00:00");
        Date endDate = Date.valueOf(endDateStr);

        // Update the semester using SemesterDao
        SemesterDao semesterDao = new SemesterDao();
        boolean success = semesterDao.updateSemester(semesterId, semesterName, String.valueOf(startDate), endDate);

        if (success) {
            // Success: Redirect to a success page or display a success message
            response.sendRedirect("success.jsp");
        } else {
            // Error: Redirect to an error page or display an error message
            response.sendRedirect("error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // If someone tries to access updateSemester via GET method, redirect to the index page or display an error
        response.sendRedirect("index.jsp");
    }
}
