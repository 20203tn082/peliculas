package mx.com.movies.model;

import java.util.Date;

public class BeanMovie {
    private int id_movie;
    private String name;
    private String description;
    private String premiere;
    private double collection;
    private int status;

    public BeanMovie() {
    }

    public BeanMovie(int id_movie, String name, String description, String premiere, double collection, int status) {
        this.id_movie = id_movie;
        this.name = name;
        this.description = description;
        this.premiere = premiere;
        this.collection = collection;
        this.status = status;
    }

    public int getId_movie() {
        return id_movie;
    }

    public void setId_movie(int id_movie) {
        this.id_movie = id_movie;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPremiere() {
        return premiere;
    }

    public void setPremiere(String premiere) {
        this.premiere = premiere;
    }

    public double getCollection() {
        return collection;
    }

    public void setCollection(double collection) {
        this.collection = collection;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
