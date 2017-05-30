//
//  API.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 30/05/2017.
//  Update  by pierre on 30/05/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import Foundation

open class API {
    static let URL = "http://commercial.tecknologiks.com/index.php"
	static let LOGIN = "/login?login={login}&mdp={mdp}"

	// Declaration des Articles
	static let ARTICLES = "/{id}/{token}/products?limit={limit}&start={start}";
    public let String ARTICLE = "/{id}/{token}/products/{id_product}/";
	
	// Declaration des Devis
    static let DEVIS = "/{id}/{token}/devis?limit={limit}&start={start}";
    static let DEVI = "/{id}/{token}/devis/{id_devis}/";
   
   // Login
	static func Login(user:String, mdp:String) -> String {
        return self.LOGIN.replacingOccurrences(of: "{login}", with: user)
            .replacingOccurrences(of: "{mdp}", with: mdp)
    }

/*
Demander à Robin la difference entre les differents static (func, let, var, let) et lesquels mettre ici
*/	

	// static pour les articles
    static String Articles(String id, String token) {
        return self.Articles(id, token, 100, 0);
    }

    static String Articles(String id, String token, int limit, int start) {
        return self.ARTICLES.replacingOccurrences(of: "{id}", with: id)
                        .replacingOccurrences(of: "{token}", with: token)
                        .replacingOccurrences(of: "{limit}", with: String.valueOf(limit))
                        .replacingOccurrences(of: "{start}", with: String.valueOf(start));
    }

    static String Article(String id, String token, int id_art) {
        return self.ARTICLE.replacingOccurrences(of: "{id}", with: id)
                .replacingOccurrences(of: "{token}", with: token)
                .replacingOccurrences(of: "{id_product}", with: String.valueOf(id_art));
    }

	//static pour les devis	
	static String Devis(String id, String token, int limit, int start) {
        return self.DEVIS.replacingOccurrences(of: "{id}", with: id)
                        .replacingOccurrences(of: "{token}", with: token)
                        .replacingOccurrences(of: "{limit}", with: String.valueOf(limit))
                        .replacingOccurrences(of: "{start}", with: String.valueOf(start));
    }

    static String Devi(String id, String token, int id_dev) {
        return self.DEVI.replacingOccurrences(of: "{id}", with: id)
                .replacingOccurrences(of: "{token}", with: token)
                .replacingOccurrences(of: "{id_devis}", with: String.valueOf(id_dev));
    }
}