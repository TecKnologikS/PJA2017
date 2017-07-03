//
//  ArticleBuilder.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 31/05/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import Foundation

open class ArticleBuilder {
    static func toListFromJSON(json:[[String:Any]]) -> [Article] {
        var retour = [Article]()
        for art in json {
            retour.append(self.jsonToArticle(json: art as [String:Any]))
        }
        return retour
    }
    
    static func jsonToArticle(json:[String:Any]) -> Article {
        let retour = Article()
        
        retour.id = Int(json["id"] as! String)!
        retour.name = json["name"] as! String
        retour.smallDesc = json["smallDesc"] as! String
        retour.about = json["about"] as! String
        retour.image = json["image"] as! String
        retour.categorie = Int(json["categorie"] as! String)!
        retour.tags = json["tags"] as! String
        retour.prix = Double(json["prix"] as! String)!
        
        return retour
    }
}
