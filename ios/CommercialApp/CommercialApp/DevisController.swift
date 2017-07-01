//
//  DevisController.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 09/05/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import UIKit

class DevisController: UITableViewController {
    
    
    var devis:[Devis] = []
    
    let CELL_IDENTIFIER = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        API.APIRequest(type: Request.GET, url: RequestBuilder.Devis(), body:"") { (ok, data) in
            let json = API.listJSON(data: data)
            if json.count > 0 {
                self.devis = DevisBuilder.toListFromJSON(json: json)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
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
        let cell :CellDevis = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER)  as! CellDevis
       // print(tableView.restorationIdentifier ?? "")
       // print(tableView.accessibilityLabel ?? "")
        cell.tvNom.text = devis[indexPath.row].Societe
        cell.tvPrix.text = "€ \(devis[indexPath.row].PrixFinal)"
        cell.tvDate.text = "  \(devis[indexPath.row].DateCreation)"
        cell.tvClient.text = "\(devis[indexPath.row].Nom) \(devis[indexPath.row].Prenom) "
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*self.present(alertController, animated: true, completion: nil)
        adire = ["\(self.verbes[(indexPath as NSIndexPath).row].baseVerbale)", "\(self.verbes[(indexPath as NSIndexPath).row].preterit)", "\(self.verbes[(indexPath as NSIndexPath).row].participePasse)"]
        speak(text: adire.removeFirst())*/
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.devis.count
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let controller = segue.destination as! DevisViewController
            controller.id = devis[indexPath.row].ID
        }
    }



}
