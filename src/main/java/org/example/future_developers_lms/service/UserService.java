package org.example.future_developers_lms.service;

import org.example.future_developers_lms.dao.UserDAO;
import org.example.future_developers_lms.model.User;

public class UserService {

    private final UserDAO userDAO;

    public UserService() {
        this.userDAO = new UserDAO();
    }

    //  Register a new user (with email existence check)
    public boolean registerUser(User user) {
        if (userDAO.isEmailExists(user.getEmail())) {
            return false; // Already registered
        }
        return userDAO.registerUser(user);
    }

    //  Login user
    public User loginUser(String email, String password, String role) {
        return userDAO.loginUser(email, password, role);
    }

    //  Reset password
    public boolean resetPassword(String email, String newPassword) {
        if (!userDAO.isEmailExists(email)) {
            return false;
        }
        return userDAO.updatePassword(email, newPassword);
    }

    //  Utility to check email
    public boolean isEmailExists(String email) {
        return userDAO.isEmailExists(email);
    }
}
