package fr.tecknologiks.myapplication.Param;

import fr.tecknologiks.myapplication.ObjectClass.User;

/**
 * Created by robin on 23/05/2017.
 * Update  by pierre on 23/05/2017.
 */

public class API {
    private static String URL = "http://commercial.tecknologiks.com/index.php";
    private static String LOGIN = "/login?login={login}&mdp={mdp}";
    private static String COUNT = "/{id}/{token}/count_bag_and_devis/";
    private static String BAG_ADD = "/{id}/{token}/bag/add/";
    private static String SEARCH = "/{id}/{token}/products/search/{search}/";
    private static String REMOVE_ITEM = "/{id}/{token}/bag/remove/";
    private static String UPDATE_ITEM = "/{id}/{token}/bag/update/";
    private static String PANIER = "/{id}/{token}/bag/";
    private static String ADD_PROMO = "/{id}/{token}/promo/add/";
    private static String VALIDATE = "/{id}/{token}/devis/create/";

    // Declaration des Articles
    private static String ARTICLES = "/{id}/{token}/products?limit={limit}&start={start}";
    private static String ARTICLE = "/{id}/{token}/products/{id_product}/";

    // Declaration des Devis
    private static String DEVIS = "/{id}/{token}/devis?limit={limit}&start={start}";
    private static String DEVI = "/{id}/{token}/devis/{id_devis}/";

    // Login
    public static String Login(String user, String mdp) {
        return URL +   LOGIN.replace("{login}", user)
                            .replace("{mdp}",   mdp);
    }

    public static String Count() {
        return URL +   COUNT.replace("{id}",    String.valueOf(User.getInstance().getId()))
                            .replace("{token}", User.getInstance().getToken());
    }


    public static String AddArticle() {
        return URL + BAG_ADD.replace("{id}",    String.valueOf(User.getInstance().getId()))
                            .replace("{token}", User.getInstance().getToken());
    }

    public static String Search(String search) {
        return URL +  SEARCH.replace("{id}",        String.valueOf(User.getInstance().getId()))
                            .replace("{token}",     User.getInstance().getToken())
                            .replace("{search}",    search);
    }

    // static pour les articles
    public static String Articles() {
        return API.Articles(100, 0);
    }

    public static String Articles(int limit, int start) {
        return URL +    ARTICLES.replace("{id}",    String.valueOf(User.getInstance().getId()))
                                .replace("{token}", User.getInstance().getToken())
                                .replace("{limit}", String.valueOf(limit))
                                .replace("{start}", String.valueOf(start));
    }

    public static String Article(int id_art) {
        return URL +     ARTICLE.replace("{id}",            String.valueOf(User.getInstance().getId()))
                                .replace("{token}",         User.getInstance().getToken())
                                .replace("{id_product}",    String.valueOf(id_art));
    }

    //static pour les devis
    public static String Devis(int limit, int start) {
        return URL +   DEVIS.replace("{id}",    String.valueOf(User.getInstance().getId()))
                            .replace("{token}", User.getInstance().getToken())
                            .replace("{limit}", String.valueOf(limit))
                            .replace("{start}", String.valueOf(start));
    }

    public static String Devis() {
        return Devis(1000, 0);
    }

    public static String Devi(int id_dev) {
        return URL +    DEVI.replace("{id}",        String.valueOf(User.getInstance().getId()))
                            .replace("{token}",     User.getInstance().getToken())
                            .replace("{id_devis}",  String.valueOf(id_dev));
    }

    public static String RemoveToBasket() {
        return URL + REMOVE_ITEM.replace("{id}",    String.valueOf(User.getInstance().getId()))
                                .replace("{token}", User.getInstance().getToken());
    }
    public static String UpdateToBasket() {
        return URL + UPDATE_ITEM.replace("{id}",    String.valueOf(User.getInstance().getId()))
                                .replace("{token}", User.getInstance().getToken());
    }

    public static String Panier() {
        return  URL + PANIER.replace("{id}",    String.valueOf(User.getInstance().getId()))
                            .replace("{token}", User.getInstance().getToken());
    }

    public static String AddPromo() {
        return  URL +  ADD_PROMO.replace("{id}",    String.valueOf(User.getInstance().getId()))
                                .replace("{token}", User.getInstance().getToken());
    }

    public static String Validate() {
        return  URL +  VALIDATE.replace("{id}",     String.valueOf(User.getInstance().getId()))
                                .replace("{token}", User.getInstance().getToken());
    }

}
