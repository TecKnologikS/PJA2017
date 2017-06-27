//
//  Devis.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 09/05/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//
open class Devis {
    
    var articles:[Article]
    
    var ID:Int
    var ID_User:Int
    var Societe:String
    var DateCreation:String
    var Facture:Bool
    var DateFacture:String
    var DateValidity:String
    var Siret:String
    var Tel:String
    var Fax:String
    var Email:String
    var Adresse:String
    var CP:String
    var Ville:String
    var Nom:String
    var Prenom:String
    var Prix:Double
    var Reduction:Double
    var PrixFinal:Double
    
    
    init() {
        self.articles = [Article]()
        self.ID = 0
        self.ID_User = 0
        self.Societe = ""
        self.DateCreation = ""
        self.Facture = false
        self.DateFacture = ""
        self.DateValidity = ""
        self.Siret = ""
        self.Tel = ""
        self.Fax = ""
        self.Email = ""
        self.Adresse = ""
        self.CP = ""
        self.Ville = ""
        self.Nom = ""
        self.Prenom = ""
        self.Prix = 0.0
        self.Reduction = 0.0
        self.PrixFinal = 0.0
    }
    
    
}
