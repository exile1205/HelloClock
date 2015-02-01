//
//  Friend.swift
//  HelloClock
//
//  Created by soslab on 2015/1/31.
//  Copyright (c) 2015年 nccu. All rights reserved.
//

import Foundation

class Friend {
    var name:String = ""
    var sex:String = ""
    var birthday:String = ""
    var image:String = ""
    var lineID:String = ""
    var habit:String = ""
    
    init(name:String, sex:String, birthday:String, image:String, lineID:String, habit:String) {
        self.name = name
        self.sex = sex
        self.birthday = birthday
        self.image = image
        self.lineID = lineID
        self.habit = habit
    }
}