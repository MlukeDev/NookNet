//
//  todayPage.swift
//  ACNH App
//
//  Created by Matt Luke on 2/4/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit


class todayPage: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var events = [Event(name: "Test One", desc: "Test Description", imgURL: "https://github.com/MlukeDev/NookNet/blob/master/ACNH%20App/Assets.xcassets/Placeholder.imageset/Animal_Crossing_New_Horizons_-_Screenshot_06.png?raw=true", dayStart: 10, monthStart: 10, year: 2020),Event(name: "Test Two", desc: "Test Description again", imgURL: "https://github.com/MlukeDev/NookNet/blob/master/ACNH%20App/Assets.xcassets/Holidays/Toy%20Day.imageset/ToyDay-1.png?raw=true", dayStart: 20, monthStart: 3, year: 2020)]
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
        let currentDate = dateFormat.string(from: date)
        let currendYear = Calendar.current.component(.year, from: date)
//        query(startDate: currentDate, year: currendYear)
//        query(startDate: "01-01", year: (currendYear + 1))
        
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
    
    
    //Sends query to Firebase
    //    func query(startDate: String, year: Int)
    //    {
    //    let eventsRef = Database.database().reference().child("1uyNqbIpwZ_kQcHUY2eP7W8HaxupiRh_VJy7SWkSBmbc").child("events_en_na")
    //
    //    let queryRef = eventsRef.queryOrdered(byChild: "dateString")
    //        .queryStarting(atValue: startDate)
    //        .queryEnding(atValue: "12-31")
    //
    //    queryRef.observe(.value, with: { snapshot in
    //        for child in snapshot.children {
    //            if let childSnapshot = child as? DataSnapshot,
    //                let dict = childSnapshot.value as? [String:Any],
    //                let name = dict["name"] as? String,
    //                let desc = dict["desc"] as? String,
    //                let imgURL = dict["imgURL"] as? String,
    //                let dayStart = dict["dayStart"] as? Int,
    //                let monthStart = dict["monthStart"] as? Int
    //                {
    //                    let event = Event(name: name, desc: desc, imgURL: imgURL, dayStart: dayStart, monthStart: monthStart, year: year)
    //
    //                    self.events.append(event)
    //                }
    //            }
    //        self.eventTableView.reloadData()
    //        })
    //    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
