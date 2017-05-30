//
//  User.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 30/05/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import Foundation


final class User {
    static let shared = User()
    
   
    
    var name:String
    var token:String
    
    init() {
        self.name = ""
        self.token = ""
    }
}
