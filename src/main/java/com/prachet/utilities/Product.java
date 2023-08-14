package com.prachet.utilities;
public class Product {
    private String id;
    private String name;
    private String price;
    private String image;
    private String s;
    private String c;
    private String material;
    private String[] size;
    private String[] color;

    private String gender;
    public Product(String id, String name, String price, String image, String size,String color, String material, String gender) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.s=size;
        String x=s.substring(1,s.length()-1);
        this.size=x.split(", ");
        this.c=color;
        this.material=material;
        String y=c.substring(1,c.length()-1);
        this.color=y.split(", ");
        this.gender=gender;
    }
    public Product() {
    }
    public void setId(String id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setSize(String s) {
        this.s = s;
        String x=s.substring(1,s.length()-1);
        size=x.split(", ");
    }

    public void setColor(String c) {
        this.c = c;
        String y=c.substring(1,c.length()-1);
        color=y.split(", ");
    }
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setMaterial(String material) {
        this.material = material;
    }
    public String getMaterial() {
        return material;
    }
    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPrice() {
        return price;
    }

    public String getImage() {
        return image;
    }

    public String[] getSize() {
        return size;
    }

    public String[] getColor() {
        return color;
    }
}
