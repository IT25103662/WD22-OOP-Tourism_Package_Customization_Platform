package com.ceylontrails.model;

public class PackageReview {
    private String id;
    private String userEmail;
    private int rating;
    private String comment;
    private boolean isVerified;
    private String packageId;

    public PackageReview() {}

    public PackageReview(String id, String userEmail, int rating, String comment, boolean isVerified, String packageId) {
        this.id = id;
        this.userEmail = userEmail;
        this.rating = rating;
        this.comment = comment;
        this.isVerified = isVerified;
        this.packageId = packageId;
    }

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getUserEmail() { return userEmail; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }
    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }
    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }
    public boolean isVerified() { return isVerified; }
    public void setVerified(boolean verified) { isVerified = verified; }
    public String getPackageId() { return packageId; }
    public void setPackageId(String packageId) { this.packageId = packageId; }

    @Override
    public String toString() {
        return id + "|" + userEmail + "|" + rating + "|" + comment + "|" + isVerified + "|" + packageId + "|PACKAGE";
    }
}
