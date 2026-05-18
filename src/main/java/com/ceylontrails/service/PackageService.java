package com.ceylontrails.service;

import com.ceylontrails.model.TourPackage;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class PackageService {
    private static final PackageService instance = new PackageService();
    public static PackageService getInstance() { return instance; }

    private final String FILE_PATH = "packages.txt";

    public PackageService() {
        // Initialize with default packages if empty
        if (getAllPackages().isEmpty()) {
            savePackage(new TourPackage(UUID.randomUUID().toString(), "The Cultural Triangle", "assets/images/sigiriya.png", "5 Days / 4 Nights", "LKR 360,000", "Explore ancient cities, sacred temples, and the majestic Sigiriya Rock Fortress in complete luxury."));
            savePackage(new TourPackage(UUID.randomUUID().toString(), "Ceylon Tea Trails", "assets/images/tea.png", "4 Days / 3 Nights", "LKR 450,000", "Immerse yourself in the rolling hills of Nuwara Eliya. Stay in restored colonial planter's bungalows."));
            savePackage(new TourPackage(UUID.randomUUID().toString(), "Wilderness Safari", "assets/images/yala.png", "6 Days / 5 Nights", "LKR 550,000", "Experience the thrill of tracking leopards and elephants while staying in premium glamping tents."));
            savePackage(new TourPackage(UUID.randomUUID().toString(), "Southern Beach Retreat", "assets/images/beach_resort.png", "5 Days / 4 Nights", "LKR 480,000", "Unwind at a luxury beachfront resort. Enjoy infinity pools, spa treatments, and golden tropical sunsets."));
        }
    }

    public List<TourPackage> getAllPackages() {
        List<TourPackage> packages = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return packages;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split("\\|");
                if (parts.length >= 5) {
                    String id = parts[0];
                    String title = parts[1];
                    String image = parts[2];
                    String duration = parts[3];
                    String price = parts[4];
                    String description = "";
                    if (parts.length >= 6 && parts[5] != null && !parts[5].isEmpty()) {
                        try {
                            description = new String(java.util.Base64.getDecoder().decode(parts[5]));
                        } catch (IllegalArgumentException e) {
                            description = parts[5]; // Fallback if not base64
                        }
                    }
                    packages.add(new TourPackage(id, title, image, duration, price, description));
                }
            }
        } catch (IOException e) {
            System.err.println("Error reading packages: " + e.getMessage());
        }
        return packages;
    }

    public void savePackage(TourPackage pkg) {
        if (pkg.getId() == null || pkg.getId().isEmpty()) {
            pkg.setId(UUID.randomUUID().toString());
        }
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(pkg.toString());
            writer.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void updatePackage(String id, TourPackage updatedPkg) {
        List<TourPackage> packages = getAllPackages();
        File file = new File(FILE_PATH);
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
            for (TourPackage pkg : packages) {
                if (pkg.getId().equals(id)) {
                    pkg.setTitle(updatedPkg.getTitle());
                    pkg.setImage(updatedPkg.getImage());
                    pkg.setDuration(updatedPkg.getDuration());
                    pkg.setPrice(updatedPkg.getPrice());
                    pkg.setDescription(updatedPkg.getDescription());
                }
                writer.write(pkg.toString());
                writer.newLine();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void deletePackage(String id) {
        List<TourPackage> packages = getAllPackages();
        File file = new File(FILE_PATH);
        
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
            for (TourPackage pkg : packages) {
                if (!pkg.getId().equals(id)) {
                    writer.write(pkg.toString());
                    writer.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
