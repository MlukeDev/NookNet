//
//  EncyclopediaVC.swift
//  ACNH App
//
//  Created by Matt Luke on 3/15/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit

class EncyclopediaVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var fishButton: UIButton!
    @IBOutlet weak var bugsButton: UIButton!
    @IBOutlet weak var headerTitle: UILabel!
    
    
    let collections =
    [
        CollectionType(name: "Fish", desc: "You have 0/0 collected", imgPath: "Placeholder?"),
        CollectionType(name: "Bugs", desc: "You have 0/0 collected", imgPath: "Placeholder?"),
        CollectionType(name: "All Creatures", desc: "You have 0/0 collected", imgPath: "Placeholder?")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.dataSource = self
        
        guard let descriptor = headerTitle.font?.fontDescriptor.withDesign(.rounded)
        else
        {
            print("Error")
            return
        }
        headerTitle.font = UIFont(descriptor: descriptor, size: 30)
        
        
        headerView.layer.cornerRadius = 15
                        fishButton.layer.cornerRadius = 10
                        bugsButton.layer.cornerRadius = 10
       
        let appearance = UINavigationBarAppearance(idiom: .phone)
               appearance.largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.4143708882, green: 0.3625313006, blue: 0.298405092, alpha: 1)]
               appearance.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.4143708882, green: 0.3625313006, blue: 0.298405092, alpha: 1)]
               appearance.backgroundColor = #colorLiteral(red: 0.8785257936, green: 0.8486937881, blue: 0.791471839, alpha: 1)
               navigationItem.standardAppearance = appearance
               navigationItem.scrollEdgeAppearance = appearance
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(138)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collections.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "encyclopediaCell", for: indexPath) as! Encyclopedia_Cell
          
        cell.set(collectionType: collections[indexPath.row])
        
          return cell
      }
    
    var collectionName = ""
    
    @IBAction func fishButton(_ sender: Any) {
        collectionName = "Fish Out Today"
        performSegue(withIdentifier: "encyclopediaToList", sender: self)
        
    }
    
    @IBAction func bugButton(_ sender: Any) {
        collectionName = "Bugs Out Today"
        performSegue(withIdentifier: "encyclopediaToList", sender: self)
        
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let index = indexPath.row
            collectionName = (collections[index] as CollectionType).name
            performSegue(withIdentifier: "encyclopediaToList", sender: self)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?)
        {
            if segue.destination is CollectionList
            {
                let vc = segue.destination as? CollectionList
                vc?.titleText = collectionName
            }
        }
 
}
