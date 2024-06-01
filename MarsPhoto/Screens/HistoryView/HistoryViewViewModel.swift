//
//  HistoryVieViewModel.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 31.05.2024.
//

import Foundation
import CoreData
import SwiftUI

@MainActor
final class HistoryViewViewModel: NSObject, ObservableObject {
    
    @Published var filters: [FilterViewModel] = []
    @Binding var selectedFilter: FilterModel
    var context: NSManagedObjectContext
    var navigationPath: Binding<NavigationPath>
    
    private let fetchedResultsController: NSFetchedResultsController<Filter>
    
    init(context: NSManagedObjectContext, selectedFilter: Binding<FilterModel>, navigationPath: Binding<NavigationPath>) {
        self.context = context
        self._selectedFilter = selectedFilter
        self.navigationPath = navigationPath
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: Filter.all,
                                                              managedObjectContext: context,
                                                              sectionNameKeyPath: nil,
                                                              cacheName: nil)
        
        super.init()
        
        fetchedResultsController.delegate = self
        
        do {
            try fetchedResultsController.performFetch()
            guard let filters = fetchedResultsController.fetchedObjects else { return }
            self.filters = filters.map(FilterViewModel.init)
        } catch {
            print(error)
        }
    }
    
    func deleteFilter(filterId: NSManagedObjectID) {
        do {
            guard let filter = try context.existingObject(with: filterId) as? Filter else { return }
            try filter.delete()
        } catch {
            print("Can not delete this filter: \(error.localizedDescription)")
        }
    }
    
    func setFilter(filter: FilterModel) {
        self.selectedFilter = filter
        navigationPath.wrappedValue.removeLast()
    }
}

extension HistoryViewViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<any NSFetchRequestResult>) {
        guard let filters = controller.fetchedObjects as? [Filter] else { return }
        
        self.filters = filters.map(FilterViewModel.init)
    }
}
