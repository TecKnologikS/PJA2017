//
//  Message.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 03/07/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import Foundation
import UIKit

class Message {
    static func ErrorSimple(titre:String, contenu:String) -> UIAlertController {
        let alert = UIAlertController(title: titre, message: contenu, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return alert
    }
}
