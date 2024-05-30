//
//  PhotoItem.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 29.05.2024.
//

import Foundation

struct PhotoItem: Identifiable {
    let id: Int
    let roverName: String
    let camera: String
    let cameraFullName: String
    let earthDate: String
    let imageSrc: String
}

struct PhotoResponse: Codable {
    let photos: [Photo]
}

struct Photo: Codable, Identifiable {
    let id: Int
    let camera: Camera
    let imgSrc: String
    let earthDate: String
    let rover: Rover
}

struct Camera: Codable {
    let name: String
    let fullName: String
}

struct Rover: Codable {
    let name: String
}
