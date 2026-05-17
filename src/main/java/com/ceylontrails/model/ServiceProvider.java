package com.ceylontrails.model;

public class ServiceProvider {
    private String id;
    private String name;
    private String contactNumber;
    private boolean isAvailable;
    private String extraInfo; // Languages for guides, Vehicle for drivers
    private String type; // GUIDE or DRIVER

    public ServiceProvider() {}

    public ServiceProvider(String id, String name, String contactNumber, boolean isAvailable, String extraInfo, String type) {
        this.id = id;
        this.name = name;
        this.contactNumber = contactNumber;
        this.isAvailable = isAvailable;
        this.extraInfo = extraInfo;
        this.type = type;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getContactNumber() { return contactNumber; }
    public void setContactNumber(String contactNumber) { this.contactNumber = contactNumber; }
    public boolean isAvailable() { return isAvailable; }
    public void setAvailable(boolean available) { isAvailable = available; }
    public String getExtraInfo() { return extraInfo; }
    public void setExtraInfo(String extraInfo) { this.extraInfo = extraInfo; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }

    @Override
    public String toString() {
        return id + "|" + name + "|" + contactNumber + "|" + isAvailable + "|" + extraInfo + "|" + type;
    }
}
