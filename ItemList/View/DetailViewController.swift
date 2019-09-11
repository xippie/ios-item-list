//
//  DetailViewController.swift
//  ItemList
//
//  Created by Daniel on 09/09/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit
import AlamofireImage

class DetailViewController: UIViewController {

    var item: Item!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imageURL = URL(string: self.item.image), let placeholder = UIImage(named: "image-not-found") {
            self.itemImage.af_setImage(withURL: imageURL, placeholderImage: placeholder)
        }
        self.itemTitle.text = self.item.title != "" ? self.item.title : "No title"
        self.itemDescription.text = self.item.description != "" ? self.item.description : "No description"
    }
    
}
