package fr.tecknologiks.myapplication.ObjectClass;

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

    }

    public boolean isCorrect() {
        return true;
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
