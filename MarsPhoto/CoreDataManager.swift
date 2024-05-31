//
//  DataController.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 31.05.2024.
//

import CoreData
import Foundation

class CoreDataManager {
    
    let persistentStoreContainer: NSPersistentContainer
    static let shared = CoreDataManager()

    private init() {
        persistentStoreContainer = NSPersistentContainer(name: "MarsPhoto")

        persistentStoreContainer.loadPersistentStores { description, error in
            if let error {
                print("Unable to initialize Core Data: \(error.localizedDescription)")
            }
        }
    }
}
