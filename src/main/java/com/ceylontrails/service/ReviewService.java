package com.ceylontrails.service;

import com.ceylontrails.model.PackageReview;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class ReviewService {
    private static final ReviewService instance = new ReviewService();
    public static ReviewService getInstance() { return instance; }

    private final String FILE_PATH = "reviews.txt";

    public ReviewService() {
        if (getAllReviews().isEmpty()) {
            saveReview(new PackageReview(UUID.randomUUID().toString(), "user@test.com", 5, "Amazing experience!", true, "pkg-1"));
        }
    }

    public List<PackageReview> getAllReviews() {
        List<PackageReview> reviews = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return reviews;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split("\\|");
                if (parts.length >= 7) {
                    reviews.add(new PackageReview(parts[0], parts[1], Integer.parseInt(parts[2]), parts[3], Boolean.parseBoolean(parts[4]), parts[5]));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return reviews;
    }

    public void saveReview(PackageReview feedback) {
        if (feedback.getId() == null || feedback.getId().isEmpty()) feedback.setId(UUID.randomUUID().toString());
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(feedback.toString());
            writer.newLine();
        } catch (IOException e) { e.printStackTrace(); }
    }

    public void deleteReview(String id) {
        List<PackageReview> list = getAllReviews();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (PackageReview f : list) {
                if (!f.getId().equals(id)) {
                    writer.write(f.toString());
                    writer.newLine();
                }
            }
        } catch (IOException e) { e.printStackTrace(); }
    }

    public void updateReview(String id, PackageReview updated) {
        List<PackageReview> list = getAllReviews();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (PackageReview f : list) {
                if (f.getId().equals(id)) {
                    f.setRating(updated.getRating());
                    f.setComment(updated.getComment());
                }
                writer.write(f.toString());
                writer.newLine();
            }
        } catch (IOException e) { e.printStackTrace(); }
    }
}
