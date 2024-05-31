//
//  Modifiers.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 31.05.2024.
//

import SwiftUI

struct ScreenBodyStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxHeight: .infinity)
            .layoutPriority(1)
            .background(Color.backgroundOne)
    }
}

struct cardBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(RoundedRectangle(cornerRadius: 30)
            .fill(Color.backgroundOne)
            .shadow(color: Color.black.opacity(0.4), radius: 16, x: 0, y: 3)
        )
    }
}
