//
//  MockData.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 29.05.2024.
//

import Foundation

struct MockData {
    static let samplePhotoItem = PhotoItem(id: 123, roverName: "Curiosity", camera: "FHAZ", cameraFullName: "Front Hazard Avoidance Camera", earthDate: "2015-6-3", imageSrc: "https://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01004/opgs/edr/fcam/FLB_486615455EDR_F0481570FHAZ00323M_.JPG")
    static let samplePhotoItem2 = PhotoItem(id: 456, roverName: "Curiosity", camera: "FHAZ", cameraFullName: "Front Hazard Avoidance Camera", earthDate: "2015-6-3", imageSrc: "https://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01004/opgs/edr/fcam/FLB_486615455EDR_F0481570FHAZ00323M_.JPG")
    static let samplePhotoItem3 = PhotoItem(id: 789, roverName: "Curiosity", camera: "FHAZ", cameraFullName: "Front Hazard Avoidance Camera", earthDate: "2015-6-3", imageSrc: "https://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01004/opgs/edr/fcam/FLB_486615455EDR_F0481570FHAZ00323M_.JPG")
    static let samplePhotoItem4 = PhotoItem(id: 101, roverName: "Curiosity", camera: "FHAZ", cameraFullName: "Front Hazard Avoidance Camera", earthDate: "2015-6-3", imageSrc: "https://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01004/opgs/edr/fcam/FLB_486615455EDR_F0481570FHAZ00323M_.JPG")


    static let photoItems = [samplePhotoItem, samplePhotoItem2, samplePhotoItem3, samplePhotoItem4]

    static let filterModel = FilterModel(rover: "curiosity", camera: "fhaz", date: "2015-6-3")

    static let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext
}
