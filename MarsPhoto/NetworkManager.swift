//
//  NetworkManager.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 29.05.2024.
//

import UIKit

enum RequestError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unsuccessfulStatusCode(Int)
}

enum DownloadError: Error {
  case invalidURL
  case invalidImageData
}

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()

    private let baseURL = "https://api.nasa.gov/mars-photos/api/v1/rovers/"
    private let apiKey = "HaNk87F5dHTaCehYeTfWoJ31baqWTfXa5ZL3u7Vq"


    private init() {}

    func fetchPhotos(roverName: String, roverCamera: String = "all", earthDate: String) async throws -> [PhotoItem] {

        let urlString = "\(baseURL)\(roverName)/photos?earth_date=\(earthDate)" +
          (roverCamera == "all" ? "&cameras=" : "&camera=") +
          "\(roverCamera)" +
          "&api_key=\(apiKey)"

        print(urlString)

        guard let url = URL(string: urlString) else {
            throw RequestError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw RequestError.invalidResponse
        }

        guard httpResponse.statusCode == 200 else {
            throw RequestError.unsuccessfulStatusCode(httpResponse.statusCode)
        }

        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let photoResponse =  try decoder.decode(PhotoResponse.self, from: data)


            let marsPhotos = photoResponse.photos.map { photo in

                var urlComponents = URLComponents(string: photo.imgSrc)!
                urlComponents.scheme = "https"

                return PhotoItem(id: photo.id,
                          roverName: photo.rover.name,
                          camera: photo.camera.name,
                          cameraFullName: photo.camera.fullName,
                          earthDate: photo.earthDate,
                          imageSrc: urlComponents.url!.absoluteString)
            }

            return marsPhotos
        } catch {
            throw RequestError.invalidData
        }
    }

    func downloadImage(from urlString: String) async throws -> UIImage? {

      let cacheKey = NSString(string: urlString)

      if let cachedImage = cache.object(forKey: cacheKey) { return cachedImage }

      guard let url = URL(string: urlString) else {
        throw DownloadError.invalidURL
      }

      let (data, _) = try await URLSession.shared.data(from: url)

      guard let image = UIImage(data: data) else {
        throw DownloadError.invalidImageData
      }

      cache.setObject(image, forKey: cacheKey)

      return image
    }
}
