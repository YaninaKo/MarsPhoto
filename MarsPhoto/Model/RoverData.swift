//
//  Rover.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 30.05.2024.
//

import Foundation

struct RoverData: Identifiable {
    let id: String
    let name: String
    let cameras: [CameraData]
}
