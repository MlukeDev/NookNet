//
//  Collectible Cell.swift
//  ACNH App
//
//  Created by Matt Luke on 3/15/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit

class Collectible_Cell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var itemDesc: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        itemImage?.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
