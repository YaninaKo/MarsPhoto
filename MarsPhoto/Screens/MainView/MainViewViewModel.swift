//
//  MainViewViewModel.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 29.05.2024.
//

import Foundation

enum ScreenState {
    case initial
    case loading
    case content([PhotoItem])
    case error(String)
    case empty
}

final class MainViewViewModel: ObservableObject {

    @Published var screenState: ScreenState = .initial
    private let networkManager = NetworkManager.shared
    var filter = FilterModel(rover: "curiosity", camera: "fhaz", date: "2015-6-3")
    var filtersList = [String]()

    @MainActor
    func loadPhotos() {
        screenState = .loading
        Task {
            do {
                let photos = try await self.networkManager.fetchPhotos(roverName: filter.rover, roverCamera: filter.camera, earthDate: filter.date)
                if photos.isEmpty {
                    screenState = .empty
                } else {
                    screenState = .content(photos)
                }

            } catch {
                screenState = .error("Error")
            }
        }
    }

    @MainActor func onDateChanged(date: String) {
        filter.date = date
        print("date changed")
        loadPhotos()
    }

    @MainActor func onRoverChanged(rover: String) {
        print("selected rover: \(rover)")

        if let selectedRoverId = RoversCameras.rovers.first(where: { $0.name == rover })?.id {
            filter.rover = selectedRoverId
        } else {
            print("No such rover")
        }

        filter.camera = "all"

        loadPhotos()
    }

    @MainActor func onCameraChanged(camera: String) {
        guard camera != "all" else {
            filter.camera = camera
            return
        }

        let currentRoverId = filter.rover

        guard let currentRoverCameras = RoversCameras.rovers.first(where: { $0.id == currentRoverId })?.cameras else {
            print("there is no such a rover")
            return
        }

        guard let currentCameraId = currentRoverCameras.first(where: { $0.fullName == camera })?.id else {
            print("There is no such camera.")
            return
        }
        print("camera changed")
        filter.camera = currentCameraId
        loadPhotos()
    }

    func getRoversList() -> [String] {
        let roversList =  RoversCameras.rovers.map{ $0.name }
        print("Rovers list: \(roversList)")
        return roversList
    }

    func getCamerasList() -> [String] {
        guard let selectedRover = RoversCameras.rovers.first(where: { $0.id == filter.rover }) else {
            print("Selected rover not found.")
            return []
        }

        var cameraList = selectedRover.cameras.map { $0.fullName }
        cameraList.append("all")

        return cameraList
    }

    func getRoverById(_ roverId: String) -> String {
        let rover = RoversCameras.rovers.first(where: { $0.id == roverId })?.name
        return rover ?? "Curiosity"
    }

    func getCameraById(_ cameraId: String) -> String {
        for rover in RoversCameras.rovers {
            for camera in rover.cameras {
              if camera.id == cameraId {
                return camera.fullName
              }
            }
          }
        return "all"
    }
}