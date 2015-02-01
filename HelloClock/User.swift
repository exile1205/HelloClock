//
//  User.swift
//  HelloClock
//
//  Created by soslab on 2015/1/31.
//  Copyright (c) 2015年 nccu. All rights reserved.
//

import Foundation
import CoreData

class User:NSManagedObject {
    
    @NSManaged var name:String!
    @NSManaged var image:NSData!
    @NSManaged var sex:String!
    @NSManaged var lineID:String!
    @NSManaged var nickname:String!
    
}
