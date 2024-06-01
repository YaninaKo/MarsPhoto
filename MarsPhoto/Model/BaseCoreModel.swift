//
//  BaseCoreModel.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 31.05.2024.
//

import Foundation
import CoreData

protocol BaseCoreModel {
    static var viewContext: NSManagedObjectContext { get }
    func save() throws
    func delete() throws
}

extension BaseCoreModel where Self: NSManagedObject {
    static var viewContext: NSManagedObjectContext {
        CoreDataManager.shared.persistentStoreContainer.viewContext
    }
    
    func save() throws {
        try Self.viewContext.save()
    }
    
    func delete() throws {
        Self.viewContext.delete(self)
        try save()
    }
}
