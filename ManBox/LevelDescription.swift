//
//  LevelDescription.swift
//  ManBox
//
//  Created by Tatiana Bocharnikova on 27.05.17.
//  Copyright © 2017 Таня. All rights reserved.
//

import Foundation
import CoreData

class Level : NSManagedObject {
    @NSManaged var levelName : String
    @NSManaged var startManPosition : Data
    @NSManaged var levelDescription : String
    @NSManaged var blocks : Data
//    @NSManaged var blocks : [CodingPosition]
//    @NSManaged var roomHeight : Int16
//    @NSManaged var roomWidth : Int16
    

}

