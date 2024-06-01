//
//  FilterPicker.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 30.05.2024.
//

import SwiftUI

enum FilterType {
    case rover
    case camera
}

struct FilterPicker: View {
    @ObservedObject var mainViewModel: MainViewViewModel
    @Binding var isPresented: Bool
    @Binding var filterType: FilterType
    @State private var selectedFilter = ""
    @State private var filtersList: [String] = []

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button {
                    withAnimation {
                        isPresented = false
                    }
                } label: {
                    Image("close")
                        .resizable()
                        .frame(width: 44, height: 44)
                }
                Text(filterType == .rover ? "Rover" : "Camera")
                    .sfPro(.title2)
                    .frame(maxWidth: .infinity)
                Button {
                    switch filterType {
                    case .rover:
                        mainViewModel.onRoverChanged(rover: selectedFilter)
                        filtersList.removeAll()
                    case .camera:
                        mainViewModel.onCameraChanged(camera: selectedFilter)
                        filtersList.removeAll()
                    }
                    withAnimation {
                        isPresented = false
                    }
                } label: {
                    Image("tick")
                        .resizable()
                        .frame(width: 44, height: 44)
                }
            }

            Picker(
                filterType == .rover ? "Rover" : "Camera",
                selection: $selectedFilter) {
                    ForEach(filtersList, id: \.self) { filter in
                        Text(filter)
                    }
                }
                .pickerStyle(.wheel)
                .onAppear() {
                    if filtersList.isEmpty {
                        filtersList = filterType == .rover ? mainViewModel.getRoversList() : mainViewModel.getCamerasList()
                    }
                    setSelectedFilter()
                }

        }
        .padding(20)
        .background(Color.backgroundOne)
        .clipShape(
            .rect(
                topLeadingRadius: 50,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: 50
            )
        )
        .shadow(color: Color.black.opacity(0.4), radius: 16, x: 0, y: 3)
        .transition(.move(edge: .bottom))
    }

    private func setSelectedFilter() {
        switch filterType {
        case .rover:
            selectedFilter = mainViewModel.getRoverById(mainViewModel.filter.rover)
        case .camera:
            selectedFilter = mainViewModel.getCameraById(mainViewModel.filter.camera)
        }
    }
}

#Preview {
    FilterPicker(mainViewModel: MainViewViewModel(context: MockData.viewContext), isPresented: .constant(true), filterType: .constant(.camera))
}
