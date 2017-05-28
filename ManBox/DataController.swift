//
//  dataController.swift
//  ManBox
//
//  Created by Таня on 28.05.17.
//  Copyright © 2017 Таня. All rights reserved.
//

import Foundation
import CoreData

class DataController {
    
    var managedObjectContext: NSManagedObjectContext {
        let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        moc.persistentStoreCoordinator = self.persistentStoreCoordinator
        return moc
    }
    
    var managedObjectModel: NSManagedObjectModel {
        let modelURL = Bundle.main.url(forResource: "LevelCoreData", withExtension: "momd")!
        let mom = NSManagedObjectModel(contentsOf: modelURL)!
        return mom
    }
    
    var persistentStoreCoordinator: NSPersistentStoreCoordinator {
        let storeURL = self.applicationDocumentsDirectory.appendingPathComponent("LevelCoreData.sqlite")
        let options = [ NSMigratePersistentStoresAutomaticallyOption : true,
                        NSInferMappingModelAutomaticallyOption : true ]
        let psc = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL!, options: options)
        } catch {
            print("Unresolved error \(error)")
        }

        return psc
    }

    var applicationDocumentsDirectory: NSURL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.endIndex-1] as NSURL
    }
}

// CoreData manipulations
//let context = (UIApplication.shared.delegate as! AppDelegate).dataController.managedObjectContext
//
//func getAllLevels() -> [Level] {
//    let requestAll = NSFetchRequest<NSManagedObject>(entityName: "Level")
//    let levels = try! context.fetch(requestAll) as! [Level]
//    return levels
//}
//
//func addLevel(_ i : Int16) {
//    let level = NSEntityDescription.insertNewObject(forEntityName: "Level", into: context) as! Level
//    level.levelNumber = i
//    level.levelName = "Level " + String(i)
//    let pos = Position(x: Int(i), y: Int(i))
//    level.startManPosition = NSKeyedArchiver.archivedData(withRootObject: pos.codedPosition)
//    let a = [[1, 2], [2, 3]]
//    let aa = NSKeyedArchiver.archivedData(withRootObject: a)
//    level.blocks = aa
//}
//
//func printAllLevels() {
//    let levels = getAllLevels()
//    print(levels.count)
//    for level in levels {
//        let cp = NSKeyedUnarchiver.unarchiveObject(with: level.startManPosition) as! CodingPosition
//        let position = Position(withCodedPosition: cp)
//        let aa = NSKeyedUnarchiver.unarchiveObject(with: level.blocks) as! [[Int]]
//        print(level.levelName)
//        print(position)
//        print(aa)
//    }
//}
//
//func deleteAll() {
//    let levels = getAllLevels()
//    if levels.count > 0 {
//        for level in levels {
//            context.delete(level)
//        }
//    }
//}
    
