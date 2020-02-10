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
    var day:Int
    var month:Int
    
    init(name:String, desc:String, imgURL:String, day:Int, month:Int) {
        self.name = name
        self.desc = desc
        self.imgURL = imgURL
        self.day = day
        self.month = month
        
    }
}
    
    
