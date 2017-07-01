//
//  ValidateController.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 30/06/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import UIKit

class ValidateController: UIViewController {
    
    @IBOutlet weak var tfSociete: UITextField!
    @IBOutlet weak var tfSiret: UITextField!
    @IBOutlet weak var tfTel: UITextField!
    @IBOutlet weak var tfFax: UITextField!
    @IBOutlet weak var tfAdresse: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfCP: UITextField!
    @IBOutlet weak var tfVille: UITextField!
    @IBOutlet weak var tfNom: UITextField!
    @IBOutlet weak var tfPrenom: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Validation(_ sender: Any) {
        if ((tfSociete.text?.characters.count)! > 0 &&
            (tfEmail.text?.characters.count)! > 0 &&
            (tfNom.text?.characters.count)! > 0 &&
            (tfPrenom.text?.characters.count)! > 0) {
            
            var emptyDict: [String: String] = [:]
            emptyDict.updateValue(tfSociete.text!,      forKey: "societe")
            emptyDict.updateValue("",                   forKey: "siret") //Pas de scroll donc on affiche pas pour l'instant
            emptyDict.updateValue(tfTel.text!,          forKey: "tel")
            emptyDict.updateValue("",                   forKey: "fax") //Pas de scroll donc on affiche pas pour l'instant
            emptyDict.updateValue(tfEmail.text!,        forKey: "email")
            emptyDict.updateValue(tfAdresse.text!,      forKey: "adresse")
            emptyDict.updateValue(tfCP.text!,           forKey: "cp")
            emptyDict.updateValue(tfVille.text!,        forKey: "ville")
            emptyDict.updateValue(tfNom.text!,          forKey: "nom")
            emptyDict.updateValue(tfPrenom.text!,       forKey: "prenom")
            API.APIRequest(type: Request.POST, url: RequestBuilder.Validate(), body:API.createBody(dict: emptyDict)) { (ok, data) in
                API.APIRequest(type: Request.GET, url: RequestBuilder.Panier(), body:"") { (ok, data) in
                    Panier.loadPanier(json: API.JSON(data: data))
                    DispatchQueue.main.async {
                        self.navigationController?.popToRootViewController(animated: true)//GO TO PANIER
                    }
                }            }
        } else {
            //ERROR BITCH
        }
    }
    
}
