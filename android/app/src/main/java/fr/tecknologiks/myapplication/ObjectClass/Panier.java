package fr.tecknologiks.myapplication.ObjectClass;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.util.ArrayList;

/**
 * Created by robinpauquet on 05/07/2017.
 */

public class Panier {
    private static volatile Panier instance = null;

    private Double prix_total;
    private Double redution_total;
    private Double prix_final;
    private ArrayList<Article> articles;
    private ArrayList<Promo> promos;


    private Panier() {
        super();
        this.prix_total = 0.0;
        this.prix_final = 0.0;
        this.redution_total = 0.0;
        this.articles = new ArrayList<>();
        this.promos = new ArrayList<>();
    }

    public final static Panier getInstance() {
        if (Panier.instance == null) {
            synchronized(Panier.class) {
                if (Panier.instance == null)
                    Panier.instance = new Panier();

            }
        }
        return Panier.instance;
    }

    public Double getPrix_total() {
        return prix_total;
    }

    public void setPrix_total(Double prix_total) {
        this.prix_total = prix_total;
    }

    public Double getRedution_total() {
        return redution_total;
    }

    public void setRedution_total(Double redution_total) {
        this.redution_total = redution_total;
    }

    public Double getPrix_final() {
        return prix_final;
    }

    public void setPrix_final(Double prix_final) {
        this.prix_final = prix_final;
    }

    public ArrayList<Article> getArticles() {
        return articles;
    }

    public void setArticles(ArrayList<Article> articles) {
        this.articles = articles;
    }

    public ArrayList<Promo> getPromos() {
        return promos;
    }

    public void setPromos(ArrayList<Promo> promos) {
        this.promos = promos;
    }

    public void fromJSON(String json) {
        JsonElement jelement = new JsonParser().parse(json);
        JsonObject jobject = jelement.getAsJsonObject();
        if (jobject.size() > 0) {
            this.prix_total =       jobject.get("prix_total").getAsDouble();
            this.prix_final =       jobject.get("prix_final").getAsDouble();
            this.redution_total =   jobject.get("reduction_total").getAsDouble();

            JsonArray articles = jobject.getAsJsonArray("articles");
            this.articles.clear();
            for(int i = 0; i < articles.size(); i++) {
                Article a = new Article(articles.get(i).getAsJsonObject());
                a.setQte(articles.get(i).getAsJsonObject().get("Qte").getAsInt());
                a.setPrixFinal(articles.get(i).getAsJsonObject().get("prix_final").getAsDouble());
                this.articles.add(a);
            }

            JsonArray promos = jobject.getAsJsonArray("promo");
            this.promos.clear();
            for(int i = 0; i < promos.size(); i++) {
                Promo p = new Promo();
                p.setNom(promos.get(i).getAsJsonObject().get("Nom").getAsString());
                p.setCode(promos.get(i).getAsJsonObject().get("Code").getAsString());
                p.setReduction(promos.get(i).getAsJsonObject().get("Reduction").getAsString());
                this.promos.add(p);
            }
        }
    }
}
