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
    var activeField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        /*var emptyDict: [String: String] = [:]
        emptyDict.updateValue("test", forKey: "key")
        emptyDict.updateValue("test2", forKey: "key2")
        emptyDict.updateValue("test3", forKey: "key34")
        emptyDict.updateValue("test4", forKey: "key4")
        _ = API.createBody(dict: emptyDict)*/
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //registerKeyboardNotifications()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClick(_ sender: Any) {
        
        if (!(tfLogin.text?.isEmpty)! && !(tfPassword.text?.isEmpty)!)
        {
            API.APIRequest(type: Request.GET, url: RequestBuilder.Login(user: tfLogin.text!, mdp: tfPassword.text!), body:"") { (ok, data) in
                if (ok) {
                    let json = API.JSON(data: data)
                    if json.count > 1 {
                        User.shared.name = json["login"] as! String
                        User.shared.token = json["token"] as! String
                        User.shared.id = Int(json["ID"] as! String)!
                        DispatchQueue.main.async {
                            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                            let vc: UITabBarController = storyboard.instantiateViewController(withIdentifier: "app") as! UITabBarController
                            let appDelegate = UIApplication.shared.delegate as! AppDelegate
                            appDelegate.window?.rootViewController = vc
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self.present(Message.ErrorSimple(titre: "Erreur", contenu: "Mauvais couple Identifiant/Mot de passe"), animated: true, completion: nil)
                    }
                }
            }
        }
        
    }
    
}
