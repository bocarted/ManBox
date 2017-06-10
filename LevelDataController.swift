//
//  LevelDataController.swift
//  ManBox
//
//  Created by Таня on 04.06.17.
//  Copyright © 2017 Таня. All rights reserved.
//

import UIKit
import CoreData

class LevelDataController {
    let context = (UIApplication.shared.delegate as! AppDelegate).dataController.managedObjectContext
    
    func fillCoreData () -> [Level] {
        var levels = [Level]()
        levels.append(addLevel1())
        levels.append(addLevel2())
        levels.append(addLevel3())
        levels.append(addLevel4())
        
        return levels
    }
    func addLevel1() -> Level {
        let level = NSEntityDescription.insertNewObject(forEntityName: "Level", into: context) as! Level
        var blocks = Set<Position>()
        blocks.insert(Position(x: 1, y: 0))
        blocks.insert(Position(x: 2, y: 1))
        blocks.insert(Position(x: 2, y: 2))
        level.blocks = NSKeyedArchiver.archivedData(withRootObject: blocks)
        level.levelDescription = "👸: Honey, bring me 💍!\n" + "😍: I'm on my way!"
        level.levelNumber = 0
        level.levelName = "Level 1"
        level.roomHeight = 4
        level.roomWidth = 4
        let startManPosition = Position(x: 0, y: 0)
        level.startManPosition = NSKeyedArchiver.archivedData(withRootObject: startManPosition)
        let startBoxPosition = Position(x: 1, y: 2)
        level.startBoxPosition = NSKeyedArchiver.archivedData(withRootObject: startBoxPosition)
        let winPosition = Position(x: 3, y: 3)
        level.winPosition = NSKeyedArchiver.archivedData(withRootObject: winPosition)
        try! context.save()
        return level
    }
    func addLevel2() -> Level {
        let level = NSEntityDescription.insertNewObject(forEntityName: "Level", into: context) as! Level
        var blocks = Set<Position>()
        blocks.insert(Position(x: 1, y: 1))
        blocks.insert(Position(x: 4, y: 3))
        blocks.insert(Position(x: 1, y: 0))
        blocks.insert(Position(x: 1, y: 3))
        level.blocks = NSKeyedArchiver.archivedData(withRootObject: blocks)
        level.levelDescription = "👸: Honey, bring me that Ring!\n" + "😍: I'm on my way!"
        level.levelNumber = 1
        level.levelName = "Level 2"
        level.roomHeight = 5
        level.roomWidth = 5
        let startManPosition = Position(x: 0, y: 0)
        level.startManPosition = NSKeyedArchiver.archivedData(withRootObject: startManPosition)
        let startBoxPosition = Position(x: 2, y: 3)
        level.startBoxPosition = NSKeyedArchiver.archivedData(withRootObject: startBoxPosition)
        let winPosition = Position(x: 4, y: 4)
        level.winPosition = NSKeyedArchiver.archivedData(withRootObject: winPosition)
        try! context.save()
        return level
    }
    func addLevel3() -> Level {
        let level = NSEntityDescription.insertNewObject(forEntityName: "Level", into: context) as! Level
        var blocks = Set<Position>()
        blocks.insert(Position(x: 1, y: 0))
        blocks.insert(Position(x: 2, y: 1))
        blocks.insert(Position(x: 2, y: 2))
        level.blocks = NSKeyedArchiver.archivedData(withRootObject: blocks)
        level.levelDescription = "👸: Honey, bring me 💍!\n" + "😍: I'm on my way!"
        level.levelNumber = 2
        level.levelName = "Level 3"
        level.roomHeight = 4
        level.roomWidth = 4
        let startManPosition = Position(x: 0, y: 0)
        level.startManPosition = NSKeyedArchiver.archivedData(withRootObject: startManPosition)
        let startBoxPosition = Position(x: 1, y: 2)
        level.startBoxPosition = NSKeyedArchiver.archivedData(withRootObject: startBoxPosition)
        let winPosition = Position(x: 3, y: 0)
        level.winPosition = NSKeyedArchiver.archivedData(withRootObject: winPosition)
        try! context.save()
        return level
    }
    func addLevel4() -> Level {
        let level = NSEntityDescription.insertNewObject(forEntityName: "Level", into: context) as! Level
        var blocks = Set<Position>()
        blocks.insert(Position(x: 2, y: 1))
        blocks.insert(Position(x: 4, y: 3))
        blocks.insert(Position(x: 1, y: 0))
        blocks.insert(Position(x: 1, y: 3))
        level.blocks = NSKeyedArchiver.archivedData(withRootObject: blocks)
        level.levelDescription = "👸: Honey, bring me that Ring!\n" + "😍: I'm on my way!"
        level.levelNumber = 3
        level.levelName = "Level 4"
        level.roomHeight = 5
        level.roomWidth = 7
        let startManPosition = Position(x: 0, y: 0)
        level.startManPosition = NSKeyedArchiver.archivedData(withRootObject: startManPosition)
        let startBoxPosition = Position(x: 2, y: 3)
        level.startBoxPosition = NSKeyedArchiver.archivedData(withRootObject: startBoxPosition)
        let winPosition = Position(x: 4, y: 4)
        level.winPosition = NSKeyedArchiver.archivedData(withRootObject: winPosition)
        try! context.save()
        return level
    }
    
}


