//
//  CardText.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 31.05.2024.
//

import SwiftUI

struct CardText: View {

    var roverName: String
    var cameraName: String
    var earthDate: String

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            CardTextRow(title: "Rover:", name: roverName)
            CardTextRow(title: "Camera:", name: cameraName)
            CardTextRow(title: "Date:", name: earthDate)
        }
    }
}

struct CardTextRow: View {
    let title: String
    let name: String

    var body: some View {
        Text(title).sfPro(.body).foregroundStyle(Color.layerTwo) + Text(" ") +
        Text(name).sfPro(.body2).foregroundStyle(Color.layerOne).bold()
    }
}

#Preview {
    CardText(roverName: MockData.samplePhotoItem.roverName, cameraName: MockData.samplePhotoItem.cameraFullName, earthDate: MockData.samplePhotoItem.earthDate)
}
