//
//  Filter+Ext.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 31.05.2024.
//

import Foundation
import CoreData

extension Filter: BaseCoreModel {

    static var all: NSFetchRequest<Filter> {
        let request = Filter.fetchRequest()
        request.sortDescriptors = []
        return request
    }
    
}
