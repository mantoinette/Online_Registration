package servlet;

import dao.StudentsDao;
import model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Students;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet("/RegisterServlet")
public class Studentsservlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String idString = req.getParameter("id");
//        int id = Integer.parseInt(idString);
//        String firstname = req.getParameter("firstname");
//        String DOB = req.getParameter("dob");

        int id= Integer.parseInt(req.getParameter("id"));
        String firstname=req.getParameter("firstname");
        String lastname=req.getParameter("lastname");
        String dateofbirth=req.getParameter("dateofbirth") ;


        Students sd = new Students();
        StudentsDao dao = new StudentsDao();

        sd.setStudent_id(id);
        sd.setFirst_name(firstname);
        sd.setLast_name(lastname);
        sd.setDate_of_birth(dateofbirth);

        int response = dao.saveStudents(sd);

        PrintWriter out = resp.getWriter();
        if (response > 0) {

            out.println("<html><body>");

            out.println("<h2>Record saved!!</h2>");
        } else {

            out.println("<h2>Record saved!!</h2>");
        }
        out.println("</body></html>");
    }
}