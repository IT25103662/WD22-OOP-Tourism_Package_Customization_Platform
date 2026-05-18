package com.ceylontrails.servlet;

import com.ceylontrails.model.ServiceProvider;
import com.ceylontrails.service.ProviderService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/api/providers/*")
public class ProviderServlet extends HttpServlet {

    private final ProviderService service = ProviderService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ServletHelper.writeJson(resp, service.getAllProviders());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ServiceProvider p = ServletHelper.readJson(req, ServiceProvider.class);
        service.saveProvider(p);
        ServletHelper.writeJson(resp, p);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String pathInfo = req.getPathInfo();
        if (pathInfo != null && pathInfo.length() > 1) {
            String id = pathInfo.substring(1);
            service.deleteProvider(id);
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String pathInfo = req.getPathInfo();
        if (pathInfo != null && pathInfo.length() > 1) {
            String cleanPath = pathInfo.substring(1);
            if (cleanPath.contains("/status")) {
                String id = cleanPath.split("/status")[0];
                boolean status = Boolean.parseBoolean(req.getParameter("status"));
                service.updateProviderStatus(id, status);
                return;
            }
            String id = cleanPath;
            ServiceProvider p = ServletHelper.readJson(req, ServiceProvider.class);
            service.updateProvider(id, p);
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
