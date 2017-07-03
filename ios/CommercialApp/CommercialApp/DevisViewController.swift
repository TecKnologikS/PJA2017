//
//  DevisViewController.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 30/06/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import UIKit

class DevisViewController: UITableViewController {
    
    
    var cells:[AffichageCell] = []
    var id = 0
    let CELL_TITLE = "title"
    let CELL_INFO = "info"
    let CELL_ART = "produit"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        API.APIRequest(type: Request.GET, url: RequestBuilder.Devi(id_dev: id), body:"") { (ok, data) in
            let json = API.JSON(data: data)
            if json.count > 0 {
                let devis = json["devis"] as! [String:Any]
                let articles = json["articles"] as! [[String:Any]]
                let promo = json["promo"] as! [[String:Any]]
                
                self.cells.removeAll()
                self.DevisToCells(devis: devis)
                self.ArticlesToCells(arts: articles)
                self.PromoToCells(promos: promo)
                self.Recapitulatif(devis: devis)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
        self.title = "Devis n°\(id)"
        cells.append(AffichageCell(_type: 1, _lib: "Loading", _val: ""))
        cells.append(AffichageCell(_type: 2, _lib: "Please", _val: "Wait"))
        
        self.tableView.dataSource = self
        
    }
    
    func ifExist(json:[String:Any], lib:String, Nom:String) {
        if ((json[lib] as! String).characters.count > 0) {
            cells.append(AffichageCell(_type: 2, _lib: Nom, _val: json[lib] as! String))
        }
    }
    
    func DevisToCells(devis:[String:Any]) {
        cells.append(AffichageCell(_type: 1, _lib: "Information", _val: ""))
        
        ifExist(json: devis, lib: "Societe",        Nom: "Société")
        ifExist(json: devis, lib: "Nom",            Nom: "Nom")
        ifExist(json: devis, lib: "Prenom",         Nom: "Prenom")
        ifExist(json: devis, lib: "Date_Creation",  Nom: "Création")
        ifExist(json: devis, lib: "Date_Validity",  Nom: "Validité")
        ifExist(json: devis, lib: "Siret",          Nom: "Siret")
        ifExist(json: devis, lib: "Tel",            Nom: "Tel")
        ifExist(json: devis, lib: "Fax",            Nom: "Fax")
        ifExist(json: devis, lib: "Email",          Nom: "Email")
        ifExist(json: devis, lib: "Adresse",        Nom: "Adresse")
        ifExist(json: devis, lib: "CP",             Nom: "CP")
        ifExist(json: devis, lib: "Ville",          Nom: "Ville")
        
    }
    
    
    func ArticlesToCells(arts:[[String:Any]]) {
        cells.append(AffichageCell(_type: 1, _lib: "Produits", _val: ""))
        for art in arts {
            cells.append(AffichageCell(_type: 3, _lib: "\(art["name"] as! String) (x\(art["Qte"] as! String))", _val: art["Prix_final"] as! String!))
        }
    }
    
    func PromoToCells(promos:[[String:Any]]) {
        if(promos.count > 0){
            cells.append(AffichageCell(_type: 1, _lib: "Promotion", _val: ""))
            for promo in promos {
                cells.append(AffichageCell(_type: 3, _lib: "\(promo["Nom"] as! String)", _val: promo["Code"] as! String!))
            }
        }
    }
    
    func Recapitulatif(devis:[String:Any]) {
        cells.append(AffichageCell(_type: 1, _lib: "Récapitulatif", _val: ""))
        cells.append(AffichageCell(_type: 2, _lib: "Prix", _val:  devis["Prix"] as! String))
        cells.append(AffichageCell(_type: 2, _lib: "Réduction", _val:  devis["Reduction"] as! String))
        cells.append(AffichageCell(_type: 2, _lib: "Prix final", _val:  devis["Prix_final"] as! String))
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch(cells[indexPath.row].type) {
        case 1:
            let cell :CellTitle = tableView.dequeueReusableCell(withIdentifier: CELL_TITLE)  as! CellTitle
            cell.tvTitle.text = cells[indexPath.row].libelle
            return cell
        case 2:
            let cell :CellInfo = tableView.dequeueReusableCell(withIdentifier: CELL_INFO)  as! CellInfo
            cell.tvLib.text = cells[indexPath.row].libelle
            cell.tvValues.text = cells[indexPath.row].value
            return cell
        case 3:
            let cell :CellArticles = tableView.dequeueReusableCell(withIdentifier: CELL_ART)  as! CellArticles
            cell.tvNom.text = cells[indexPath.row].libelle
            cell.tvPrix.text = cells[indexPath.row].value
            return cell
        default:
            let cell :CellTitle = tableView.dequeueReusableCell(withIdentifier: CELL_TITLE)  as! CellTitle
            return cell
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*self.present(alertController, animated: true, completion: nil)
         adire = ["\(self.verbes[(indexPath as NSIndexPath).row].baseVerbale)", "\(self.verbes[(indexPath as NSIndexPath).row].preterit)", "\(self.verbes[(indexPath as NSIndexPath).row].participePasse)"]
         speak(text: adire.removeFirst())*/
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cells.count
    }
    
    
    @IBAction func openMenu(_ sender: Any) {
        
        let refreshAlert = UIAlertController(title: "Actions supplémentaires", message: "Que voulez-vous faire ?", preferredStyle: UIAlertControllerStyle.actionSheet)

        
        let actionAppel = UIAlertAction(title: "Appeller le client", style: .default, handler: { (action: UIAlertAction!) in
            
        })
        actionAppel.setValue(UIImage(named: "ic_input"), forKey: "image")
        
        let actionPDF = UIAlertAction(title: "Envoyer le devis par courriel", style: .default, handler: { (action: UIAlertAction!) in
            
        })
        actionPDF.setValue(UIImage(named: "ic_input"), forKey: "image")
        
        let actionMaps = UIAlertAction(title: "Ouvrir dans maps", style: .default, handler: { (action: UIAlertAction!) in
            
        })
        actionMaps.setValue(UIImage(named: "ic_input"), forKey: "image")
        
        refreshAlert.addAction(actionAppel)
        refreshAlert.addAction(actionPDF)
        refreshAlert.addAction(actionMaps)
        refreshAlert.addAction(UIAlertAction(title: "Fermer le menu", style: .default, handler: nil))
        
        present(refreshAlert, animated: true, completion: nil)
    }
    
    
    
}
