package com.ceylontrails.model;

public class Destination {
    private String id;
    private String name;
    private String location;
    private double baseEntryFee;

    public Destination() {}

    public Destination(String id, String name, String location, double baseEntryFee) {
        this.id = id;
        this.name = name;
        this.location = location;
        this.baseEntryFee = baseEntryFee;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }
    public double getBaseEntryFee() { return baseEntryFee; }
    public void setBaseEntryFee(double baseEntryFee) { this.baseEntryFee = baseEntryFee; }

    public double calculateEntryFee(boolean isChild) {
        return isChild ? baseEntryFee * 0.5 : baseEntryFee;
    }

    @Override
    public String toString() {
        return id + "|" + name + "|" + location + "|" + baseEntryFee;
    }
}
