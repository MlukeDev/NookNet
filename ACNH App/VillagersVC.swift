//
//  VillagersVC.swift
//  ACNH App
//
//  Created by Matt Luke on 3/17/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit

struct Villagers: Decodable{
    let data: [data]
    
    struct data: Decodable{
        let name: String
        let birthday: birthday
        let favoritStyle: String
        let dislikedStyle: String
        let favoritColor: String
        let species: String
        let personality: String
        
        struct birthday: Decodable{
            let day: Int
            let month: Int
        }
        
    }
}

class VillagersVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var villagerNames = [String]()
    var villagerFavoritStyle = [String]()
    var villagerDislikedStyle = [String]()
    var villagerfavoriteColor = [String]()
    var villagerSpecies = [String]()
    var villagerPersonality = [String]()
    var villagerBirthday = [Int]()
    var villagerBirthMonth = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        
        villagerNames = defaults.stringArray(forKey: "VillagerNames") ?? villagerNames
        
        
        tableView.delegate = self
        tableView.dataSource = self
    
        
        
        let search = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = search
        
        let jsonUrlString = "https://api.nookdata.net/v1/acnh/villagers"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            
            do {
                
                let villager = try JSONDecoder().decode(Villagers.self, from: data)
                print(villager.data[0].name)
                
                let villagerCount = villager.data.count
                var i = 0
                self.villagerNames = []
                while (villagerCount > i)
                {
                    self.villagerNames.append(villager.data[i].name)
                    self.villagerFavoritStyle.append(villager.data[i].favoritStyle)
                    self.villagerDislikedStyle.append(villager.data[i].dislikedStyle)
                    self.villagerfavoriteColor.append(villager.data[i].favoritColor)
                    self.villagerSpecies.append(villager.data[i].species)
                    self.villagerPersonality.append(villager.data[i].personality)
                    self.villagerBirthday.append(villager.data[i].birthday.day)
                    self.villagerBirthMonth.append(villager.data[i].birthday.month)
                    i += 1
                    defaults.set(self.villagerNames, forKey: "VillagerNames")
                }
                
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                    
                }
                
            } catch let jsonErr {
                print("Error: ", jsonErr)
            }
            
            print(self.villagerNames)
            
            //let dataAsString = String(data: data, encoding: .utf8)
            
//            print(dataAsString)
            
        }.resume()
        
        
        
    }
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Hello")
        return villagerNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "villagerCell", for: indexPath) as! villagerCell
        
        let defaults = UserDefaults.standard
//        print("HELLO!!!!!\(villagerNames)")
//        villagerNames = defaults.stringArray(forKey: "VillagerNames") ?? villagerNames
//
        villagerNames = defaults.stringArray(forKey: "VillagerNames") ?? villagerNames
        
        cell.set(villagerName: villagerNames[indexPath.row])
        
        return cell
    }
    
    var index = 0
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "villagerInfo", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is VillagerInfoPage
        {
            let vc = segue.destination as? VillagerInfoPage
            vc?.villager.name = villagerNames[index]
            vc?.villager.favoritStyle = villagerFavoritStyle[index]
            vc?.villager.dislikedStyle = villagerDislikedStyle[index]
            vc?.villager.favoritColor = villagerfavoriteColor[index]
            vc?.villager.species = villagerSpecies[index]
            vc?.villager.personality = villagerPersonality[index]
            vc?.villager.birthday.day = villagerBirthday[index]
            vc?.villager.birthday.month = villagerBirthMonth[index]
        }
    }
    
    
    
}
