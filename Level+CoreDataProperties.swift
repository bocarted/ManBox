//
//  Level+CoreDataProperties.swift
//  ManBox
//
//  Created by Таня on 28.05.17.
//  Copyright © 2017 Таня. All rights reserved.
//

import Foundation
import CoreData


class Level : NSManagedObject {

    @NSManaged var levelName: String
    @NSManaged var levelNumber: Int16
    @NSManaged var startManPosition: Data

}
