package com.ceylontrails.servlet;

import com.ceylontrails.model.TourPackage;
import com.ceylontrails.service.PackageService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/api/packages/*")
public class PackageServlet extends HttpServlet {

    private final PackageService service = PackageService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ServletHelper.writeJson(resp, service.getAllPackages());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        TourPackage pkg = ServletHelper.readJson(req, TourPackage.class);
        service.savePackage(pkg);
        ServletHelper.writeJson(resp, pkg);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String pathInfo = req.getPathInfo();
        if (pathInfo != null && pathInfo.length() > 1) {
            String id = pathInfo.substring(1);
            TourPackage pkg = ServletHelper.readJson(req, TourPackage.class);
            service.updatePackage(id, pkg);
            ServletHelper.writeJson(resp, pkg);
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String pathInfo = req.getPathInfo();
        if (pathInfo != null && pathInfo.length() > 1) {
            String id = pathInfo.substring(1);
            service.deletePackage(id);
            resp.getWriter().write("Package deleted!");
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
