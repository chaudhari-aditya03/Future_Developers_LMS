package org.example.future_developers_lms.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import org.example.future_developers_lms.model.User;
import org.example.future_developers_lms.dao.UserDAO;

@WebServlet("/auth")
public class AuthServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    // Handles direct GET requests to /auth (redirect to login)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
    }

    // Main POST Handler
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("register".equalsIgnoreCase(action)) {
            handleRegister(request, response);
        } else if ("login".equalsIgnoreCase(action)) {
            handleLogin(request, response);
        } else if ("forgotPassword".equalsIgnoreCase(action)) {
            handleForgotPassword(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp");
        }
    }

    // -------------------- REGISTER --------------------
    private void handleRegister(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Validate password strength
        if (!isValidPassword(password)) {
            request.setAttribute("message", "Password must be at least 8 characters long and contain uppercase, lowercase, number, and special character.");
            request.getRequestDispatcher("/views/auth/register.jsp").forward(request, response);
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
            // Registration success → go to login.jsp with message
            request.setAttribute("message", "Registration successful! Please login.");
            request.getRequestDispatcher("/views/auth/login.jsp").forward(request, response);
        } else {
            // Registration failed → stay on register.jsp
            request.setAttribute("message", "Email already exists or registration failed.");
            request.getRequestDispatcher("/views/auth/register.jsp").forward(request, response);
        }
    }

    // -------------------- LOGIN --------------------
    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        // Basic field validation
        if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("message", "Email and password are required.");
            request.getRequestDispatcher("/views/auth/login.jsp").forward(request, response);
            return;
        }

        // Password format validation (optional)
        if (!isValidPassword(password)) {
            request.setAttribute("message", "Invalid password format.");
            request.getRequestDispatcher("/views/auth/login.jsp").forward(request, response);
            return;
        }

        String hashedPassword = hashPassword(password);
        User user = userDAO.loginUser(email, hashedPassword, role);

        if (user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user_id", user.getUserId());
            session.setAttribute("role", user.getRole());
            session.setAttribute("user", user);

            // Redirect based on role (with context path)
            switch (user.getRole()) {
                case "ADMIN":
                    response.sendRedirect(request.getContextPath() + "/views/admin/dashboard.jsp");
                    break;
                case "TEACHER":
                    response.sendRedirect(request.getContextPath() + "/views/teacher/dashboard.jsp");
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/views/student/dashboard.jsp");
                    break;
            }
        } else {
            request.setAttribute("message", "Invalid credentials or role mismatch!");
            request.getRequestDispatcher("/views/auth/login.jsp").forward(request, response);
        }
    }

    // -------------------- FORGOT PASSWORD --------------------
    private void handleForgotPassword(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        String email = request.getParameter("email");
        String newPassword = request.getParameter("new_password");

        if (!userDAO.isEmailExists(email)) {
            request.setAttribute("message", "Email not found!");
            request.getRequestDispatcher("/views/auth/forgotPassword.jsp").forward(request, response);
            return;
        }

        if (!isValidPassword(newPassword)) {
            request.setAttribute("message", "Password must be at least 8 characters long and contain uppercase, lowercase, number, and special character.");
            request.getRequestDispatcher("/views/auth/forgotPassword.jsp").forward(request, response);
            return;
        }

        String hashedPassword = hashPassword(newPassword);

        if (userDAO.updatePassword(email, hashedPassword)) {
            // Redirect to login.jsp after success
            response.sendRedirect(request.getContextPath() + "/views/auth/login.jsp?reset=success");
        } else {
            request.setAttribute("message", "Failed to reset password!");
            request.getRequestDispatcher("/views/auth/forgotPassword.jsp").forward(request, response);
        }
    }

    // -------------------- UTILITIES --------------------
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
