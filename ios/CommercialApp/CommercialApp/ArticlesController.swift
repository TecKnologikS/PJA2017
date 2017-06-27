//
//  ArticlesController.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 31/05/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import UIKit

class ArticlesController: UITableViewController, UISearchBarDelegate {
    
    var articles:[Article] = []
    @IBOutlet weak var search: UISearchBar!
    
    let CELL_IDENTIFIER = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PanierDevis.shared.setNavigation(nav: self.tabBarController!)
        PanierDevis.shared.reload()
        
        self.tableView.dataSource = self
        loadArticle(search: "")
        
    }
    
    func loadArticle(search:String) {
        if search.characters.count > 0 {
            API.APIRequest(type: Request.GET, url: RequestBuilder.Search(search: search), body:"") { (ok, data) in
                let json = API.listJSON(data: data)
                if json.count > 0 {
                    self.articles = ArticleBuilder.toListFromJSON(json: json)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        } else {
            API.APIRequest(type: Request.GET, url: RequestBuilder.Articles(id: "\(User.shared.id)", token: User.shared.token), body:"") { (ok, data) in
                let json = API.listJSON(data: data)
                if json.count > 0 {
                    self.articles = ArticleBuilder.toListFromJSON(json: json)
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :CellArticles = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER)  as! CellArticles
        
        cell.tvNom.text = articles[indexPath.row].name
        cell.tvPrix.text = "€ \(articles[indexPath.row].prix)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*self.present(alertController, animated: true, completion: nil)
         adire = ["\(self.verbes[(indexPath as NSIndexPath).row].baseVerbale)", "\(self.verbes[(indexPath as NSIndexPath).row].preterit)", "\(self.verbes[(indexPath as NSIndexPath).row].participePasse)"]
         speak(text: adire.removeFirst())*/
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = self.tableView.indexPathForSelectedRow {
            let controller = segue.destination as! ArticleViewController
            controller.article = articles[indexPath.row]
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        loadArticle(search: searchBar.text!)
        
    }
    
    
    
    
    
    
}
