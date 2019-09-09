//
//  ItemPresenter.swift
//  ItemList
//
//  Created by Daniel on 09/09/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol ItemPresenterDelegate: class {
    func getItemsDidFinished(items: Array<Item>)
}

class ItemPresenter {
    var delegate: ItemPresenterDelegate
    let itemService: ItemService = ItemService()
    
    init(delegate: ItemPresenterDelegate) {
        self.delegate = delegate
    }
    
    func getItems(withURL url: String) {

        self.itemService.getItems(withURL: url, completion: { json in
            var items: Array<Item> = []
            
            for value in json.array! {
                let item = Item(
                    title: value["title"].stringValue,
                    description: value["description"].stringValue,
                    image: value["image"].stringValue
                )
                items.append(item)
            }
            self.delegate.getItemsDidFinished(items: items)
        })
    }
}
