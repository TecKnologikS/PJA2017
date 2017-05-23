package fr.tecknologiks.myapplication.Param;

/**
 * Created by robin on 23/05/2017.
 */

public class API {
    public static String URL = "http://commercial.tecknologiks.com/index.php";

    public static String LOGIN = "/login?";
    public static String LOGIN_USER = "login=";
    public static String LOGIN_MDP = "mdp=";

    public static String ARTICLES = "/{id}/{token}/products?limit={limit}";
    public static String ARTICLES_LIMIT = "?limit=";

}
