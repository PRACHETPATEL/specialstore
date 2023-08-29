package com.prachet.helper;

import com.mongodb.BasicDBObject;
import com.mongodb.client.*;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Indexes;
import com.prachet.utilities.Product;
import com.prachet.utilities.Review;
import com.prachet.utilities.StringRessource;
import org.bson.Document;
import org.bson.conversions.Bson;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class MongoDB {

    private static MongoClient client = null;

    public static MongoClient getClient() {
        if (client == null) {
            client = MongoClients.create(StringRessource.getUri());
            System.out.println("Connection Client Successful");
        }
        return client;
    }
    public ArrayList<ArrayList<String>> getReviews(){
        ArrayList<ArrayList<String>> reviews=new ArrayList<>();
        return reviews;
    }
    public void addReview(String CollectionName, Review review){
        MongoClient client=MongoDB.getClient();
        MongoDatabase database=client.getDatabase(StringRessource.getDatabase());
        MongoCollection<Document> collection=database.getCollection(CollectionName);
        Document document=new Document();
        document.put("productid",review.getProductid());
        document.put("rating",review.getRating());
        document.put("review",review.getReview());
        document.put("name",review.getName());
        document.put("email",review.getEmail());
        document.put("date",review.getDate());
        collection.insertOne(document);
    }
    public ArrayList<Review> getReview(String CollectionName, String id){
        ArrayList<Review> reviews=new ArrayList<Review>();
        MongoClient client=MongoDB.getClient();
        MongoDatabase database=client.getDatabase(StringRessource.getDatabase());
        MongoCollection<Document> collection=database.getCollection(CollectionName);
        BasicDBObject query = (BasicDBObject) new BasicDBObject("productid",id);
        MongoCursor<Document> cursor=collection.find(query).cursor();
        int totalrating=0;
        while (cursor.hasNext()){
            Document doc= (Document) cursor.next();
            Set<Map.Entry<String, Object>> set = doc.entrySet();
            ArrayList<String> r = new ArrayList<>();
            for (Map.Entry<String, Object> x : set) {
                r.add(x.getValue().toString());
            }
            if(r.size()>6) {
                Review review = new Review(r.get(1), r.get(2), r.get(3), r.get(4), r.get(5), r.get(6));
                totalrating+=Integer.parseInt(r.get(2));
                reviews.add(review);
            }
        }
        String x= String.valueOf(totalrating);
        return reviews;
    }
    public ArrayList<ArrayList<String>> getAllCollection(String CollectionName) {
        ArrayList<ArrayList<String>> records = new ArrayList<>();
        MongoClient client = MongoDB.getClient();
        MongoDatabase database = client.getDatabase(StringRessource.getDatabase());
        MongoCollection<Document> collection = database.getCollection(CollectionName);
        MongoCursor<Document> cursor = collection.find().cursor();
        while (cursor.hasNext()) {
            ArrayList<String> products = new ArrayList<>();
            Document data = (Document) cursor.next();
            Set<Map.Entry<String, Object>> set = data.entrySet();
            for (Map.Entry<String, Object> x : set) {
                products.add(x.getValue().toString());
            }
            records.add(products);
        }
        return records;
    }

    public ArrayList<ArrayList<String>> filter(String CollectionName, ArrayList<String> color, ArrayList<String> size) {
        ArrayList<ArrayList<String>> records = new ArrayList<>();
        MongoClient client = MongoDB.getClient();
        MongoDatabase database = client.getDatabase(StringRessource.getDatabase());
        MongoCollection<Document> collection = database.getCollection(CollectionName);
        BasicDBObject query = (BasicDBObject) new BasicDBObject("size", size).put("color",color);
        assert query != null;
        MongoCursor<Document> cursor = collection.find(query).cursor();
        while (cursor.hasNext()) {
            ArrayList<String> products = new ArrayList<>();
            Document data = cursor.next();
            Set<Map.Entry<String, Object>> set = data.entrySet();
            for (Map.Entry<String, Object> x : set) {
                products.add(x.getValue().toString());
            }
            records.add(products);
        }
        return records;
    }
    public ArrayList<ArrayList<String>> searchByMaterial(String CollectionName, String text) {
        ArrayList<ArrayList<String>> records = new ArrayList<>();
        MongoClient client = MongoDB.getClient();
        MongoDatabase database = client.getDatabase(StringRessource.getDatabase());
        MongoCollection<Document> collection = database.getCollection(CollectionName);
        BasicDBObject query = new BasicDBObject("material", text);
        MongoCursor<Document> dt = collection.find(query).cursor();
        while (dt.hasNext()) {
            ArrayList<String> products = new ArrayList<>();
            Document data = dt.next();
            Set<Map.Entry<String, Object>> set = data.entrySet();
            for (Map.Entry<String, Object> x : set) {
                products.add(x.getValue().toString());
            }
            records.add(products);
        }
        return records;
    }
    public ArrayList<ArrayList<String>> filterByMaterialAndGender(String CollectionName, String text,String gender) {
        ArrayList<ArrayList<String>> records = new ArrayList<>();
        MongoClient client = MongoDB.getClient();
        MongoDatabase database = client.getDatabase(StringRessource.getDatabase());
        MongoCollection<Document> collection = database.getCollection(CollectionName);
        BasicDBObject query = new BasicDBObject("material", text);
        query.put("gender",gender);
        MongoCursor<Document> dt = collection.find(query).cursor();
        while (dt.hasNext()) {
            ArrayList<String> products = new ArrayList<>();
            Document data = dt.next();
            Set<Map.Entry<String, Object>> set = data.entrySet();
            for (Map.Entry<String, Object> x : set) {
                products.add(x.getValue().toString());
            }
            records.add(products);
        }
        return records;
    }
    public ArrayList<ArrayList<String>> searchByGender(String CollectionName, String text) {
        ArrayList<ArrayList<String>> records = new ArrayList<>();
        MongoClient client = MongoDB.getClient();
        MongoDatabase database = client.getDatabase(StringRessource.getDatabase());
        MongoCollection<Document> collection = database.getCollection(CollectionName);
        BasicDBObject query = new BasicDBObject("gender", text);
        MongoCursor<Document> dt = collection.find(query).cursor();
        while (dt.hasNext()) {
            ArrayList<String> products = new ArrayList<>();
            Document data = dt.next();
            Set<Map.Entry<String, Object>> set = data.entrySet();
            for (Map.Entry<String, Object> x : set) {
                products.add(x.getValue().toString());
            }
            records.add(products);
        }
        return records;
    }
    public Map<Integer,Product> getAllProductsMap(ArrayList<ArrayList<String>> items){
        Map<Integer, Product> productMap =new HashMap<>();
        Product product;
        if(items!=null) {
            for (int i = 0; i < items.size(); i++) {
                if (items.get(i).size() > 8) {
                    product= new Product(items.get(i).get(1), items.get(i).get(2), items.get(i).get(4), items.get(i).get(5), items.get(i).get(7), items.get(i).get(6), items.get(i).get(8), items.get(i).get(9));
                    productMap.put(Integer.parseInt(items.get(i).get(1)), product);
                }
            }
        }
        return productMap;
    }
    public ArrayList<ArrayList<String>> searchByName(String CollectionName, String text) {
        ArrayList<ArrayList<String>> records = new ArrayList<>();
        MongoClient client = MongoDB.getClient();
        MongoDatabase database = client.getDatabase(StringRessource.getDatabase());
        MongoCollection<Document> collection = database.getCollection(CollectionName);
        collection.createIndex(Indexes.text("name"));
        Bson filter = Filters.text(text);
        BasicDBObject query = new BasicDBObject("name", text);
        MongoCursor<Document> dt = collection.find(query).cursor();
        if (!dt.hasNext()) {
            FindIterable<Document> ft = collection.find(filter);
            MongoCursor<Document> cursor = ft.cursor();
            while (cursor.hasNext()) {
                ArrayList<String> products = new ArrayList<>();
                Document data = cursor.next();
                Set<Map.Entry<String, Object>> set = data.entrySet();
                for (Map.Entry<String, Object> x : set) {
                    products.add(x.getValue().toString());
                }
                records.add(products);
            }
        } else {
            while (dt.hasNext()) {
                ArrayList<String> products = new ArrayList<>();
                Document data = dt.next();
                Set<Map.Entry<String, Object>> set = data.entrySet();
                for (Map.Entry<String, Object> x : set) {
                    products.add(x.getValue().toString());
                }
                records.add(products);
            }
        }
        return records;
    }
}