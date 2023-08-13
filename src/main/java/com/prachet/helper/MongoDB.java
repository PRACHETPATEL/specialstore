package com.prachet.helper;

import com.mongodb.BasicDBObject;
import com.mongodb.client.*;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Indexes;
import org.bson.Document;
import org.bson.conversions.Bson;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;

public class MongoDB {

    public static MongoClient client = null;
    public static MongoDatabase database = null;

    public static MongoClient getClient() {
        if (client == null) {
            client = MongoClients.create(StringRessource.getUri());
            System.out.println("Connection Client Successful");
        }
        return client;
    }

    public static MongoDatabase getDatabase() {
        if (client != null && database == null) {
            database = client.getDatabase(StringRessource.getDatabase());
            System.out.println("Connection Database Successful");
        }
        return database;
    }

    public ArrayList<ArrayList<String>> getAllCollection(String CollectionName) {
        ArrayList<ArrayList<String>> records = new ArrayList<>();
        MongoClient client = MongoDB.getClient();
        MongoDatabase database = MongoDB.getDatabase();
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

    public ArrayList<ArrayList<String>> filter(String CollectionName, ArrayList<String> price, ArrayList<String> color, ArrayList<String> size) {
        ArrayList<ArrayList<String>> records = new ArrayList<>();
        MongoClient client = MongoDB.getClient();
        MongoDatabase database = MongoDB.getDatabase();
        MongoCollection<Document> collection = database.getCollection(CollectionName);
        Bson sizex = Filters.all("size", size);
        MongoCursor<Document> cursor = collection.find(sizex).cursor();
        while (cursor.hasNext()) {
            ArrayList<String> products = new ArrayList<>();
            Document data = cursor.next();
            Set<Map.Entry<String, Object>> set = data.entrySet();
            for (Map.Entry<String, Object> x : set) {
                products.add(x.getValue().toString());
            }
            records.add(products);
        }
        Bson colorx = Filters.all("color", color);
        cursor = collection.find(colorx).cursor();
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
        MongoDatabase database = MongoDB.getDatabase();
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

    public ArrayList<ArrayList<String>> searchByName(String CollectionName, String text) {
        ArrayList<ArrayList<String>> records = new ArrayList<>();
        MongoClient client = MongoDB.getClient();
        MongoDatabase database = MongoDB.getDatabase();
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