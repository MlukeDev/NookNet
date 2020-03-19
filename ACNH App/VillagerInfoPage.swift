//
//  VillagerInfoPage.swift
//  ACNH App
//
//  Created by Matt Luke on 3/17/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit

struct Villager {
    var name: String
    var birthday: String
    var favoritStyle: String
    var dislikedStyle: String
    var favoritColor: String
    var species: String
    var personality: String
}

class VillagerInfoPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    

    @IBOutlet weak var villagerImage: UIImageView!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var checkBoxView: UIView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameLabel: UILabel!
    
   
    
    var villager = Villager(name: "",
                            birthday: "",
                            favoritStyle: "",
                            dislikedStyle: "",
                            favoritColor: "",
                            species: "",
                            personality: "")
    
    var birthdayString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        nameLabel.text = villager.name
        villagerImage.image = UIImage(named: villager.name) ?? UIImage(named: "Placeholder?")
        
        
        
        villagerImage?.layer.cornerRadius = 15
        nameView.layer.cornerRadius = 15
        checkBoxView.layer.cornerRadius = 15
        infoView.layer.cornerRadius = 15
        tableView.layer.cornerRadius = 15
        
         let appearance = UINavigationBarAppearance(idiom: .phone)
               appearance.largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.4143708882, green: 0.3625313006, blue: 0.298405092, alpha: 1)]
               appearance.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.4143708882, green: 0.3625313006, blue: 0.298405092, alpha: 1)]
               appearance.backgroundColor = #colorLiteral(red: 0.8785257936, green: 0.8486937881, blue: 0.791471839, alpha: 1)
               navigationItem.standardAppearance = appearance
               navigationItem.scrollEdgeAppearance = appearance
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "villagerInfoCell", for: indexPath) as! VillagerInfoCell
        
        if indexPath.row == 0
        {
            cell.set(labelText: "Birthday", labelSubText: villager.birthday)
            return cell
        }
        else if indexPath.row == 1
        {
            cell.set(labelText: "Species", labelSubText: villager.species)
            return cell
        }
        else if indexPath.row == 2
        {
            cell.set(labelText: "Personality", labelSubText: villager.personality)
            return cell
        }
        else if indexPath.row == 3
        {
            cell.set(labelText: "Favorite Color", labelSubText: villager.favoritColor)
            return cell
        }
        else if indexPath.row == 4
        {
            cell.set(labelText: "Favorite Style", labelSubText: villager.favoritStyle)
            return cell
        }
        else if indexPath.row == 5
        {
            cell.set(labelText: "Disliked Style", labelSubText: villager.dislikedStyle)
            return cell
        }
        else
        {
            cell.set(labelText: "ERROR", labelSubText: "ERROR")
            return cell
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
