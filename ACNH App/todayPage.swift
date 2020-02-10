//
//  todayPage.swift
//  ACNH App
//
//  Created by Matt Luke on 2/4/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import UIKit

import Firebase

class todayPage: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var events = [Event]()
    var isNotFirstTime = false
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var islandNameText: UILabel!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
        isNotFirstTime = defaults.bool(forKey: "isNotFirstTime")
        print(isNotFirstTime)
        islandNameText.text = defaults.string(forKey: "islandName")
           observeEvents()
           eventTableView.dataSource = self
           eventTableView.delegate = self
           eventTableView.reloadData()
           
       }
    
    override func viewDidAppear(_ animated: Bool) {
        firstTimeCheck()
    }
    
    func firstTimeCheck()
    {
        if isNotFirstTime == false
        {
            defaults.set(true, forKey: "isNotFirstTime")
            isNotFirstTime = defaults.bool(forKey: "isNotFirstTime")
            performSegue(withIdentifier: "enterName", sender: self)
            print("IS FIRST TIME")
        }
    }
    
    @IBOutlet weak var eventTableView: UITableView!
    
    func observeEvents()
    {
        print("OBSERVE STARTED")
        let eventsRef = Database.database().reference().child("events")
        
        eventsRef.observe(.value, with: { snapshot in
            
            var tempEvents = [Event]()
            
            for child in snapshot.children {
                print("test")
                if let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String:Any],
                    let name = dict["name"] as? String,
                    let desc = dict["desc"] as? String,
                    let imgURL = dict["imgURL"] as? String,
                    let day = dict["day"] as? Int,
                    let month = dict["month"] as? Int
                    {
                            
                        let event = Event(name: name, desc: desc, imgURL: imgURL, day: day, month: month)
                    print("EVENT: \(event)")
                    tempEvents.append(event)
                    
                    
                }
                                
            }
            
            self.events = tempEvents
            self.eventTableView.reloadData()
            print(tempEvents)
            print("Hello")
            
        })
        print(events)
        print("OBSERVE ENDED")
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(500)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (events.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            print("B")
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! eventCell
            cell.set(event: events[indexPath.row])
            print("B")
            return cell
    }
    
    
    @IBAction func unwindToTodayPage(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as? IslandNameVC
        let name = sourceViewController?.islandName
        defaults.set(name, forKey: "islandName")
        islandNameText.text = name
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
