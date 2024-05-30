//
//  ErrorView.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 30.05.2024.
//

import SwiftUI

struct ErrorView: View {

    @ObservedObject var viewModel: MainViewViewModel

    var body: some View {
        VStack(alignment: .center) {
            Text("Error!")
            Text("Please try again")
            Button {
                viewModel.loadPhotos()
            } label: {
                Image(systemName: "arrow.clockwise.circle")
                    .resizable()
                    .foregroundStyle(Color.systemThree)
                    .frame(width: 44, height: 44)

            }
        }
    }
}

#Preview {
    ErrorView(viewModel: MainViewViewModel())
}
