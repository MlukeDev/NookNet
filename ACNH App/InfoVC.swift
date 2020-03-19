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
        
        
        let appearance = UINavigationBarAppearance(idiom: .phone)
               appearance.largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.4143708882, green: 0.3625313006, blue: 0.298405092, alpha: 1)]
               appearance.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.4143708882, green: 0.3625313006, blue: 0.298405092, alpha: 1)]
               appearance.backgroundColor = #colorLiteral(red: 0.8785257936, green: 0.8486937881, blue: 0.791471839, alpha: 1)
               navigationItem.standardAppearance = appearance
               navigationItem.scrollEdgeAppearance = appearance
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
