//
//  Encyclopedia Cell.swift
//  ACNH App
//
//  Created by Matt Luke on 3/15/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit

class Encyclopedia_Cell: UITableViewCell {

    
    @IBOutlet weak var itemIcon: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemDesc: UILabel!
    @IBOutlet weak var itemView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        itemIcon?.layer.cornerRadius = 15
        itemView.layer.cornerRadius = 15
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func set(collectionType:CollectionType)
    {
        
       
        
        itemLabel.text = collectionType.name
        itemDesc.text = collectionType.desc
        itemIcon.image = UIImage(named: collectionType.imgPath)
        
        if let roundedHeadlineDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .headline).withDesign(.rounded) {
            // Create the rounded font
            let roundedFont = UIFont(descriptor: roundedHeadlineDescriptor, size: 30)
            itemLabel.font = roundedFont
        }
        

        
        
    }
    
}
