//
//  LoginController.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 30/05/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    
    @IBOutlet weak var tfLogin: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var bConnect: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var emptyDict: [String: String] = [:]
        emptyDict.updateValue("test", forKey: "key")
        emptyDict.updateValue("test2", forKey: "key2")
        emptyDict.updateValue("test3", forKey: "key34")
        emptyDict.updateValue("test4", forKey: "key4")
        _ = API.createBody(dict: emptyDict)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClick(_ sender: Any) {
        
        if (!(tfLogin.text?.isEmpty)! && !(tfPassword.text?.isEmpty)!)
        {
            /*let url = URL(string: API.URL + API.Login(user: tfLogin.text!, mdp: tfPassword.text!))
            URLSession.shared.dataTask(with:url!, completionHandler: {(data, response, error) in
                guard let data = data, error == nil else { return }
                
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String:Any]
                    if json.count == 4 {
                        User.shared.name = json["login"] as! String
                        User.shared.token = json["token"] as! String
                        DispatchQueue.main.async {
                            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let vc: UITabBarController = storyboard.instantiateViewController(withIdentifier: "app") as! UITabBarController
                            let appDelegate = UIApplication.shared.delegate as! AppDelegate
                            appDelegate.window?.rootViewController = vc
                        }
                    }
                } catch let error as NSError {
                    print(error)
                }
            }).resume()*/
        }
        
    }
    
}
