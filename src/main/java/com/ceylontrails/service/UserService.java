package com.ceylontrails.service;

import com.ceylontrails.model.User;

import org.springframework.stereotype.Service;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {
    private final String FILE_PATH = "users.txt";

    public UserService() {
        // Ensure default admin exists
        if (getAllUsers().isEmpty()) {
            saveUser(new User("admin@ceylontrails.com", "admin123", "admin", "System Admin", "+94771234567", "Sri Lanka"));
        }
    }

    public void saveUser(User user) {
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(user.toString());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return users;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 3) {
                    String name = parts.length > 3 ? parts[3] : "";
                    String phone = parts.length > 4 ? parts[4] : "";
                    String country = parts.length > 5 ? parts[5] : "";
                    users.add(new User(parts[0], parts[1], parts[2], name, phone, country));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return users;
    }

    public User authenticate(String email, String password) {
        for (User u : getAllUsers()) {
            if (u.getEmail().equals(email) && u.getPassword().equals(password)) {
                return u;
            }
        }
        return null;
    }

    public boolean exists(String email) {
        for (User u : getAllUsers()) {
            if (u.getEmail().equals(email)) {
                return true;
            }
        }
        return false;
    }

    public void deleteUser(String email) {
        List<User> users = getAllUsers();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (User u : users) {
                if (!u.getEmail().equals(email)) {
                    writer.write(u.toString());
                    writer.newLine();
                }
            }
        } catch (IOException e) { e.printStackTrace(); }
    }

    public void updateUser(String email, User updated) {
        List<User> users = getAllUsers();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (User u : users) {
                if (u.getEmail().equals(email)) {
                    u.setName(updated.getName());
                    u.setRole(updated.getRole());
                    u.setPhoneNumber(updated.getPhoneNumber());
                    u.setCountry(updated.getCountry());
                    if (updated.getPassword() != null && !updated.getPassword().isEmpty()) {
                        u.setPassword(updated.getPassword());
                    }
                }
                writer.write(u.toString());
                writer.newLine();
            }
        } catch (IOException e) { e.printStackTrace(); }
    }
}
