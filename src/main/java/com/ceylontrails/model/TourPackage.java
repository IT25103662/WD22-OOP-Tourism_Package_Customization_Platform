package com.ceylontrails.model;

public class TourPackage {
    private String id;
    private String title;
    private String image;
    private String duration;
    private String price;
    private String description;

    public TourPackage() {}

    public TourPackage(String id, String title, String image, String duration, String price, String description) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.duration = duration;
        this.price = price;
        this.description = description;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getImage() { return image; }
    public void setImage(String image) { this.image = image; }
    public String getDuration() { return duration; }
    public void setDuration(String duration) { this.duration = duration; }
    public String getPrice() { return price; }
    public void setPrice(String price) { this.price = price; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String displayDetails() {
        return getTitle() + " (" + getDuration() + ")";
    }

    @Override
    public String toString() {
        return id + "|" + title + "|" + image + "|" + duration + "|" + price + "|" + description;
    }
}
