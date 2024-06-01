//
//  PreloaderView.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 29.05.2024.
//

import SwiftUI

struct PreloaderView: View {
    var body: some View {
        ZStack {
            Color.backgroundOne.ignoresSafeArea()
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.accentOne)
                .frame(width: 123, height: 123)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.black, lineWidth: 1)
                )
            VStack {
                Spacer()
                LottieView(fileName: "loader")
                    .frame(height: 200)
            }
        }
    }
}

#Preview {
    PreloaderView()
}
