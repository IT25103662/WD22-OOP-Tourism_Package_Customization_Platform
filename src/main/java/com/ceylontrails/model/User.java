package com.ceylontrails.model;

public class User {
    private String email;
    private String password;
    private String role; // "user" or "admin"
    private String name;
    private String phoneNumber;
    private String country;

    public User() {}

    public User(String email, String password, String role, String name, String phoneNumber, String country) {
        this.email = email;
        this.password = password;
        this.role = role;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.country = country;
    }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getPhoneNumber() { return phoneNumber; }
    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }

    public String getCountry() { return country; }
    public void setCountry(String country) { this.country = country; }


    @Override
    public String toString() {
        return email + "," + password + "," + role + "," + name + "," + phoneNumber + "," + country;
    }
}
