//
//  RoversData.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 30.05.2024.
//

import Foundation

struct RoversData {
    static let rovers: [Rover] = [
        Rover(id: "curiosity", name: "Curiosity", cameras: [
            Camera(id: "fhaz", abbreviation: "FHAZ", fullName: "Front Hazard Avoidance Camera"),
            Camera(id: "rhaz", abbreviation: "RHAZ", fullName: "Rear Hazard Avoidance Camera"),
            // Add more cameras here
        ]),
        Rover(id: "opportunity", name: "Opportunity", cameras: [
            Camera(id: "pancam", abbreviation: "PANCAM", fullName: "Panoramic Camera"),
            Camera(id: "minites", abbreviation: "MINITES", fullName: "Miniature Thermal Emission Spectrometer (Mini-TES)"),
            // Add more cameras here
        ]),
        // Add more rovers here
    ]
}
