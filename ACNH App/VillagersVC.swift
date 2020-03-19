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
        let name: String?
        let birthday: birthday?
        let favoritStyle: String?
        let dislikedStyle: String?
        let favoritColor: String?
        let species: String?
        let personality: String?
        
        struct birthday: Decodable{
            let day: Int?
            let month: Int?
        }
        
    }
}



class VillagersVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    typealias villagerType = (
        name: String,
        favoriteStyle: String,
        dislikedStyle: String,
        favoriteColor: String,
        species: String,
        personality:String,
        birthday: String)
    
    var VillagerArray: [villagerType] = []
    var FilteredArray: [villagerType] = []
    var LowercasedArray: [villagerType] = []
    
    
    var villagerNames = [String]()

    
    
    //var filteredNames = [String]()

    let searchController = UISearchController(searchResultsController: nil)
    
    var isFiltering: Bool {
        
        
        
      return searchController.isActive && !isSearchBarEmpty
    }
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
            tableView.delegate = self
            tableView.dataSource = self
        
        
      
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

        let defaults = UserDefaults.standard
              villagerNames = defaults.stringArray(forKey: "VillagerNames") ?? villagerNames
        
        
        
        
        // 1
        searchController.searchResultsUpdater = self
        // 2
        searchController.obscuresBackgroundDuringPresentation = false
        // 3
        searchController.searchBar.placeholder = "Search Villagers"
        // 4
        navigationItem.searchController = searchController
        // 5
        definesPresentationContext = true
        
        let jsonUrlString = "https://api.nookdata.net/v1/acnh/villagers"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            
            do {
                self.VillagerArray = []
                self.villagerNames = []
                let villager = try JSONDecoder().decode(Villagers.self, from: data)
               
                let villagerCount = villager.data.count
                print("VILLAGERCOUNT: \(villager.data.count)")
                var i = 0
                
                while (villagerCount > i)
                {
//
//                    self.VillagerArray.append((
//                        villagerName: villager.data[i].name ?? "ERROR",
//                        villagerFavoriteStyle: villager.data[i].favoritStyle ?? "-",
//                        villagerDislikedStyle: villager.data[i].dislikedStyle ?? "-",
//                        villagerFavoriteColor: villager.data[i].favoritColor ?? "-",
//                        villagerSpecies: villager.data[i].species ?? "-",
//                        villagerPersonality: villager.data[i].personality ?? "-",
//                        vilagerBirthday: villager.data[i].birthday?.day ?? 0,
//                        villagerBirthMonth: villager.data[i].birthday?.month ?? 0,
//                        villagerBirthdayString: "\(villager.data[i].birthday?.day ?? 0) / \(villager.data[i].birthday?.month ?? 0)"))
                    
                    self.VillagerArray += [(villager.data[i].name ?? "ERROR",
                                            villager.data[i].favoritStyle ?? "-",
                                            villager.data[i].dislikedStyle ?? "-",
                                            villager.data[i].favoritColor ?? "-",
                                            villager.data[i].species ?? "-",
                                            villager.data[i].personality ?? "-",
                                            "\(villager.data[i].birthday?.day ?? 0) / \(villager.data[i].birthday?.month ?? 0)")]
                    
//                    self.VillagerArray.append((
//                        name: String(villager.data[i].name ?? "-"),
//                        favoriteStyle: String(villager.data[i].favoritStyle ?? "-"),
//                        dislikedStyle: String(villager.data[i].dislikedStyle ?? "-"),
//                        favoriteColor: String(villager.data[i].favoritColor ?? "-"),
//                        species: String(villager.data[i].species ?? "-"),
//                        personality: String(villager.data[i].personality ?? "-"),
//                        birthday: String(villager.data[i].birthday ?? "-")
//                        ))
                    
                    
                    
                    self.villagerNames.append(villager.data[i].name ?? "ERROR")
                    
                    i += 1
                    let defaults = UserDefaults.standard
                    defaults.set(self.villagerNames, forKey: "VillagerNames")
                }
                
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    
                    var x = 0
                    while (x < self.VillagerArray.count)
                    {
                        
                        self.LowercasedArray.append((
                            name: self.VillagerArray[x].name.lowercased(),
                            favoriteStyle: self.VillagerArray[x].favoriteStyle,
                            dislikedStyle: self.VillagerArray[x].dislikedStyle,
                            favoriteColor: self.VillagerArray[x].favoriteColor,
                            species: self.VillagerArray[x].species,
                            personality: self.VillagerArray[x].personality,
                            birthday: self.VillagerArray[x].birthday
                        ))
                        x += 1
                    }

//                    var a = 0
//                    while (a < self.VillagerArray.count)
//                    {
//                        self.LowercasedArray.append((LowercasedName: self.VillagerArray[a].villagerName,
//                                                LowercasedFavoriteStyle: self.VillagerArray[a].villagerFavoriteStyle,
//                                                LowercasedDislikedStyle: self.VillagerArray[a].villagerDislikedStyle,
//                                                LowercasedFavoriteColor: self.VillagerArray[a].villagerFavoriteColor,
//                                                LowercasedSpecies: self.VillagerArray[a].villagerSpecies,
//                                                LowercasedPersonality: self.VillagerArray[a].villagerPersonality,
//                                                LowercasedBirthday: self.VillagerArray[a].villagerBirthMonth,
//                                                LowercasedBirthMonth: self.VillagerArray[a].villagerBirthMonth,
//                                                LowercasedBirthdayString: self.VillagerArray[a].villagerBirthdayString))
//                        a += 1
//
//                    }

                    
                }
                
            } catch let jsonErr {
                print("Error: ", jsonErr)
            }
            
            
            
            //let dataAsString = String(data: data, encoding: .utf8)
            
