package servlet;

import dao.AcademicUnitDao;
import dao.CourseDao;
import dao.SemesterDao;
// Import the appropriate DAO class for Semester
//import dao.AcademicUnitDao; // Import the appropriate DAO class for Academic Unit
import model.Course;
import model.Semester;
import model.Academic_Unit;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.UUID;

@WebServlet("/AddCourseServlet")
public class AddCourseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String courseCode = request.getParameter("courseCode");
        String courseName = request.getParameter("courseName");
        int semesterId = Integer.parseInt(request.getParameter("semester"));
        int academicUnitId = Integer.parseInt(request.getParameter("academicUnit"));

        // Create Course object
        Course course = new Course();
        course.setCourse_id(UUID.randomUUID()); // Generate a unique UUID for course_id
        course.setCourse_code(courseCode);
        course.setCourse_name(courseName);

        // Set Semester and Academic Unit
        Semester semester = getSemesterById(semesterId);
        Academic_Unit academicUnit = getAcademicUnitById(academicUnitId);
        course.setSemester(semester);
        course.setAcademic_Unit(academicUnit);

        // Save the course using CourseDao
        CourseDao courseDao = new CourseDao();
        courseDao.saveCourse(course);

        // Redirect to a confirmation page or display a success message
        response.sendRedirect("courseAddedConfirmation.jsp");
    }

    private Semester getSemesterById(int semesterId) {
        SemesterDao semesterDao = new SemesterDao(); // Initialize SemesterDao
        return semesterDao.getSemesterById(semesterId); // Call the appropriate method from SemesterDao
    }

    private Academic_Unit getAcademicUnitById(int academicUnitId) {
        AcademicUnitDao academicUnitDao = new AcademicUnitDao(); // Initialize AcademicUnitDao
        return academicUnitDao.getAcademicUnitById(academicUnitId); // Call the appropriate method from AcademicUnitDao
    }
}
