//
//  eventCell.swift
//  ACNH App
//
//  Created by Matt Luke on 2/4/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit
import SDWebImage

class eventCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var contentCell: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellView.layer.cornerRadius = 15

        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(event:Event)
    {
        let eventDate = "\(event.month)/\(event.day)/2020"
        dateLabel.text = eventDate
        eventTitle.text = event.name
        eventDescription.text = event.desc
        let url : URL = URL(string: event.imgURL) ?? URL(string: "https://images.nintendolife.com/f63528d62e99d/animal-crossing-new-horizons.900x.jpg")!
        eventImage.sd_setImage(with: url)
    }

}
