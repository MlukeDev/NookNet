//
//  villagerCell.swift
//  ACNH App
//
//  Created by Matt Luke on 3/17/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit

class villagerCell: UITableViewCell {

    
    @IBOutlet weak var villagerLabel: UILabel!
    @IBOutlet weak var villagerImage: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        villagerImage?.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    
    func set(villagerName:String)
    {
        villagerLabel.text = villagerName
        
    }
    
}
