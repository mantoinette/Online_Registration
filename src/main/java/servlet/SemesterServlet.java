//package servlet;
//
//import dao.SemesterDAO;
//import model.Semester;
//import java.io.IOException;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//@WebServlet("/SemesterServlet")
//public class SemesterServlet extends HttpServlet {
//    private final SemesterDAO semesterDAO = new SemesterDAO();
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        doGet(request, response);
//    }
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String action = request.getParameter("action");
//
//        if (action == null) {
//            action = "list";
//        }
//
//        switch (action) {
//            case "list":
//                listSemesters(request, response);
//                break;
//            case "add":
//                addSemester(request, response);
//                break;
//            case "delete":
//                deleteSemester(request, response);
//                break;
//            default:
//                listSemesters(request, response);
//        }
//    }
//
//    private void listSemesters(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setAttribute("semesters", semesterDAO.getAllSemesters());
//        request.getRequestDispatcher("semesters.jsp").forward(request, response);
//    }
//
//    private void addSemester(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String semesterName = request.getParameter("semester_name");
//        // Parse and set other semester properties
//        Semester semester = new Semester();
//        semester.setsemester_name(semesterName);
//        // Set other properties
//        semesterDAO.addSemester(semester);
//        response.sendRedirect("SemesterServlet");
//    }
//
//    private void deleteSemester(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int semesterId = Integer.parseInt(request.getParameter("semester_id"));
//        semesterDAO.deleteSemester(semesterId);
//        response.sendRedirect("SemesterServlet");
//    }
//}
