package org.example.future_developers_lms.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import org.example.future_developers_lms.model.User;
import org.example.future_developers_lms.dao.UserDAO;
import org.example.future_developers_lms.util.ValidationUtil;

@WebServlet("/auth")
public class AuthServlet extends HttpServlet {

    private UserDAO userDAO;
    private ValidationUtil validationUtil;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("register".equalsIgnoreCase(action)) {
            handleRegister(request, response);
        } else if ("login".equalsIgnoreCase(action)) {
            handleLogin(request, response);
        } else if ("forgotPassword".equals(action)) {
            forgotPassword(request, response);
         }
        else {
            response.sendRedirect("views/auth/login.jsp");
        }
    }
//Registration of User
    private void handleRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");  // from dropdown (ADMIN/TEACHER/STUDENT)

        if (!isValidPassword(password)) {
            request.setAttribute("message", "Password must be at least 8 characters, contain uppercase, lowercase, digit, and special character.");
            RequestDispatcher rd = request.getRequestDispatcher("views/auth/register.jsp");
            rd.forward(request, response);
            return;
        }
        String hashedPassword = hashPassword(password);
        User user = new User();
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPassword(hashedPassword);
        user.setRole(role);

        boolean success = userDAO.registerUserBasic(user);

        if (success) {
            request.setAttribute("message", " Registration successful! Please login.");
            RequestDispatcher rd = request.getRequestDispatcher("/views/auth/login.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("message", " Email already exists or registration failed.");
            RequestDispatcher rd = request.getRequestDispatcher("/views/auth/register.jsp");
            rd.forward(request, response);
        }
    }
//Login the User
    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("message", "Email and password are required.");
            request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
            return;
        }

        //  Validate password format again (optional but recommended)
        if (!isValidPassword(password)) {
            request.setAttribute("message", "Invalid password format. Please check your password.");
            request.getRequestDispatcher("views/auth/login.jsp").forward(request, response);
            return;
        }
        String hashedPassword = hashPassword(password);
        User user = userDAO.loginUser(email, hashedPassword, role);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // redirect based on role
            switch (role) {
                case "ADMIN":
                    response.sendRedirect("views/admin/dashboard.jsp");
                    break;
                case "TEACHER":
                    response.sendRedirect("views/teacher/dashboard.jsp");
                    break;
                default:
                    response.sendRedirect("views/student/dashboard.jsp");
                    break;
            }
        } else {
            request.setAttribute("message", " Invalid credentials or role mismatch!");
            RequestDispatcher rd = request.getRequestDispatcher("/views/auth/login.jsp");
            rd.forward(request, response);
        }
    }
    //Forgot Password
    private void forgotPassword(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("new_password");
        if (!userDAO.isEmailExists(email)) {
            request.setAttribute("message", "Email not found!");
            request.getRequestDispatcher("views/auth/forgotPassword.jsp").forward(request, response);
            return;
        }
        if (!isValidPassword(newPassword)) {
            request.setAttribute("message", "Password must be at least 8 characters, contain uppercase, lowercase, digit, and special character.");
            request.getRequestDispatcher("views/auth/forgotPassword.jsp").forward(request, response);
            return;
        }
        String hashedPassword = hashPassword(newPassword);
        if (userDAO.updatePassword(email, hashedPassword)) {
            request.setAttribute("message", "Password reset Successfully!");
            response.sendRedirect("views/auth/login.jsp?reset=success");
        } else {
            request.setAttribute("message", "Failed to reset password!");
            request.getRequestDispatcher("views/auth/forgotPassword.jsp").forward(request, response);
        }
    }
    //Password Validation
    private boolean isValidPassword(String password) {
        if (password == null) return false;
        String regex = "^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
        return password.matches(regex);
    }
        private String hashPassword(String password) {
            try {
                java.security.MessageDigest md = java.security.MessageDigest.getInstance("SHA-256");
                byte[] hash = md.digest(password.getBytes("UTF-8"));
                StringBuilder hexString = new StringBuilder();

                for (byte b : hash) {
                    String hex = Integer.toHexString(0xff & b);
                    if (hex.length() == 1) hexString.append('0');
                    hexString.append(hex);
                }
                return hexString.toString();
            } catch (Exception ex) {
                throw new RuntimeException(ex);
        }
    }
}
