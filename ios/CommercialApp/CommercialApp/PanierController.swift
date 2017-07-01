//
//  PanierController.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 30/06/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import UIKit

class PanierController: UITableViewController {
    
    @IBOutlet weak var btnSuivant: UIBarButtonItem!
    
    var devis:[Devis] = []
    
    let CELL_IDENTIFIER = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPanier()
        self.tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :CellPanierArt = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER)  as! CellPanierArt
        // print(tableView.restorationIdentifier ?? "")
        // print(tableView.accessibilityLabel ?? "")
        //  cell.tvNom.text = devis[indexPath.row].Societe
        //   cell.tvPrix.text = "€ \(devis[indexPath.row].PrixFinal)"
        cell.tvNom.text = Panier.shared.articles[indexPath.row].name
        cell.tvPrix.text = "€ \(Panier.shared.articles[indexPath.row].prixFinal.roundTo(places: 2))"
        cell.edtCount.text = "\(Panier.shared.articles[indexPath.row].qte)"
        cell.btnDelete.tag = indexPath.row
        cell.edtCount.tag = indexPath.row
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*self.present(alertController, animated: true, completion: nil)
         adire = ["\(self.verbes[(indexPath as NSIndexPath).row].baseVerbale)", "\(self.verbes[(indexPath as NSIndexPath).row].preterit)", "\(self.verbes[(indexPath as NSIndexPath).row].participePasse)"]
         speak(text: adire.removeFirst())*/
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Panier.shared.articles.count
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*if let indexPath = self.tableView.indexPathForSelectedRow {
         let controller = segue.destination as! ArticleViewController
         let value = articles[indexPath.row]
         controller.article = articles[indexPath.row]
         }*/
    }
    
    func loadPanier() {
        API.APIRequest(type: Request.GET, url: RequestBuilder.Panier(), body:"") { (ok, data) in
            Panier.loadPanier(json: API.JSON(data: data))
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                //self.btnSuivant.title = "Suivant (\(Panier.shared.prix_final) €)"
            }
        }
    }
    @IBAction func deleteItem(_ sender: Any) {
        let id = (sender as! UIButton).tag
        var emptyDict: [String: String] = [:]
        emptyDict.updateValue("\(Panier.shared.articles[id].id)", forKey: "id") //TODO recuperer id article
        API.APIRequest(type: Request.POST, url: RequestBuilder.RemoveToBasket(), body:API.createBody(dict: emptyDict)) { (ok, data) in
            self.loadPanier()
        }
    }
    
    
    @IBAction func countChanged(_ sender: Any) {
        let id = (sender as! UITextField).tag
        var emptyDict: [String: String] = [:]
        emptyDict.updateValue("\(Panier.shared.articles[id].id)", forKey: "id") //TODO recuperer id article
        emptyDict.updateValue("\((sender as! UITextField).text ?? "1" )", forKey: "qte")
        API.APIRequest(type: Request.POST, url: RequestBuilder.UpdateToBasket(), body:API.createBody(dict: emptyDict)) { (ok, data) in
            self.loadPanier()
        }
    }
    
    
}
