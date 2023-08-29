package com.prachet.utilities;

import java.beans.Introspector;

public class Cart {
    private String id;
    private String img;
    private String name;
    private int quantity;
    private int price;
    private String size;
    private String color;
    public Cart(String id, String img, String name, String quantity, String price, String size, String color) {
        this.id = id;
        this.img = img;
        this.name = name;
        this.quantity =Integer.parseInt(quantity);
        this.price = Integer.parseInt(price);
        this.size = size;
        this.color = color;
    }

    @Override
    public String toString() {
        return "[" +
                "id " + id +
                ",img " + img  +
                ",name " + name +
                ",quantity " + quantity +
                ",price " + price +
                ",size " + size  +
                ",color " + color  +
                ']';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity =Integer.parseInt(quantity) ;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = Integer.parseInt(price);
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

}