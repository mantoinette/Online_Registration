//package servlet;
//import dao.CourseDao;
//import dao.TeacherDao;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import model.Course;
//import model.EQualification;
//import model.Teacher;
//
//import java.io.IOException;
//
//@WebServlet("/addTeacher")
//public class AddTeacherServlet extends HttpServlet {
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String firstName = request.getParameter("firstName");
//        String lastName = request.getParameter("lastName");
//        String qualificationStr = request.getParameter("qualification");
//        EQualification qualification = EQualification.valueOf(qualificationStr);
//        int courseId = Integer.parseInt(request.getParameter("courseId"));
//
//        // Fetch the course associated with the given courseId
//        CourseDao courseDao = new CourseDao();
//        Course course = courseDao.getCourseById(courseId);
//
//        if (course != null) {
//            // Create a new Teacher object and associate it with the fetched course
//            Teacher teacher = new Teacher();
//            teacher.setFirst_name(firstName);
//            teacher.setLast_name(lastName);
//            teacher.setQualification(qualification);
//            teacher.setCourse(course);
//
//            // Save the teacher using TeacherDao
//            TeacherDao teacherDao = new TeacherDao();
//            teacherDao.saveTeacher(teacher);
//
//            // Redirect to a success page
//            response.sendRedirect("success.jsp");
//        } else {
//            // Handle case where the course with the provided courseId does not exist
//            response.getWriter().println("Course with ID " + courseId + " does not exist.");
//        }
//    }
//}

package servlet;

import dao.CourseDao;
import dao.TeacherDao;
import model.Course;
import model.EQualification;
import model.Teacher;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/addTeacher")
public class AddTeacherServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String qualificationStr = request.getParameter("qualification");
        EQualification qualification = EQualification.valueOf(qualificationStr);
        int courseId = Integer.parseInt(request.getParameter("courseId"));

        CourseDao courseDao = new CourseDao();
        Course course = courseDao.getCourseById(courseId);

        if (course != null) {
            Teacher teacher = new Teacher();
            teacher.setFirst_name(firstName);
            teacher.setLast_name(lastName);
            teacher.setQualification(qualification);
            teacher.setCourse(course);

            TeacherDao teacherDao = new TeacherDao();
            teacherDao.saveTeacher(teacher);

            response.sendRedirect("success.jsp");
        } else {
            response.getWriter().println("Course with ID " + courseId + " does not exist.");
        }
    }
}

