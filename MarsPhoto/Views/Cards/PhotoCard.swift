//
//  PhotoCard.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 29.05.2024.
//

import SwiftUI

struct PhotoCard: View {
    let photoItem: PhotoItem
    var onTap: (() -> Void)?
    @State private var isFullScreenImagePresented = false


    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            VStack(alignment: .leading, spacing: 6) {
                CardText(title: "Rover:", name: photoItem.roverName)
                CardText(title: "Camera:", name: photoItem.cameraFullName)
                CardText(title: "Date:", name: photoItem.earthDate)
            }

            .frame(maxWidth: .infinity, alignment: .leading)

            PhotoCardRemoteImage(urlString: photoItem.imageSrc)
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 130)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .padding(10)
        .background(RoundedRectangle(cornerRadius: 30)
            .fill(Color.backgroundOne)
            .shadow(color: Color.black.opacity(0.4), radius: 16, x: 0, y: 3)
        )
        .onTapGesture {
            isFullScreenImagePresented = true
        }
        .fullScreenCover(isPresented: $isFullScreenImagePresented, content: {
            FullScreenImage(imageSrc: photoItem.imageSrc)
        })
    }
}

struct CardText: View {
    let title: String
    let name: String

    var body: some View {
        Text(title).sfPro(.body).foregroundStyle(Color.layerTwo) + Text(" ") +
        Text(name).sfPro(.body2).foregroundStyle(Color.layerOne).bold()
    }
}

#Preview {
    PhotoCard(photoItem: MockData.samplePhotoItem)
}
