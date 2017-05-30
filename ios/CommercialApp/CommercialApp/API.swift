//
//  API.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 30/05/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import Foundation

open class API {
    static let URL = "http://commercial.tecknologiks.com/index.php"
    static let LOGIN = "/login?login={login}&mdp={mdp}"
    static func Login(user:String, mdp:String) -> String {
        return self.LOGIN.replacingOccurrences(of: "{login}", with: user)
            .replacingOccurrences(of: "{mdp}", with: mdp)
    }
    
}
