package com.ceylontrails.servlet;

import com.ceylontrails.model.Booking;
import com.ceylontrails.service.BookingService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/api/bookings/*")
public class BookingServlet extends HttpServlet {

    private final BookingService bookingService = BookingService.getInstance();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Booking booking = ServletHelper.readJson(req, Booking.class);
        bookingService.saveBooking(booking);
        resp.getWriter().write("Booking saved successfully!");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ServletHelper.writeJson(resp, bookingService.getAllBookings());
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String pathInfo = req.getPathInfo();
        if (pathInfo != null && pathInfo.length() > 1) {
            String id = pathInfo.substring(1);
            bookingService.deleteBooking(id);
            resp.getWriter().write("Booking deleted!");
        } else {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String pathInfo = req.getPathInfo(); // "/id/status"
        if (pathInfo != null && pathInfo.length() > 1) {
            String cleanPath = pathInfo.substring(1);
            if (cleanPath.contains("/status")) {
                String id = cleanPath.split("/status")[0];
                String status = req.getParameter("status");
                bookingService.updateBookingStatus(id, status);
                resp.getWriter().write("Status updated!");
                return;
            }
        }
        resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
    }
}
