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
