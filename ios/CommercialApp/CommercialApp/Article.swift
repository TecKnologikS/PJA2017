//
//  Article.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 09/05/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import Foundation

open class Article {
    var id:Int32
    var name:String
    var smallDesc:String
    var about:String
    var image:String
    var categorie:Int32
    var tags:String
    
    init() {
        self.id = 0
        self.name = "Test"
        self.smallDesc = "Small description"
        self.about = "Description"
        self.categorie = 0
        self.tags = "test test toto"
        self.image = ""
    }

}
