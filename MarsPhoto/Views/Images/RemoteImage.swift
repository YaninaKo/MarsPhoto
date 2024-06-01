//
//  RemoteImage.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 29.05.2024.
//

import SwiftUI

final class ImageLoader: ObservableObject {

    @Published var image: Image? = nil

    @MainActor
    func load(fromURLString urlString: String) {
        
        Task {
            do {
                guard let uiImage = try await NetworkManager.shared.downloadImage(from: urlString) else { return }
                self.image = Image(uiImage: uiImage)
            } catch {
                guard let imageError = error as? DownloadError else { return }
                
                switch imageError {
                case .invalidURL:
                    print("Image has invalid URL")
                case .invalidImageData:
                    print("Can not convert to UIImage")
                }
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?

    var body: some View {
        image?.resizable() ?? Image(.emptyState).resizable()
    }
}

struct PhotoCardRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String

    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear {
                imageLoader.load(fromURLString: urlString)
            }
    }
}

