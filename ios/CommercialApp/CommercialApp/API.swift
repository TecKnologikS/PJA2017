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
            
        }
        body += "}"
        
        return body
    }
    
    static func listJSON(data:Data) -> [[String:Any]] {
        return try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [[String:Any]]
    }
    
    static func JSON(data:Data) -> [String:Any] {
        return try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
    }
    
    public class func APIRequest(type:Int, url: String, body:String, finish: @escaping (Bool, Data) -> ()) {
        let myUrl = URL(string: url);
        let request = NSMutableURLRequest(url:myUrl!);
        switch(type) {
        case Request.GET:
            request.httpMethod = "GET"
            break;
        case Request.POST:
            request.httpMethod = "POST"
            let postString = body
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


        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) -> Void in
            if let data = data {
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode {
                    finish(true, data)
                } else {
                    finish(false, data)
                }
            }
        })
        task.resume()
    }
}
