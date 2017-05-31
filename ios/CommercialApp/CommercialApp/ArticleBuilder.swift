//
//  ArticleBuilder.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 31/05/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import Foundation

open class ArticleBuilder {
    func toListFromJSON(json:[[String:Any]]) -> [Article] {
        var retour = [Article]()
        for art in json {
            retour.append(self.jsonToArticle(json: art))
        }
        return retour
    }
    
    func jsonToArticle(json:[String:Any]) -> Article {
        var retour = Article()
        
        retour.id = json["id"] as! Int32
        retour.name = json["name"] as! String
        retour.smallDesc = json["smallDesc"] as! String
        retour.about = json["about"] as! String
        retour.image = json["image"] as! String
        retour.categorie = json["categorie"] as! Int32
        retour.tags = json["tags"] as! String
        retour.prix = json["prix"] as! Double
        
        return retour
    }
}
