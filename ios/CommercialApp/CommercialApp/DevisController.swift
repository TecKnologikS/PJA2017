//
//  DevisController.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 09/05/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import UIKit

class DevisController: UITableViewController {
    
    let CELL_IDENTIFIER = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
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
        cell.tvTitle!.text = "COUCOU"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*self.present(alertController, animated: true, completion: nil)
        adire = ["\(self.verbes[(indexPath as NSIndexPath).row].baseVerbale)", "\(self.verbes[(indexPath as NSIndexPath).row].preterit)", "\(self.verbes[(indexPath as NSIndexPath).row].participePasse)"]
        speak(text: adire.removeFirst())*/
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }


}
