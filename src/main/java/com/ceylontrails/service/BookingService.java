package com.ceylontrails.service;

import com.ceylontrails.model.Booking;

import org.springframework.stereotype.Service;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class BookingService {
    private static final BookingService instance = new BookingService();
    public static BookingService getInstance() { return instance; }

    private final String FILE_PATH = "bookings.txt";

    // 1. Create Operation
    public void saveBooking(Booking booking) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(booking.toString());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 2. Read Operation
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return bookings;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 6) {
                    Booking b = new Booking(
                        parts[0], parts[1], parts[2], 
                        Integer.parseInt(parts[3]), Integer.parseInt(parts[4]), parts[5]
                    );
                    if (parts.length >= 7) b.setAccommodation(parts[6]);
                    if (parts.length >= 8) b.setTransport(parts[7]);
                    if (parts.length >= 9) b.setSpecialRequests(parts[8]);
                    if (parts.length >= 10) b.setPackageId(parts[9]);
                    if (parts.length >= 11) b.setPaymentMethod(parts[10]);
                    bookings.add(b);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    // 3. Delete Operation
    public void deleteBooking(String id) {
        List<Booking> bookings = getAllBookings();
        File file = new File(FILE_PATH);
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
            for (Booking b : bookings) {
                if (!b.getId().equals(id)) {
                    writer.write(b.toString());
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 4. Update Operation
    public void updateBookingStatus(String id, String status) {
        List<Booking> bookings = getAllBookings();
        File file = new File(FILE_PATH);
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
            for (Booking b : bookings) {
                if (b.getId().equals(id)) {
                    b.setStatus(status);
                }
                writer.write(b.toString());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
