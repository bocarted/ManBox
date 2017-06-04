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


    
