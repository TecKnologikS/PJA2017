package fr.tecknologiks.myapplication.ObjectClass;

import com.google.gson.JsonObject;

/**
 * Created by robinpauquet on 04/07/2017.
 */

public class Article {

    private int     id;
    private String  name;
    private String  smallDesc;
    private String  about;
    private String  image;
    private int  categorie;
    private String  tags;
    private Double  prix;
    private Double  prixFinal;
    private int     qte;

    public Article() {
        this.id = 0;
        this.name = "Article";
        this.smallDesc = "Desc";
        this.about = "complete desc";
        this.image = "";
        this.categorie = 0;
        this.tags = "";
        this.prix = 100.0;
        this.prixFinal = 100.0;
        this.qte = 1;
    }

    public Article(JsonObject json) {
        this.id = json.get("id").getAsInt();
        this.name = json.get("name").getAsString();
        this.smallDesc = json.get("smallDesc").getAsString();
        this.about = json.get("about").getAsString();
        this.image = json.get("image").getAsString();
        this.categorie = json.get("categorie").getAsInt();
        this.tags = json.get("tags").getAsString();
        this.prix = json.get("prix").getAsDouble();
        this.prixFinal = 0.0;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSmallDesc() {
        return smallDesc;
    }

    public void setSmallDesc(String smallDesc) {
        this.smallDesc = smallDesc;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCategorie() {
        return categorie;
    }

    public void setCategorie(int categorie) {
        this.categorie = categorie;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public Double getPrix() {
        return prix;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }

    public Double getPrixFinal() {
        return prixFinal;
    }

    public void setPrixFinal(Double prixFinal) {
        this.prixFinal = prixFinal;
    }

    public int getQte() {
        return qte;
    }

    public void setQte(int qte) {
        this.qte = qte;
    }
}
