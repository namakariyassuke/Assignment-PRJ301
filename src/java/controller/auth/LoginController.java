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
        request.getRequestDispatcher("view/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String errorMessage = null;

        if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
            errorMessage = "Please enter username and password";
        } else {
            UserDBContext db = new UserDBContext();
            User user = db.getUserByUsernamePassword(username, password);

            if (user == null) {
                errorMessage = "Invalid username or password";
            } else {
                request.getSession().setAttribute("user", user);

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

        request.setAttribute("errorMessage", errorMessage);
        request.getRequestDispatcher("view/auth/login.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
