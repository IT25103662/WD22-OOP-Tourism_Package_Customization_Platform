package com.ceylontrails.model;

import java.io.Serializable;

public class Booking implements Serializable {
    private String id;
    private String userEmail;
    private String arrivalDate;
    private int duration;
    private int travelers;
    private String status;
    private String accommodation;
    private String transport;
    private String specialRequests;
    private String packageId;
    private String paymentMethod;

    public Booking() {}

    public Booking(String id, String userEmail, String arrivalDate, int duration, int travelers, String status) {
        this.id = id;
        this.userEmail = userEmail;
        this.arrivalDate = arrivalDate;
        this.duration = duration;
        this.travelers = travelers;
        this.status = status;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getUserEmail() { return userEmail; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }
    public String getArrivalDate() { return arrivalDate; }
    public void setArrivalDate(String arrivalDate) { this.arrivalDate = arrivalDate; }
    public int getDuration() { return duration; }
    public void setDuration(int duration) { this.duration = duration; }
    public int getTravelers() { return travelers; }
    public void setTravelers(int travelers) { this.travelers = travelers; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getAccommodation() { return accommodation; }
    public void setAccommodation(String accommodation) { this.accommodation = accommodation; }
    public String getTransport() { return transport; }
    public void setTransport(String transport) { this.transport = transport; }
    public String getSpecialRequests() { return specialRequests; }
    public void setSpecialRequests(String specialRequests) { this.specialRequests = specialRequests; }
    public String getPackageId() { return packageId; }
    public void setPackageId(String packageId) { this.packageId = packageId; }
    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    @Override
    public String toString() {
        return id + "," + userEmail + "," + arrivalDate + "," + duration + "," + travelers + "," + status + "," + accommodation + "," + transport + "," + specialRequests + "," + packageId + "," + paymentMethod;
    }
}
