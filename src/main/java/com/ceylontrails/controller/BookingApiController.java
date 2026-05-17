package com.ceylontrails.controller;

import com.ceylontrails.model.Booking;
import com.ceylontrails.service.BookingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/bookings")
public class BookingApiController {

    @Autowired
    private BookingService bookingService;

    @PostMapping
    public String createBooking(@RequestBody Booking booking) {
        bookingService.saveBooking(booking);
        return "Booking saved successfully!";
    }

    @GetMapping
    public List<Booking> getAllBookings() {
        return bookingService.getAllBookings();
    }

    @DeleteMapping("/{id}")
    public String deleteBooking(@PathVariable String id) {
        bookingService.deleteBooking(id);
        return "Booking deleted!";
    }

    @PutMapping("/{id}/status")
    public String updateStatus(@PathVariable String id, @RequestParam String status) {
        bookingService.updateBookingStatus(id, status);
        return "Status updated!";
    }
}
