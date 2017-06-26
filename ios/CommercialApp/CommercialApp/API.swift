//
//  API.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 23/06/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import Foundation

open class API {
    
    static func createBody(dict:[String: String]) -> String {
        var body:String = "{"
        for (key, value) in dict {
            if (body.characters.count > 1) {
                body += ", "
            }
            body += "\"\(key)\":\"\(value)\""
            
            print("\(body)")
        }
        body += "}"
        return body
    }
    
    func APIRequest(type:Int, url:String) -> String {
        
        let request = NSMutableURLRequest(url: URL(string: url)!)
        
        switch(type) {
        case Request.GET:
            request.httpMethod = "GET"
            break;
        case Request.POST:
            request.httpMethod = "POST"
            let postString = "ce que vous voulez envoyer à l'API'"
            request.httpBody = postString.data(using: String.Encoding.utf8)
            break;
        case Request.PUT:
            request.httpMethod = "PUT"
            break;
        case Request.DELETE:
            request.httpMethod = "DELETE"
            break;
        default:
            break;
        }
        
        var responseString:String?
        
        let requestAPI = URLSession.shared.dataTask(with: request as URLRequest) {data, response, error in
            if (error != nil) {
                print(error!.localizedDescription) // On indique dans la console ou est le problème dans la requête
            }
            if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200 {
                print("statusCode devrait être de 200, mais il est de \(httpStatus.statusCode)")
                print("réponse = \(String(describing: response))") // On affiche dans la console si le serveur ne nous renvoit pas un code de 200 qui est le code normal
            }
            
            responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) as! String
            print("responseString = \(responseString)") // Affiche dans la console la réponse de l'API
            
            if error == nil {
                // Ce que vous voulez faire.
            }
        }
        requestAPI.resume()
        return responseString!
    }
    
}
