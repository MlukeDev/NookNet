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
        let eventDate = "\(event.monthStart)/\(event.dayStart)/\(event.year)"
        dateLabel.text = eventDate
        eventTitle.text = event.name
        eventDescription.text = event.desc
        let url : URL = URL(string: event.imgURL) ?? URL(string: "https://firebasestorage.googleapis.com/v0/b/acnh-guide.appspot.com/o/Wallpapers%2Fk2-_cf527332-1589-4381-9765-f62cec08a67d.v1.jpg?alt=media&token=8d070fe4-d238-4bf5-a9d2-e9e7277c5a83")!
        eventImage.sd_setImage(with: url)
    }

}
