package com.prachet.helper;

import java.util.*;

public class MongoTest {
    public static void main(String[] args) {
        ArrayList<ArrayList<String>> price= new ArrayList<>();
        MongoDB mongoDB=new MongoDB();
        price=mongoDB.searchByMaterial(StringRessource.getCollection(0),"polyester");
        System.out.println(price);
    }
}
