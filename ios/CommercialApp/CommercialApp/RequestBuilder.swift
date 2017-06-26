//
//  API.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 30/05/2017.
//  Update  by pierre on 30/05/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import Foundation

open class RequestBuilder {
	static let URL = "http://commercial.tecknologiks.com/index.php"
	static let LOGIN = "/login?login={login}&mdp={mdp}"

// Declaration des Articles
	static let ARTICLES = "/{id}/{token}/products?limit={limit}&start={start}";
	static let ARTICLE = "/{id}/{token}/products/{id_product}/";

// Declaration des Devis
	static let DEVIS = "/{id}/{token}/devis?limit={limit}&start={start}";
	static let DEVI = "/{id}/{token}/devis/{id_devis}/";

// Login
	static func Login(user:String, mdp:String) -> String {
		return self.LOGIN.replacingOccurrences(of: "{login}", with: user)
			.replacingOccurrences(of: "{mdp}", with: mdp)
    }

// static pour les articles
    static func Articles(id:String, token:String) -> String {
		return self.Articles(id: id, token: token, limit: 100, start: 0);
   }

    static func Articles(id:String, token:String, limit:Int, start:Int) -> String {
       	return self.ARTICLES.replacingOccurrences(of: "{id}", with: id)
                       .replacingOccurrences(of: "{token}", with: token)
                       .replacingOccurrences(of: "{limit}", with: "\(limit)")
                       .replacingOccurrences(of: "{start}", with: "\(start)")
   }

	static func Article(String id:String, String token:String, int id_art:Int) -> String {
		return self.ARTICLE.replacingOccurrences(of: "{id}", with: id)
			.replacingOccurrences(of: "{token}", with: token)
			.replacingOccurrences(of: "{id_product}", with: "\(id_art)")
    }
	
//static pour les devis
	static func Devis(id:String, token:String, limit:Int, start:Int) -> String {
		return self.DEVIS.replacingOccurrences(of: "{id}", with: id)
			.replacingOccurrences(of: "{token}", with: token)
			.replacingOccurrences(of: "{limit}", with: "\(limit)")
			.replacingOccurrences(of: "{start}", with: "\(start)")
    }
	
	static func Devi(id:String, token:String, id_dev:Int) -> String {
		return self.DEVI.replacingOccurrences(of: "{id}", with: id)
			.replacingOccurrences(of: "{token}", with: token)
			.replacingOccurrences(of: "{id_devis}", with: "\(id_dev)")
    }
}
