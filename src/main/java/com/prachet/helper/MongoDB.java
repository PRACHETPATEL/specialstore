package com.prachet.helper;

import com.mongodb.BasicDBObject;
import com.mongodb.client.*;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Indexes;
import com.prachet.utilities.Product;
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