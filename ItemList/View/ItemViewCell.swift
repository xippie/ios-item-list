//
//  ItemViewCell.swift
//  ItemList
//
//  Created by Daniel on 09/09/2019.
//  Copyright © 2019 Daniel. All rights reserved.
//

import UIKit

class ItemViewCell: UITableViewCell {

    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
