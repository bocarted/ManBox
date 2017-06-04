//
//  MenuModel.swift
//  ManBox
//
//  Created by Таня on 04.06.17.
//  Copyright © 2017 Таня. All rights reserved.
//

import UIKit
import CoreData

class MenuModel {
    let context = (UIApplication.shared.delegate as! AppDelegate).dataController.managedObjectContext
    lazy var levelDataController = LevelDataController()
    
    
    
    func getCellTitles() -> [String] {
        var cellTitles = [String]()
        let levels : [Level] = getLevelsFromCoreData()
        for level in levels {
            cellTitles.append(level.levelName)
        }
        return cellTitles
    }
    
    func getLevelsFromCoreData() -> [Level] {
        var levels = try! context.fetch(requestLevels())
        if levels.count == 0 {
            levels = levelDataController.fillCoreData()
        }
        return levels
    }
    
    func requestLevels() -> NSFetchRequest<Level> {
        let requestLevels : NSFetchRequest = Level.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "levelNumber", ascending: true)
        requestLevels.sortDescriptors = [sortDescriptor]
        return requestLevels
    }
    
}
