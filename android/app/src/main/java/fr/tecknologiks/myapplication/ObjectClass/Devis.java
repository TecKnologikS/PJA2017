package fr.tecknologiks.myapplication.ObjectClass;

import com.google.gson.JsonObject;

/**
 * Created by robinpauquet on 07/07/2017.
 */

public class Devis {

    private int ID;
    private int ID_User;
    private String Societe;
    private String DateCreation;
    private Boolean Facture;
    private String DateFacture;
    private String DateValidity;
    private String Siret;
    private String Tel;
    private String Fax;
    private String Email;
    private String Adresse;
    private String CP;
    private String Ville;
    private String Nom;
    private String Prenom;
    private Double Prix;
    private Double Reduction;
    private Double PrixFinal;

    public Devis() {
        this.ID = 0;
        this.ID_User = 0;
        Societe = "";
        DateCreation = "";
        Facture = false;
        DateFacture = "";
        DateValidity = "";
        Siret = "";
        Tel = "";
        Fax = "";
        Email = "";
        Adresse = "";
        this.CP = "";
        Ville = "";
        Nom = "";
        Prenom = "";
        Prix = 0.0;
        Reduction = 0.0;
        PrixFinal = 0.0;
    }

    public Devis(JsonObject json) {
        this.ID =               json.get("ID").getAsInt();
        //this.ID_User =          json.get("id").getAsInt();
        this.Societe =          json.get("Societe").getAsString();
        this.DateCreation =     json.get("Date_Creation").getAsString();
        this.Facture =          json.get("Facture").getAsBoolean();
        this.DateFacture =      json.get("Date_Facture").getAsString();
        this.DateValidity =     json.get("Date_Validity").getAsString();
        this.Siret =            json.get("Siret").getAsString();
        this.Tel =              json.get("Tel").getAsString();
        this.Fax =              json.get("Fax").getAsString();
        this.Email =            json.get("Email").getAsString();
        this.Adresse =          json.get("Adresse").getAsString();
        this.CP =               json.get("CP").getAsString();
        this.Ville =            json.get("Ville").getAsString();
        this.Nom =              json.get("Nom").getAsString();
        this.Prenom =           json.get("Prenom").getAsString();
        this.Prix =             json.get("Prix").getAsDouble();
        this.Reduction =        json.get("Reduction").getAsDouble();
        this.PrixFinal =        json.get("Prix_final").getAsDouble();
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getID_User() {
        return ID_User;
    }

    public void setID_User(int ID_User) {
        this.ID_User = ID_User;
    }

    public String getSociete() {
        return Societe;
    }

    public void setSociete(String societe) {
        Societe = societe;
    }

    public String getDateCreation() {
        return DateCreation;
    }

    public void setDateCreation(String dateCreation) {
        DateCreation = dateCreation;
    }

    public Boolean getFacture() {
        return Facture;
    }

    public void setFacture(Boolean facture) {
        Facture = facture;
    }

    public String getDateFacture() {
        return DateFacture;
    }

    public void setDateFacture(String dateFacture) {
        DateFacture = dateFacture;
    }

    public String getDateValidity() {
        return DateValidity;
    }

    public void setDateValidity(String dateValidity) {
        DateValidity = dateValidity;
    }

    public String getSiret() {
        return Siret;
    }

    public void setSiret(String siret) {
        Siret = siret;
    }

    public String getTel() {
        return Tel;
    }

    public void setTel(String tel) {
        Tel = tel;
    }

    public String getFax() {
        return Fax;
    }

    public void setFax(String fax) {
        Fax = fax;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getAdresse() {
        return Adresse;
    }

    public void setAdresse(String adresse) {
        Adresse = adresse;
    }

    public String getCP() {
        return CP;
    }

    public void setCP(String CP) {
        this.CP = CP;
    }

    public String getVille() {
        return Ville;
    }

    public void setVille(String ville) {
        Ville = ville;
    }

    public String getNom() {
        return Nom;
    }

    public void setNom(String nom) {
        Nom = nom;
    }

    public String getPrenom() {
        return Prenom;
    }

    public void setPrenom(String prenom) {
        Prenom = prenom;
    }

    public Double getPrix() {
        return Prix;
    }

    public void setPrix(Double prix) {
        Prix = prix;
    }

    public Double getReduction() {
        return Reduction;
    }

    public void setReduction(Double reduction) {
        Reduction = reduction;
    }

    public Double getPrixFinal() {
        return PrixFinal;
    }

    public void setPrixFinal(Double prixFinal) {
        PrixFinal = prixFinal;
    }
}