//            print(dataAsString)
            
        }.resume()
        
        
        
        
        
        
        let appearance = UINavigationBarAppearance(idiom: .phone)
               appearance.largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.4143708882, green: 0.3625313006, blue: 0.298405092, alpha: 1)]
               appearance.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.4143708882, green: 0.3625313006, blue: 0.298405092, alpha: 1)]
               appearance.backgroundColor = #colorLiteral(red: 0.8785257936, green: 0.8486937881, blue: 0.791471839, alpha: 1)
               navigationItem.standardAppearance = appearance
               navigationItem.scrollEdgeAppearance = appearance
        
    }
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        if isFiltering
            {
                return FilteredArray.count
        }
        
        return VillagerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "villagerCell", for: indexPath) as! villagerCell
        
        let defaults = UserDefaults.standard
        villagerNames = defaults.stringArray(forKey: "VillagerNames") ?? villagerNames
        //print("VILLAGERNAMES: \(villagerNames.count)")
//        print("HELLO!!!!!\(villagerNames)")
        

        if isFiltering
        {
            cell.set(villagerName: FilteredArray[indexPath.row].name.capitalized)
        }
        else
        {

            
            cell.set(villagerName: villagerNames[indexPath.row])
            
        }
        
        
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
            
            if isFiltering
            {
                vc?.villager.name = FilteredArray[index].name.capitalized
                vc?.villager.favoritStyle = FilteredArray[index].favoriteStyle
                vc?.villager.dislikedStyle = FilteredArray[index].dislikedStyle
                vc?.villager.favoritColor = FilteredArray[index].favoriteColor
                vc?.villager.species = FilteredArray[index].species
                vc?.villager.personality = FilteredArray[index].personality
                vc?.villager.birthday = FilteredArray[index].birthday
            }
            else
            {
                vc?.villager.name = villagerNames[index]
                vc?.villager.favoritStyle = VillagerArray[index].favoriteStyle
                vc?.villager.dislikedStyle = VillagerArray[index].dislikedStyle
                vc?.villager.favoritColor = VillagerArray[index].favoriteColor
                vc?.villager.species = VillagerArray[index].species
                vc?.villager.personality = VillagerArray[index].personality
                vc?.villager.birthday = VillagerArray[index].birthday
                
            }
//            vc?.villager.favoritStyle = VillagerArray.favoriteStyle[index]
//            vc?.villager.dislikedStyle = VillagerArray.dislikedStyle[index]
//            vc?.villager.favoritColor = VillagerArray.favoriteColor[index]
//            vc?.villager.species = VillagerArray.species[index]
//            vc?.villager.personality = VillagerArray.personality[index]
//            vc?.villager.birthday = VillagerArray.birthday[index]
        }
    }
    
    
    func filterContentForSearchText(_ searchText: String) {
        FilteredArray = LowercasedArray.filter { (villager: villagerType) -> Bool in
        return villager.name.lowercased().contains(searchText.lowercased())
      }
      
      tableView.reloadData()
    }

    
//    func filterContentForSearchText(_ searchText: String)
//    {
//
////        FilteredArray = LowercasedArray.filter({ (lowerCasedNames: String) -> Bool in
////            return lowerCasedNames.contains(searchText.lowercased())
//
//        FilteredArray = LowercasedArray.filter({ (arg0) -> Bool in
//
//            let (name, favoriteStyle, dislikedStyle, favoriteColor, species, personality, birthday) = arg0
//            return LowercasedArray.contains(searchText.lowercased())
//        })
//
//        tableView.reloadData()
//    }
    
}

extension VillagersVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        
        filterContentForSearchText(searchBar.text!)
        
     
        
    }
}
