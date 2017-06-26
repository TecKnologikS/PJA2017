//
//  Article.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 09/05/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import Foundation

open class Article {
    var id:Int
    var name:String
    var smallDesc:String
    var about:String
    var image:String
    var categorie:Int
    var tags:String
    var prix:Double
    var prixFinal:Double
    
    init() {
        self.id = 0
        self.name = "Test"
        self.smallDesc = "Small description"
        self.about = "Description"
        self.categorie = 0
        self.tags = "test test toto"
        self.image = ""
        self.prix = 0
        self.prixFinal = 0
    }

}
