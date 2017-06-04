//
//  LevelData+CoreDataProperties.swift
//  ManBox
//
//  Created by Таня on 04.06.17.
//  Copyright © 2017 Таня. All rights reserved.
//

import Foundation
import CoreData


extension Level {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Level> {
        return NSFetchRequest<Level>(entityName: "Level");
    }

    @NSManaged public var blocks: Data
    @NSManaged public var levelDescription: String
    @NSManaged public var levelName: String
    @NSManaged public var levelNumber: Int32
    @NSManaged public var roomHeight: Int32
    @NSManaged public var roomWidth: Int32
    @NSManaged public var startBoxPosition: Data
    @NSManaged public var startManPosition: Data
    @NSManaged public var winPosition: Data

}
