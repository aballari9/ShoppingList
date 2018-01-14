//
//  List.swift
//  ShoppingList
//
//  Created by Akhila Ballari on 10/3/17.
//  Copyright © 2017 Akhila Ballari. All rights reserved.
//

import UIKit

class ListItemCell: UITableViewCell {

    @IBOutlet weak var listItemName: UILabel!
    @IBOutlet weak var checkedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func decorate(listItem: String, check: Bool) {
        listItemName.text = listItem
        if check {
            checkedLabel.text = "good"
        } else {
            checkedLabel.text = ""
        }
    }

}
