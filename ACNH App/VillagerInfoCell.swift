//
//  VillagerInfoCell.swift
//  ACNH App
//
//  Created by Matt Luke on 3/18/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit

class VillagerInfoCell: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoSubLabel: UILabel!
    @IBOutlet weak var infoIcon: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    func set(labelText: String, labelSubText: String)
    {
        infoLabel.text = labelText
        infoSubLabel.text = labelSubText
        
        
        
    }
    
}
