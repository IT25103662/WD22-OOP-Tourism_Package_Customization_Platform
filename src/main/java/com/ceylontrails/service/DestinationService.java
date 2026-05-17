package com.ceylontrails.service;

import com.ceylontrails.model.Destination;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class DestinationService {

    private final String FILE_PATH = "destinations.txt";

    public DestinationService() {
        if (getAllDestinations().isEmpty()) {
            saveDestination(new Destination(UUID.randomUUID().toString(), "Sigiriya Rock Fortress", "Matale", 5000));
            saveDestination(new Destination(UUID.randomUUID().toString(), "Yala National Park", "Tissamaharama", 8000));
            saveDestination(new Destination(UUID.randomUUID().toString(), "Temple of the Tooth", "Kandy", 2000));
            saveDestination(new Destination(UUID.randomUUID().toString(), "Galle Fort", "Galle", 0));
            saveDestination(new Destination(UUID.randomUUID().toString(), "Horton Plains", "Nuwara Eliya", 4000));
            saveDestination(new Destination(UUID.randomUUID().toString(), "Pinnawala Elephant Orphanage", "Kegalle", 3000));
        }
    }

    public List<Destination> getAllDestinations() {
        List<Destination> destinations = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return destinations;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split("\\|");
                if (parts.length >= 4) {
                    destinations.add(new Destination(parts[0], parts[1], parts[2], Double.parseDouble(parts[3])));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return destinations;
    }

    public void saveDestination(Destination dest) {
        if (dest.getId() == null || dest.getId().isEmpty()) dest.setId(UUID.randomUUID().toString());
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(dest.toString());
            writer.newLine();
        } catch (IOException e) { e.printStackTrace(); }
    }

    public void deleteDestination(String id) {
        List<Destination> list = getAllDestinations();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Destination d : list) {
                if (!d.getId().equals(id)) {
                    writer.write(d.toString());
                    writer.newLine();
                }
            }
        } catch (IOException e) { e.printStackTrace(); }
    }

    public void updateDestination(String id, Destination updated) {
        List<Destination> list = getAllDestinations();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (Destination d : list) {
                if (d.getId().equals(id)) {
                    d.setName(updated.getName());
                    d.setLocation(updated.getLocation());
                    d.setBaseEntryFee(updated.getBaseEntryFee());
                }
                writer.write(d.toString());
                writer.newLine();
            }
        } catch (IOException e) { e.printStackTrace(); }
    }
}
