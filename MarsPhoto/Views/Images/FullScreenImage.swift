//
//  FullScreenImage.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 30.05.2024.
//

import SwiftUI

struct FullScreenImage: View {
    @Environment(\.dismiss) var dismiss
    var imageSrc: String

    var body: some View {
        ZStack {
            Color.layerOne.ignoresSafeArea()
            VStack(alignment: .leading) {
                    Button {
                        dismiss()
                    } label: {
                        Image("close-white")
                            .resizable()
                            .frame(width: 44, height: 44)
                    }
                    .padding(.leading, 20)

                Spacer()

                PhotoCardRemoteImage(urlString: imageSrc)
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                
                Spacer()

            }
            .frame(maxHeight: .infinity)
        }
    }
}

#Preview {
    FullScreenImage(imageSrc: MockData.samplePhotoItem.imageSrc)
}
