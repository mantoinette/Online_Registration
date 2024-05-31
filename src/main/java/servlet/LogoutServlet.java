package servlet;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check if the user is authenticated
        HttpSession session = request.getSession(false); // Do not create a new session if it doesn't exist
        if (session != null && session.getAttribute("authenticated") != null && (Boolean) session.getAttribute("authenticated")) {
            // User is authenticated, so invalidate the session
            session.invalidate();
            response.sendRedirect("login.jsp"); // Redirect to the login page after logout
        } else {
            // User is not authenticated, redirect to the login page to ensure proper authentication
            response.sendRedirect("login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
