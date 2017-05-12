//
//  Devis.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 09/05/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//
open class Devis {
    
    var articles:[Article]
    var prix:Double
    var prixFinal:Double
    var name:String
    var idClient:Int32
    var libelle:String
    var date:String
    
    
    init() {
        self.articles = [Article]()
        self.prix = 0
        self.prixFinal = 0
        self.name = ""
        self.idClient = 0
        self.libelle = "Devis"
        self.date = "01/01/2017"
    }
    
}
