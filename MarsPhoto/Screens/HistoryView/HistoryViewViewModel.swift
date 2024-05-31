//
//  HistoryVieViewModel.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 31.05.2024.
//

import Foundation
import CoreData

@MainActor
final class HistoryViewViewModel: NSObject, ObservableObject {

    @Published var filters: [FilterViewModel] = []

    private let fetchedResultsController: NSFetchedResultsController<Filter>

    var context: NSManagedObjectContext

    @Published var selectedFilter: FilterModel

    init(context: NSManagedObjectContext, selectedFilter: FilterModel) {
        self.context = context
        self.selectedFilter = selectedFilter

        fetchedResultsController = NSFetchedResultsController(
            fetchRequest: Filter.all,
            managedObjectContext: context,
            sectionNameKeyPath: nil,
            cacheName: nil)
        super.init()
        fetchedResultsController.delegate = self

        do {
            try fetchedResultsController.performFetch()
            guard let filters = fetchedResultsController.fetchedObjects else { return }
            self.filters = filters.map(FilterViewModel.init)
            print("Filters bla: \(filters)")
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
        selectedFilter = filter
    }
}

extension HistoryViewViewModel: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<any NSFetchRequestResult>) {
        guard let filters = controller.fetchedObjects as? [Filter] else { return }

        self.filters = filters.map(FilterViewModel.init)
    }
}
