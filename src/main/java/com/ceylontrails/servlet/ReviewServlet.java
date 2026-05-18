package com.ceylontrails.servlet;

import com.ceylontrails.model.PackageReview;
import com.ceylontrails.service.ReviewService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/api/reviews/*")
public class ReviewServlet extends HttpServlet {

    private final ReviewService service = ReviewService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ServletHelper.writeJson(resp, service.getAllReviews());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        PackageReview r = ServletHelper.readJson(req, PackageReview.class);
        service.saveReview(r);
        ServletHelper.writeJson(resp, r);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String pathInfo = req.getPathInfo();
        if (pathInfo != null && pathInfo.length() > 1) {
            String id = pathInfo.substring(1);
            PackageReview r = ServletHelper.readJson(req, PackageReview.class);
            service.updateReview(id, r);
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String pathInfo = req.getPathInfo();
        if (pathInfo != null && pathInfo.length() > 1) {
            String id = pathInfo.substring(1);
            service.deleteReview(id);
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
