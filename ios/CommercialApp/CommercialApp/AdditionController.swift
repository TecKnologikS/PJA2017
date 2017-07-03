//
//  AdditionController.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 30/06/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//


import UIKit

class AdditionController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var edtPromoCode: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    var cells:[AffichageCell] = []
    var id = 0
    let CELL_TITLE = "title"
    let CELL_INFO = "info"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cells.append(AffichageCell(_type: 1, _lib: "Loading", _val: ""))
        cells.append(AffichageCell(_type: 2, _lib: "Please", _val: "Wait"))
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        createTable()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        default:
            let cell :CellTitle = tableView.dequeueReusableCell(withIdentifier: CELL_TITLE)  as! CellTitle
            return cell
        }
        
        
    }
    
    
    func loadPanier() {
        API.APIRequest(type: Request.GET, url: RequestBuilder.Panier(), body:"") { (ok, data) in
            Panier.loadPanier(json: API.JSON(data: data))
            
            DispatchQueue.main.async {
                self.createTable()
            }
        }
    }
    
    func createTable() {
     //  PROMo if (Panier.shared.)
        cells.removeAll()
        cells.append(AffichageCell(_type: 1, _lib: "Addition", _val: ""))
        cells.append(AffichageCell(_type: 2, _lib: "Prix Total", _val: "\(Panier.shared.prix_total.roundTo(places: 2)) €"))
        cells.append(AffichageCell(_type: 2, _lib: "Réduction", _val: "\(Panier.shared.reduction_total.roundTo(places: 2)) €" ))
        cells.append(AffichageCell(_type: 2, _lib: "Prix Final", _val: "\(Panier.shared.prix_final.roundTo(places: 2)) €"))
        
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*self.present(alertController, animated: true, completion: nil)
         adire = ["\(self.verbes[(indexPath as NSIndexPath).row].baseVerbale)", "\(self.verbes[(indexPath as NSIndexPath).row].preterit)", "\(self.verbes[(indexPath as NSIndexPath).row].participePasse)"]
         speak(text: adire.removeFirst())*/
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cells.count
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*if let indexPath = self.tableView.indexPathForSelectedRow {
         let controller = segue.destination as! ArticleViewController
         let value = articles[indexPath.row]
         controller.article = articles[indexPath.row]
         }*/
    }
    
    @IBAction func btnAdd(_ sender: Any) {
        if ((edtPromoCode.text?.characters.count)! > 2) {
            var emptyDict: [String: String] = [:]
            emptyDict.updateValue("\(edtPromoCode.text ?? "" )", forKey: "code")
            API.APIRequest(type: Request.POST, url: RequestBuilder.AddPromo(), body:API.createBody(dict: emptyDict)) { (ok, data) in
                self.loadPanier()
            }
        }
    }
    
    
}
