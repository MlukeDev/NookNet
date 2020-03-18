//
//  InfoVC.swift
//  ACNH App
//
//  Created by Matt Luke on 3/16/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit

class InfoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemView: UIView!
    
    @IBOutlet weak var collectedButton: UIButton!
    @IBOutlet weak var collectedView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        itemImage?.layer.cornerRadius = 15
        itemView.layer.cornerRadius = 15
        collectedView.layer.cornerRadius = 15
        tableView.layer.cornerRadius = 15
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! infoCell
        
        return cell
    }

}
