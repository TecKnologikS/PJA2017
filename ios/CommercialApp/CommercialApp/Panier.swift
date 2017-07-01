//
//  Panier.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 09/05/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//
open class Panier {
    
    static let shared = Panier()
    
    var articles:[Article]
    //var promos:[Promo]
    var prix_total:Double
    var prix_final:Double
    var reduction_total:Double
    
    init() {
        self.articles = [Article]()
        self.prix_final = 0.0
        self.prix_total = 0.0
        self.reduction_total = 0.0
    }
    
    static func loadPanier(json:[String:Any]) {
        Panier.shared.prix_final = json["prix_final"] as! Double
        Panier.shared.reduction_total = json["reduction_total"] as! Double
        Panier.shared.prix_total = json["prix_total"] as! Double
        
        let articles = json["articles"] as! [[String:Any]]
        Panier.shared.articles.removeAll()
        for art in articles {
            var article:Article = ArticleBuilder.jsonToArticle(json: art)
            article.prixFinal = art["prix_final"] as! Double
            article.qte = Int(art["Qte"] as! String) ?? 1
            Panier.shared.articles.append(article)
        }
    }

    
}
