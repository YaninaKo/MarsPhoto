//
//  FilterModel.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 29.05.2024.
//

import Foundation
import CoreData

class FilterModel: Identifiable {
    let id: UUID
    var rover: String
    var camera: String
    var date: String

    init(id: UUID? = nil, rover: String, camera: String, date: String) {
        self.id = id ?? UUID()
        self.rover = rover
        self.camera = camera
        self.date = date
    }
}

struct FilterViewModel: Identifiable {
    private var filter: Filter

    init(filter: Filter) {
        self.filter = filter
    }

    var id: NSManagedObjectID {
        filter.objectID
    }

    var roverFullName: String {
        RoversCameras.rovers.first(where: { $0.id == filter.rover ?? "" })?.name ?? (filter.rover ?? "")
    }

    var cameraFullName: String {
        RoversCameras.rovers
            .first(where: { $0.id == filter.rover ?? "" })?
            .cameras
            .first(where: { $0.id == filter.camera ?? "" })?
            .fullName ?? (filter.camera ?? "")
    }

    var dateFormatted: String {
        filter.date?.convertToMonthDayYearString() ?? ""
    }

    var filterModel: FilterModel {
        FilterModel(id: filter.id, rover: filter.rover ?? "", camera: filter.camera ?? "", date: filter.date ?? "")
    }
}
