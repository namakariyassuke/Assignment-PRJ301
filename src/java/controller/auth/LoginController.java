package controller.auth;

import dal.UserDBContext;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         // Forward the request to the login page
        request.getRequestDispatcher("view/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // Get the username and password from the request parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String errorMessage = null;

        // Check if the username or password is missing
        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            errorMessage = "Please enter username and password";
        } else {
            // Authenticate the user
            UserDBContext db = new UserDBContext();
            User user = db.getUserByUsernamePassword(username, password);

            // Check if the user is authenticated
            if (user == null) {
                errorMessage = "Invalid username or password";
            } else {
                // Set the user in the session
                request.getSession().setAttribute("user", user);

                // Redirect to the appropriate home page based on the user's role
                if (user.getLecturer() != null) {
                    response.sendRedirect(request.getContextPath() + "/lecturer/home");
                    return;
                } else if (user.getStudent() != null) {
                    response.sendRedirect(request.getContextPath() + "/student/home");
                    return;
                } else if (user.getAdmin() != null) {
                    response.sendRedirect(request.getContextPath() + "/admin/dashboard");
                    return;
                }
            }
        }

        // Set the error message in the request and forward to the login page
        request.setAttribute("errorMessage", errorMessage);
        request.getRequestDispatcher("view/auth/login.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
