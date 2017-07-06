package fr.tecknologiks.myapplication.ObjectClass;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Created by robin on 23/05/2017.
 */

public class User {

    private static volatile User instance = null;
    private int id;
    private String name;
    private String token;

    private User() {
        super();
        this.id = 0;
        this.name = "";
        this.token = "";
    }

    public final static User getInstance() {
        if (User.instance == null) {
            synchronized(User.class) {
                if (User.instance == null)
                    User.instance = new User();

            }
        }
        return User.instance;
    }

    public void fromJSON(String json) {
        JsonElement jelement = new JsonParser().parse(json);
        JsonObject jobject = jelement.getAsJsonObject();
        if (jobject.size() > 0) {
            this.id = jobject.get("ID").getAsInt();
            this.name = jobject.get("login").getAsString();
            this.token = jobject.get("token").getAsString();
        }
    }

    public void reset() {
        this.id = 0;
        this.name = "";
        this.token = "";
    }

    public boolean isCorrect() {
        return id > 0 && token.trim().length() > 0;
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

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
