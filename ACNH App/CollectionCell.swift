//
//  CollectionCell.swift
//  ACNH App
//
//  Created by Matt Luke on 2/22/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit

class CollectionCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = 15
        iconView.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(collectionType:CollectionType)
    {
        titleLabel.text = collectionType.name
        descLabel.text = collectionType.desc
        iconView.image = UIImage(named: collectionType.imgPath)
    }


}
