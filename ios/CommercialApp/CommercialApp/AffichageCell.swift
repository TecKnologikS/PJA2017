//
//  AffichageCell.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 30/06/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//


class AffichageCell {
    var type:Int
    var libelle:String
    var value:String
    
    init(_type:Int, _lib:String, _val:String) {
        self.type = _type
        self.libelle = _lib
        self.value = _val
    }

}
