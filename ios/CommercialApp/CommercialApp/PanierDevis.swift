//
//  PanierDevis.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 26/06/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import Foundation
import UIKit


final class PanierDevis {
    static let shared = PanierDevis()
    
    
    var panier:Int
    var devis:Int
    var navigation:UITabBarController?
    var isNav:Bool
    
    init() {
        self.panier = 0
        self.devis = 0
        self.isNav = false
    }
    
    func setNavigation(nav:UITabBarController) {
        self.isNav = true
        self.navigation = nav
    }
    
    func reload() {
        API.APIRequest(type: Request.GET, url: RequestBuilder.Count(id:"\(User.shared.id)", token: User.shared.token), body:"") { (ok, data) in
            let json = API.JSON(data: data)
            if json.count > 1 {
                self.devis = Int(json["count_devis"] as! String)!
                self.panier = Int(json["count_bag"] as! String)!
                DispatchQueue.main.async {
                    if (self.isNav == true) {
                        PanierDevis.shared.navigation?.tabBar.items![1].badgeValue = "\(self.panier)"
                        PanierDevis.shared.navigation?.tabBar.items![2].badgeValue = "\(self.devis)"
                    }
                }
            }
        }
    }
}
