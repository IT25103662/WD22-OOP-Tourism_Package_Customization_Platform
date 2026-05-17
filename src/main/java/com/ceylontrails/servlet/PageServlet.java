package com.ceylontrails.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/index.html", "/packages.html", "/login.html", "/profile.html", "/admin.html", "/package-details.html", ""})
public class PageServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getServletPath();
        String jspName = "index";
        
        if ("/packages.html".equals(path)) {
            jspName = "packages";
        } else if ("/login.html".equals(path)) {
            jspName = "login";
        } else if ("/profile.html".equals(path)) {
            jspName = "profile";
        } else if ("/admin.html".equals(path)) {
            jspName = "admin";
        } else if ("/package-details.html".equals(path)) {
            jspName = "package-details";
        }
        
        req.getRequestDispatcher("/WEB-INF/jsp/" + jspName + ".jsp").forward(req, resp);
    }
}
