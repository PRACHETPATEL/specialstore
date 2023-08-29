package com.prachet.helper;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.prachet.utilities.Cart;
import com.prachet.utilities.Product;
import com.prachet.utilities.Review;
import com.prachet.utilities.StringRessource;
import org.bson.Document;

import javax.print.Doc;
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
//        Cart cart=new Cart("1","img","name","4","100","M","Black");
//        MongoClient client=MongoDB.getClient();
//        MongoDatabase db=client.getDatabase(StringRessource.getDatabase());
//        MongoCollection<Document> collection=db.getCollection(StringRessource.getCollection(4));
//        Document document=new Document("cart",cart.toString());
//        collection.insertOne(document);
        MongoDB db=new MongoDB();
        ArrayList<Review> reviews=db.getReview(StringRessource.getCollection(4),"4");
        for(Review review:reviews) {
            System.out.println(review.toString());
        }
    }
}
