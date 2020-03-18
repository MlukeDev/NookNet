//
//  infoCell.swift
//  ACNH App
//
//  Created by Matt Luke on 3/16/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit

class infoCell: UITableViewCell {

    @IBOutlet weak var infoImage: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var moreInfoLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
