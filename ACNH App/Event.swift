//
//  Event.swift
//  ACNH App
//
//  Created by Matt Luke on 2/8/20.
//  Copyright © 2020 MlukeApps. All rights reserved.
//

import Foundation



class Event
{
    var name:String
    var desc:String
    var imgURL:String
    var dayStart:Int
    var monthStart:Int
    var year:Int
    
    init(name:String, desc:String, imgURL:String, dayStart:Int, monthStart:Int, year: Int)
        {
            self.year = year
            self.name = name
            self.desc = desc
            self.imgURL = imgURL
            self.dayStart = dayStart
            self.monthStart = monthStart
        }
    
}
    
    
