//
//  todayPage.swift
//  ACNH App
//
//  Created by Matt Luke on 2/4/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit


class todayPage: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var events = [Event(name: "Release Day!", desc: "Get ready to enjoy the island life!", imgURL: "https://cdn.gamer-network.net/2020/usgamer/Animal-Crossing-New-Horizons_screen_15.jpg/EG11/thumbnail/1920x1080/format/jpg/quality/65/animal-crossing-new-horizons-new-details-pax-east.jpg", dayStart: 20, monthStart: 3, year: 2020),Event(name: "Test Two", desc: "Test Description again", imgURL: "https://cdn.mos.cms.futurecdn.net/eeGai2QVBV8GvY7kdaWLfD.jpg", dayStart: 20, monthStart: 3, year: 2020)]
    var dates = [Date]()
    let date = Date()
    
   
    var isNotFirstTime = false
    let defaults = UserDefaults.standard
    let timeInterval = NSDate().timeIntervalSince1970
    
    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var eventTableView: UITableView!
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //Grabs default values
        isNotFirstTime = defaults.bool(forKey: "isNotFirstTime")
      //  islandNameText.text = defaults.string(forKey: "islandName")
      
        let name = defaults.string(forKey: "islandName")
        navBar.title = "Today on \(name ?? "Your Island")"
        
        //Sends query to Firebase and populates tableview
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM-dd"
//        let currentDate = dateFormat.string(from: date)
//        let currendYear = Calendar.current.component(.year, from: date)
//        query(startDate: currentDate, year: currendYear)
//        query(startDate: "01-01", year: (currendYear + 1))
        
        let appearance = UINavigationBarAppearance(idiom: .phone)
        appearance.largeTitleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.4143708882, green: 0.3625313006, blue: 0.298405092, alpha: 1)]
        appearance.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 0.4143708882, green: 0.3625313006, blue: 0.298405092, alpha: 1)]
        appearance.backgroundColor = #colorLiteral(red: 0.8785257936, green: 0.8486937881, blue: 0.791471839, alpha: 1)
        navigationItem.standardAppearance = appearance
        navigationItem.scrollEdgeAppearance = appearance
        
        
        eventTableView.dataSource = self
        eventTableView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        firstTimeCheck()
    }
    
    //Checks to see if it is the first launch for the user
    func firstTimeCheck()
    {
        if isNotFirstTime == false
        {
            defaults.set(true, forKey: "isNotFirstTime")
            isNotFirstTime = defaults.bool(forKey: "isNotFirstTime")
            performSegue(withIdentifier: "enterName", sender: self)
        }
    }
   
//
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(500)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (events.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! eventCell
            cell.set(event: events[indexPath.row])

            return cell
    }
    
    
    @IBAction func unwindToTodayPage(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as? IslandNameVC
        let name = sourceViewController?.islandName
        defaults.set(name, forKey: "islandName")
        navBar.title = "Today on \(name ?? "Your Island")"
    }
    
    
}
