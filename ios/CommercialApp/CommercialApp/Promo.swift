//
//  Promo.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 03/07/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import Foundation

open class Promo {
    var id:Int
    var nom:String
    var code:String
    var reduction:String
    
    init() {
        self.id = 0
        self.nom = ""
        self.code = ""
        self.reduction = ""
    }
}
