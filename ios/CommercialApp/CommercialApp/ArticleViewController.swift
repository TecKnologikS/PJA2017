//
//  ArticleViewController.swift
//  CommercialApp
//
//  Created by Robin PAUQUET on 26/06/2017.
//  Copyright © 2017 Robin PAUQUET. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    @IBOutlet weak var tvTitle: UILabel!
    @IBOutlet weak var tbNumber: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var tvSmall: UILabel!
    @IBOutlet weak var tvLong: UITextView!
    
    var article:Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (article?.id != 0) {
            tvTitle.text = article?.name
            tbNumber.text = "1"
            tvSmall.text = article?.smallDesc
            tvLong.text = article?.about
            self.title = article?.name
        }
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func AjoutProduit(_ sender: Any) {
        
        tabBarController?.tabBar.items![1].badgeValue = "10"
        
    }
    
}

