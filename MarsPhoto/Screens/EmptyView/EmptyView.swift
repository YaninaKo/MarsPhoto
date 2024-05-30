//
//  EmptyView.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 30.05.2024.
//

import SwiftUI

struct EmptyView: View {

    var text: String

    var body: some View {
        VStack(spacing: 20) {
            Image(.emptyState)
                .resizable()
                .frame(width: 145, height: 145)
            Text(text)
                .sfPro(.body)
                .foregroundStyle(Color.layerTwo)
        }
    }
}

#Preview {
    EmptyView(text: "Browsing history is empty")
}
