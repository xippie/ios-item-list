//
//  ItemService.swift
//  ItemList
//
//  Created by Daniel on 09/09/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ItemService {
    var json: JSON!
    
    func getItems(withURL url: String, completion: @escaping (JSON) -> Void) {
        Alamofire.request(url).responseJSON { response in
            switch response.result {
            case .success(let data):
                completion(JSON(data))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
