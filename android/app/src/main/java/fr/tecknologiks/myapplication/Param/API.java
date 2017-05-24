package fr.tecknologiks.myapplication.Param;

/**
 * Created by robin on 23/05/2017.
 * Update  by pierre on 23/05/2017.
 */

public class API {

// Declaration des Articles de Robin
    public static String URL = "http://commercial.tecknologiks.com/index.php";

    public static String LOGIN = "/login?login={login}&mdp={mdp}";

    public static String ARTICLES = "/{id}/{token}/products?limit={limit}&start={start}";
    public static String ARTICLE = "/{id}/{token}/products/{id_product}/";

// Declaration des Devis de Pierre
	public static String URL = "http://commercial.tecknologiks.com/index.php";

    public static String DEVIS = "/{id}/{token}/devis?limit={limit}&start={start}";
    public static String DEVI = "/{id}/{token}/devis/{id_devis}/";
	
// Login de Robin
    public static String Login(String user, String mdp) {
        return LOGIN.replace("{user}", user)
                .replace("{mdp}", mdp);
    }

// Public static pour les articles de Robin
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
	
// Public static pour les devis de Pierre	
	    public static String Devis(String id, String token, int limit, int start) {
        return DEVIS.replace("{id}", id)
                        .replace("{token}", token)
                        .replace("{limit}", String.valueOf(limit))
                        .replace("{start}", String.valueOf(start));
    }

    public static String Devi(String id, String token, int id_dev) {
        return DEVI.replace("{id}", id)
                .replace("{token}", token)
                .replace("{id_devis}", String.valueOf(id_dev));
    }
}