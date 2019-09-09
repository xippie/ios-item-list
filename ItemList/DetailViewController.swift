//
//  DetailViewController.swift
//  ItemList
//
//  Created by Daniel on 09/09/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var item: Item!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.itemTitle.text = self.item.title != "" ? self.item.title : "No title"
        self.itemDescription.text = self.item.description != "" ? self.item.description : "No description"
    }
    
}
