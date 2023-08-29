package com.prachet.utilities;
public class Review {
    private String productid;
    private String rating;
    private String review;
    private String name;
    private String email;
    private String date;

    @Override
    public String toString() {
        return "Review{" +
                "productid='" + productid + '\'' +
                ", rating='" + rating + '\'' +
                ", review='" + review + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", date='" + date + '\'' +
                '}';
    }

    public Review(String productid, String rating, String review, String name, String email, String date) {
        this.productid = productid;
        this.rating = rating;
        this.review = review;
        this.name = name;
        this.email = email;
        this.date = date;
    }

    public String getRating() {
        return rating;
    }

    public void setRating(String rating) {
        this.rating = rating;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProductid() {
        return productid;
    }

    public void setProductid(String productid) {
        this.productid = productid;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
