package servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve user input from the login form
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Validate credentials (for simplicity, let's assume valid credentials)
        boolean isValid = true;

        if (isValid) {
            // Create a session for the user
            HttpSession session = request.getSession(true);

            // Set session timeout (1 minute)
            session.setMaxInactiveInterval(60); // 60 seconds

            // Set session attributes
            //Once the user is authenticated during login, there's generally no need to store their password in the session. Storing sensitive information like passwords in the session could pose a security risk,
            // especially if the session data is compromised
            session.setAttribute("email", email);
            session.setAttribute("role", role);

            // Redirect the user to the appropriate dashboard
            String redirectUrl = getDashboardRedirectUrl(role);
            response.sendRedirect(redirectUrl);
        } else {
            // Handle invalid credentials (for example, show error message)
            response.getWriter().println("Invalid credentials. Please try again.");
        }
    }

    // Method to get the dashboard redirect URL based on user's role
    private String getDashboardRedirectUrl(String role) {
        switch (role) {
            case "student":
                return "student.jsp";
            case "teacher":
                return "teacher.jsp";
            case "admin":
                return "index.html" ; //auca.ac.rw/index.html;
            default:
                return "index.jsp"; // Default redirect in case of unknown role
        }
    }
}
