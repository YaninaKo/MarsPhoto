//
//  FilterModel.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 29.05.2024.
//

import Foundation

class FilterModel: Identifiable {
    let id = UUID()
    var rover: String
    var camera: String
    var date: String

    init(rover: String, camera: String, date: String) {
        self.rover = rover
        self.camera = camera
        self.date = date
    }
}
