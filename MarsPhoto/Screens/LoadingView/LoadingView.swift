//
//  LoadingView.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 30.05.2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .accentOne))
            .scaleEffect(2.0, anchor: .center)
    }
}

#Preview {
    LoadingView()
}
