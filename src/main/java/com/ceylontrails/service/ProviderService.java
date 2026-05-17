package com.ceylontrails.service;

import com.ceylontrails.model.ServiceProvider;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
public class ProviderService {

    private final String FILE_PATH = "providers.txt";

    public ProviderService() {
        if (getAllProviders().isEmpty()) {
            saveProvider(new ServiceProvider(UUID.randomUUID().toString(), "Amal Perera", "0771234567", true, "English, French", "GUIDE"));
            saveProvider(new ServiceProvider(UUID.randomUUID().toString(), "Sunil Silva", "0719876543", true, "Luxury SUV", "DRIVER"));
        }
    }

    public List<ServiceProvider> getAllProviders() {
        List<ServiceProvider> providers = new ArrayList<>();
        File file = new File(FILE_PATH);
        if (!file.exists()) return providers;

        try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.trim().isEmpty()) continue;
                String[] parts = line.split("\\|");
                if (parts.length >= 6) {
                    providers.add(new ServiceProvider(parts[0], parts[1], parts[2], Boolean.parseBoolean(parts[3]), parts[4], parts[5]));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return providers;
    }

    public void saveProvider(ServiceProvider provider) {
        if (provider.getId() == null || provider.getId().isEmpty()) provider.setId(UUID.randomUUID().toString());
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            writer.write(provider.toString());
            writer.newLine();
        } catch (IOException e) { e.printStackTrace(); }
    }

    public void deleteProvider(String id) {
        List<ServiceProvider> list = getAllProviders();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (ServiceProvider p : list) {
                if (!p.getId().equals(id)) {
                    writer.write(p.toString());
                    writer.newLine();
                }
            }
        } catch (IOException e) { e.printStackTrace(); }
    }

    public void updateProviderStatus(String id, boolean status) {
        List<ServiceProvider> list = getAllProviders();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (ServiceProvider p : list) {
                if (p.getId().equals(id)) {
                    p.setAvailable(status);
                }
                writer.write(p.toString());
                writer.newLine();
            }
        } catch (IOException e) { e.printStackTrace(); }
    }

    public void updateProvider(String id, ServiceProvider updated) {
        List<ServiceProvider> list = getAllProviders();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(FILE_PATH))) {
            for (ServiceProvider p : list) {
                if (p.getId().equals(id)) {
                    p.setName(updated.getName());
                    p.setContactNumber(updated.getContactNumber());
                    p.setExtraInfo(updated.getExtraInfo());
                    p.setType(updated.getType());
                }
                writer.write(p.toString());
                writer.newLine();
            }
        } catch (IOException e) { e.printStackTrace(); }
    }
}
