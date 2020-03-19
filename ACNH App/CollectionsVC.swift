//
//  CollectionsVC.swift
//  ACNH App
//
//  Created by Matt Luke on 2/22/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit

class CollectionsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let collections =
    [
        CollectionType(name: "Fossils", desc: "You have 0/0 collected", imgPath: "Placeholder?"),
        CollectionType(name: "Artwork", desc: "You have 0/0 collected", imgPath: "Placeholder?"),
        CollectionType(name: "Gyroids", desc: "You have 0/0 collected", imgPath: "Placeholder?"),
        CollectionType(name: "Furniture", desc: "You have 0/0 collected", imgPath: "Placeholder?"),
        CollectionType(name: "Flowers", desc: "You have 0/0 collected", imgPath: "Placeholder?"),
        CollectionType(name: "Fruit", desc: "You have 0/0 collected", imgPath: "Placeholder?"),
        CollectionType(name: "Tools", desc: "You have 0/0 collected", imgPath: "Placeholder?"),
        CollectionType(name: "Emotes", desc: "You have 0/0 collected", imgPath: "Placeholder?"),
        CollectionType(name: "Music", desc: "You have 0/0 collected", imgPath: "Placeholder?"),
        CollectionType(name: "DIY Recipes", desc: "You have 0/0 collected", imgPath: "Placeholder?"),
        CollectionType(name: "Other", desc: "You have 0/0 collected", imgPath: "Placeholder?"),
    ]
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let appearance = UINavigationBarAppearance(idiom: .phone)
               appearance.largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.4143708882, green: 0.3625313006, blue: 0.298405092, alpha: 1)]
               appearance.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.4143708882, green: 0.3625313006, blue: 0.298405092, alpha: 1)]
               appearance.backgroundColor = #colorLiteral(red: 0.8785257936, green: 0.8486937881, blue: 0.791471839, alpha: 1)
               navigationItem.standardAppearance = appearance
               navigationItem.scrollEdgeAppearance = appearance
       
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "collectionCell", for: indexPath) as! CollectionCell
        
        cell.set(collectionType: collections[indexPath.row])
        
        return cell
    }
    
    var collectionName = ""
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        collectionName = (collections[index] as CollectionType).name
        performSegue(withIdentifier: "listSegue", sender: self)
//        print("Hello")
//        let vc = CollectionList()
//        vc.changeLabel(String: "Test")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is CollectionList
        {
            let vc = segue.destination as? CollectionList
            vc?.titleText = collectionName
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
