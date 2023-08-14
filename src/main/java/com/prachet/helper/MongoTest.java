package com.prachet.helper;

import com.prachet.utilities.Product;
import com.prachet.utilities.StringRessource;

import java.util.*;

public class MongoTest {
    public static void main(String[] args) {
        ArrayList<ArrayList<String>> price;
//        ArrayList<String> size=new ArrayList<>();
//        size.add(1,"S");
//        size.add(2,"XS");
//        size.add(3,"M");
//        size.add(4,"L");
//        size.add(5,"XL");
//        ArrayList<String> color=new ArrayList<>();
//        size.add("Black");
//        size.add("White");
//        size.add("Red");
//        size.add("Green");
//        size.add("Blue");
//        MongoDB mongoDB=new MongoDB();
//        price=mongoDB.searchByMaterial(StringRessource.getCollection(0),"polyester");
//        ArrayList<ArrayList<String>> items=mongoDB.getAllCollection(StringRessource.getCollection(0));
//        Map<Integer, Product> productMap =new HashMap<>();
//        productMap=mongoDB.getAllProductsMap(items);
        MongoDB db = new MongoDB();
        String material="cotton",gender="Male";
        ArrayList<ArrayList<String>> products = db.filterByMaterialAndGender(StringRessource.getCollection(0), material, gender);
        System.out.println(products);
    }
}
