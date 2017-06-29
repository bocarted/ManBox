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
    
    //MARK: Public API
    func getCellTitles() -> [String] {
        return levels.map {$0.levelName}
    }
    
    func getCellSubtitles() -> [String] {
        return levels.map {$0.levelDescription}
    }
    
    func getLevelAtIndex(_ index : Int) -> Level {
        return levels[index]
    }
    
    //MARK: Private Imp
    
    private let context = (UIApplication.shared.delegate as! AppDelegate).dataController.managedObjectContext
    private var levels : [Level] {
        var levels = try! context.fetch(requestLevels)
        if levels.count == 0 {
            levels = levelDataWriter.fillCoreData()
        }
        return levels
    }
    private lazy var levelDataWriter = LevelDataWriter()
    
    
    private var requestLevels : NSFetchRequest<Level> {
        let requestLevels : NSFetchRequest = Level.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "levelNumber", ascending: true)
        requestLevels.sortDescriptors = [sortDescriptor]
        return requestLevels
    }
    
}
