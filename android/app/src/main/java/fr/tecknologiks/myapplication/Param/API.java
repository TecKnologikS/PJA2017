package fr.tecknologiks.myapplication.Param;

/**
 * Created by robin on 23/05/2017.
 * Update  by pierre on 23/05/2017.
 */

public class API {
    public static String URL = "http://commercial.tecknologiks.com/index.php";

    public static String LOGIN = "/login?login={login}&mdp={mdp}";

    public static String ARTICLES = "/{id}/{token}/products?limit={limit}&start={start}";
    public static String ARTICLE = "/{id}/{token}/products/{id_product}/";

    public static String Login(String user, String mdp) {
        return LOGIN.replace("{user}", user)
                .replace("{mdp}", mdp);
    }

    public static String Articles(String id, String token) {
        return Articles(id, token, 100, 0);
    }

    public static String Articles(String id, String token, int limit, int start) {
        return ARTICLES.replace("{id}", id)
                        .replace("{token}", token)
                        .replace("{limit}", String.valueOf(limit))
                        .replace("{start}", String.valueOf(start));
    }

    public static String Article(String id, String token, int id_art) {
        return ARTICLE.replace("{id}", id)
                .replace("{token}", token)
                .replace("{id_product}", String.valueOf(id_art));
    }
}