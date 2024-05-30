//
//  ContentView.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 29.05.2024.
//

import SwiftUI

struct ContentView: View {

    let photoItems: [PhotoItem]

    let columns = [GridItem(.flexible(), spacing: 12)]


    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(photoItems, id: \.id) { item in
                    return PhotoCard(photoItem: item) {
                        print("card was tapped")
                    }
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    ContentView(photoItems: MockData.photoItems)
}
