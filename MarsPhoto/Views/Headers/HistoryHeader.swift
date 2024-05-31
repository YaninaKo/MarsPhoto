//
//  HistoryHeader.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 31.05.2024.
//

import SwiftUI

struct HistoryHeader: View {

    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
            Color(Color.accentOne).ignoresSafeArea(.all, edges: .top)
            ZStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image("left")
                            .resizable()
                            .frame(width: 44, height: 44)
                    }

                    Spacer()
                }

                Text("History")
                    .sfPro(.largeTitle)
                    .foregroundStyle(Color.layerOne)
            }
            .padding(.bottom, 20)

        }
    }
}

#Preview {
    HistoryHeader()
}
