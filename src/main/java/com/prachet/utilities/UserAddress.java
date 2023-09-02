package com.prachet.utilities;

public class UserAddress {
    private String fname;
    private String lname;
    private String email;
    private String phone;
    private String address;
    private String country;
    private String city;

    public void setFname(String fname) {
        this.fname = fname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setState(String state) {
        this.state = state;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }

    private String state;
    private String pin;


    @Override
    public String toString() {
        return   fname  +
                "\n" + lname  +
                "\n" + email  +
                "\n" + phone +
                "\n" + address  +
                "\n" + country +
                "\n" + city +
                "\n" + state +
                "\n" + pin;
    }

    public UserAddress(String fname, String lname, String email, String phone, String address, String country, String city, String state, String pin) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.country = country;
        this.city = city;
        this.state = state;
        this.pin = pin;
    }
    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public String getAddress() {
        return address;
    }

    public String getCountry() {
        return country;
    }

    public String getCity() {
        return city;
    }

    public String getState() {
        return state;
    }

    public String getPin() {
        return pin;
    }

}
