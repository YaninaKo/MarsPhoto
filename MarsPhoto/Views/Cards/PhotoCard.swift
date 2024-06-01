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
            CardText(
                roverName: photoItem.roverName,
                cameraName: photoItem.cameraFullName,
                earthDate: photoItem.earthDate)
                .frame(maxWidth: .infinity, alignment: .leading)

            PhotoCardRemoteImage(urlString: photoItem.imageSrc)
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 130)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .padding(10)
        .modifier(cardBackground())
        .onTapGesture {
            isFullScreenImagePresented = true
        }
        .fullScreenCover(isPresented: $isFullScreenImagePresented, content: {
            FullScreenImage(imageSrc: photoItem.imageSrc)
        })
    }
}

#Preview {
    PhotoCard(photoItem: MockData.samplePhotoItem)
}
