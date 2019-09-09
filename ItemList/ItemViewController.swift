//
//  ItemViewController.swift
//  ItemList
//
//  Created by Daniel on 09/09/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit
import AlamofireImage

class ItemViewController: UIViewController {
    let url = "https://private-f0eea-mobilegllatam.apiary-mock.com/list"
    var presenter: ItemPresenter!
    var itemArray: Array<Item> = []
    @IBOutlet weak var itemTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = ItemPresenter(delegate: self)
        self.presenter.getItems(withURL: url)
        self.itemTableView.register(UINib(nibName: "ItemViewCell", bundle: nil), forCellReuseIdentifier: "itemCell")
        self.itemTableView.register(UINib(nibName: "ItemImgViewCell", bundle: nil), forCellReuseIdentifier: "itemImgCell")
    }
    
//    func prepareCell(withItem item: Item, forRowAt indexPath: IndexPath) -> UITableViewCell {
//        if item.image == "" {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemViewCell
//        } else {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "itemImgCell", for: indexPath) as! ItemImgViewCell
//        }
//    }

}

extension ItemViewController: ItemPresenterDelegate {
    func getItemsDidFinished(items: Array<Item>) {
        self.itemArray = items
        self.itemTableView.rowHeight = UITableView.automaticDimension
        self.itemTableView.estimatedRowHeight = 80
        self.itemTableView.reloadData()
    }
}

extension ItemViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = self.itemArray[indexPath.row]
        
        if item.image == "" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemViewCell
            cell.itemTitle.text = item.title != "" ? item.title : "No title"
            cell.itemDescription.text = item.description != "" ? item.description : "No description"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "itemImgCell", for: indexPath) as! ItemImgViewCell
            if let imageURL = URL(string: item.image), let placeholder = UIImage(named: "image-not-found") {
                cell.itemImage.af_setImage(withURL: imageURL, placeholderImage: placeholder)
            }
            cell.itemTitle.text = item.title != "" ? item.title : "No title"
            cell.itemDescription.text = item.description != "" ? item.description : "No description"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "detail", sender: self.itemArray[indexPath.row])
    }
    
    
}
