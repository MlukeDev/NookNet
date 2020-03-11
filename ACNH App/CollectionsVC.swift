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
        CollectionType(name: "Fossils", desc: "You have 0/100 collected", imgPath: "FossilIcon"),
        CollectionType(name: "Artwork", desc: "You have 0/50 collected", imgPath: "ArtIcon"),
        CollectionType(name: "Gyroids", desc: "You have 0/150 collected", imgPath: "GyroidIcon"),
        CollectionType(name: "Furniture", desc: "You have 0/500 collected", imgPath: "LeafIcon"),
        CollectionType(name: "Flowers", desc: "You have 0/50 collected", imgPath: "FlowerIcon"),
        CollectionType(name: "Fruit", desc: "You have 0/10 collected", imgPath: "FruitIcon"),
        CollectionType(name: "Tools", desc: "You have 0/20 collected", imgPath: "ToolIcon"),
    ]
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        
           
       
        
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
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
