//
//  RoversCameras.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 30.05.2024.
//

import Foundation

struct RoversCameras {
    static let rovers: [RoverData] = [
        RoverData(id: "curiosity", name: "Curiosity", cameras: [
            CameraData(id: "fhaz", abbreviation: "FHAZ", fullName: "Front Hazard Avoidance Camera"),
            CameraData(id: "rhaz", abbreviation: "RHAZ", fullName: "Rear Hazard Avoidance Camera"),
            CameraData(id: "mast", abbreviation: "MAST", fullName: "Mast Camera"),
            CameraData(id: "chemcam", abbreviation: "CHEMCAM", fullName: "Chemistry and Camera Complex"),
            CameraData(id: "mahli", abbreviation: "MAHLI", fullName: "Mars Hand Lens Imager"),
            CameraData(id: "mardi", abbreviation: "MARDI", fullName: "Mars Descent Imager"),
            CameraData(id: "navcam", abbreviation: "NAVCAM", fullName: "Navigation Camera"),
        ]),
        RoverData(id: "opportunity", name: "Opportunity", cameras: [
            CameraData(id: "fhaz", abbreviation: "FHAZ", fullName: "Front Hazard Avoidance Camera"),
            CameraData(id: "rhaz", abbreviation: "RHAZ", fullName: "Rear Hazard Avoidance Camera"),
            CameraData(id: "navcam", abbreviation: "NAVCAM", fullName: "Navigation Camera"),
            CameraData(id: "pancam", abbreviation: "PANCAM", fullName: "Panoramic Camera"),
            CameraData(id: "minites", abbreviation: "MINITES", fullName: "Miniature Thermal Emission Spectrometer (Mini-TES)"),

        ]),
        RoverData(id: "spirit", name: "Spirit", cameras: [
            CameraData(id: "fhaz", abbreviation: "FHAZ", fullName: "Front Hazard Avoidance Camera"),
            CameraData(id: "rhaz", abbreviation: "RHAZ", fullName: "Rear Hazard Avoidance Camera"),
            CameraData(id: "navcam", abbreviation: "NAVCAM", fullName: "Navigation Camera"),
            CameraData(id: "pancam", abbreviation: "PANCAM", fullName: "Panoramic Camera"),
            CameraData(id: "minites", abbreviation: "MINITES", fullName: "Miniature Thermal Emission Spectrometer (Mini-TES)"),
        ]),
    ]
}
