package com.ceylontrails.servlet;

import com.ceylontrails.model.User;
import com.ceylontrails.service.UserService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/api/users/*")
public class UserServlet extends HttpServlet {

    private final UserService userService = UserService.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String pathInfo = req.getPathInfo();
        if ("/signup".equals(pathInfo)) {
            User user = ServletHelper.readJson(req, User.class);
            if (userService.exists(user.getEmail())) {
                resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                ServletHelper.writeJson(resp, new Message("Email already exists"));
                return;
            }
            user.setRole("user");
            userService.saveUser(user);
            ServletHelper.writeJson(resp, user);
        } else if ("/login".equals(pathInfo)) {
            User loginData = ServletHelper.readJson(req, User.class);
            User user = userService.authenticate(loginData.getEmail(), loginData.getPassword());
            if (user != null) {
                ServletHelper.writeJson(resp, user);
            } else {
                resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                ServletHelper.writeJson(resp, new Message("Invalid credentials"));
            }
        } else {
            resp.setStatus(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ServletHelper.writeJson(resp, userService.getAllUsers());
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String pathInfo = req.getPathInfo();
        if (pathInfo != null && pathInfo.length() > 1) {
            String email = pathInfo.substring(1);
            userService.deleteUser(email);
            ServletHelper.writeJson(resp, new Message("User deleted"));
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String pathInfo = req.getPathInfo();
        if (pathInfo != null && pathInfo.length() > 1) {
            String email = pathInfo.substring(1);
            User user = ServletHelper.readJson(req, User.class);
            userService.updateUser(email, user);
            ServletHelper.writeJson(resp, user);
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    private static class Message {
        public String message;
        public Message(String msg) { this.message = msg; }
    }
}
