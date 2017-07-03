//
//  DevisBuilder.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 26/06/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import Foundation

open class DevisBuilder {
    static func toListFromJSON(json:[[String:Any]]) -> [Devis] {
        var retour = [Devis]()
        for art in json {
            retour.append(self.jsonToArticle(json: art as [String:Any]))
        }
        return retour
    }
    
    static func jsonToArticle(json:[String:Any]) -> Devis {
        let retour = Devis()
        
        retour.ID = Int(json["ID"] as! String)!
        retour.Societe = json["Societe"] as! String
        retour.DateCreation = json["Date_Creation"] as! String
        //retour.Facture = Bool(json["Facture"] as! String)!
        retour.DateFacture = json["Date_Facture"] as! String
        retour.DateValidity = json["Date_Validity"] as! String
        retour.Siret = json["Siret"] as! String
        retour.Tel = json["Tel"] as! String
        retour.Fax = json["Fax"] as! String
        retour.Email = json["Email"] as! String
        retour.Adresse = json["Adresse"] as! String
        retour.CP = json["CP"] as! String
        retour.Ville = json["Ville"] as! String
        retour.Nom = json["Nom"] as! String
        retour.Prenom = json["Prenom"] as! String
        retour.Prix = Double(json["Prix"] as! String)!
        retour.Reduction = Double(json["Reduction"] as! String)!
        retour.PrixFinal = Double(json["Prix_final"] as! String)!
        
        return retour
    }
}
