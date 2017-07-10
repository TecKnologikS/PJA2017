package fr.tecknologiks.myapplication.ObjectClass;

import com.google.gson.JsonObject;

import fr.tecknologiks.myapplication.function.JsonUtils;

/**
 * Created by robinpauquet on 04/07/2017.
 */

public class Article {

    private int     id;
    private String  ref;
    private String  name;
    private String  smallDesc;
    private String  about;
    private String  image;
    private int  categorie;
    private String  tags;
    private Double  prix;
    private Double  prixFinal;
    private int     qte;
    private String  W;
    private String  K;
    private String  Lm;
    private String  LmW;
    private String  F;
    private String  V;
    private String  IRC;
    private String  H;
    private String  Longueur;
    private String  Largeur;
    private String  Profondeur;
    private String  Poids;
    private String  Min;
    private String  Max;
    private String  DEEE;


    public Article() {
        this.id = 0;
        this.name = "Ref";
        this.name = "Article";
        this.smallDesc = "Desc";
        this.about = "complete desc";
        this.image = "";
        this.categorie = 0;
        this.tags = "";
        this.prix = 100.0;
        this.prixFinal = 100.0;
        this.qte = 1;
        this.W = "";
        this.K = "";
        this.Lm  = "";
        this.LmW = "";
        this.F = "";
        this.V = "";
        this.IRC = "";
        this.H = "";
        this.Longueur = "";
        this.Largeur = "";
        this.Profondeur = "";
        this.Poids = "";
        this.Min = "";
        this.Max = "";
        this.DEEE = "";
    }

    public Article(JsonObject json) {
        this.id = json.get("id").getAsInt();
        this.ref = json.get("ref").getAsString();
        this.name = json.get("name").getAsString();
        this.smallDesc = json.get("smallDesc").getAsString();
        this.about = json.get("about").getAsString();
        this.image = json.get("image").getAsString();
        this.categorie = json.get("categorie").getAsInt();
        this.tags = json.get("tags").getAsString();
        this.prix = json.get("prix").getAsDouble();
        this.prixFinal = 0.0;
        this.W = JsonUtils.ifExistString(json, "W");
        this.K = JsonUtils.ifExistString(json, "K");
        this.Lm = JsonUtils.ifExistString(json, "Lm");
        this.LmW = JsonUtils.ifExistString(json, "LmW");
        this.F = JsonUtils.ifExistString(json, "F");
        this.V = JsonUtils.ifExistString(json, "V");
        this.IRC = JsonUtils.ifExistString(json, "IRC");
        this.H = JsonUtils.ifExistString(json, "H");
        this.Longueur = JsonUtils.ifExistString(json, "Longueur");
        this.Largeur = JsonUtils.ifExistString(json, "Largeur");
        this.Profondeur = JsonUtils.ifExistString(json, "Profondeur");
        this.Poids = JsonUtils.ifExistString(json, "Poids");
        this.Min = JsonUtils.ifExistString(json, "Min");
        this.Max = JsonUtils.ifExistString(json, "Max");
        this.DEEE = JsonUtils.ifExistString(json, "DEEE");
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

    public String getW() {
        return W;
    }

    public void setW(String w) {
        W = w;
    }

    public String getK() {
        return K;
    }

    public void setK(String k) {
        K = k;
    }

    public String getLm() {
        return Lm;
    }

    public void setLm(String lm) {
        Lm = lm;
    }

    public String getLmW() {
        return LmW;
    }

    public void setLmW(String lmW) {
        LmW = lmW;
    }

    public String getF() {
        return F;
    }

    public void setF(String f) {
        F = f;
    }

    public String getV() {
        return V;
    }

    public void setV(String v) {
        V = v;
    }

    public String getIRC() {
        return IRC;
    }

    public void setIRC(String IRC) {
        this.IRC = IRC;
    }

    public String getH() {
        return H;
    }

    public void setH(String h) {
        H = h;
    }

    public String getLongueur() {
        return Longueur;
    }

    public void setLongueur(String longueur) {
        Longueur = longueur;
    }

    public String getLargeur() {
        return Largeur;
    }

    public void setLargeur(String largeur) {
        Largeur = largeur;
    }

    public String getProfondeur() {
        return Profondeur;
    }

    public void setProfondeur(String profondeur) {
        Profondeur = profondeur;
    }

    public String getPoids() {
        return Poids;
    }

    public void setPoids(String poids) {
        Poids = poids;
    }

    public String getMin() {
        return Min;
    }

    public void setMin(String min) {
        Min = min;
    }

    public String getMax() {
        return Max;
    }

    public void setMax(String max) {
        Max = max;
    }

    public String getDEEE() {
        return DEEE;
    }

    public void setDEEE(String DEEE) {
        this.DEEE = DEEE;
    }

    public String getRef() {
        return ref;
    }

    public void setRef(String ref) {
        this.ref = ref;
    }
}
