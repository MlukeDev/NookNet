//
//  CollectionList.swift
//  ACNH App
//
//  Created by Matt Luke on 3/14/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit

class CollectionList: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var titleText:String = ""

    @IBOutlet weak var NavBar: UINavigationItem!
    @IBOutlet weak var TableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NavBar?.title = titleText
        
        TableView.dataSource = self
        TableView.delegate = self
        
        let appearance = UINavigationBarAppearance(idiom: .phone)
               appearance.largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.4143708882, green: 0.3625313006, blue: 0.298405092, alpha: 1)]
               appearance.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.4143708882, green: 0.3625313006, blue: 0.298405092, alpha: 1)]
               appearance.backgroundColor = #colorLiteral(red: 0.8785257936, green: 0.8486937881, blue: 0.791471839, alpha: 1)
               navigationItem.standardAppearance = appearance
               navigationItem.scrollEdgeAppearance = appearance
        
        let search = UISearchController(searchResultsController: nil)
        self.navigationItem.searchController = search
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Collectible Cell", for: indexPath) as! Collectible_Cell
        
        
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "infoPage", sender: self)
    }
    
}
