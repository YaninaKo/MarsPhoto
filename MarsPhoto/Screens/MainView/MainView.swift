//
//  ContentView.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 29.05.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    @State private var isOverlayPresented = false
    @State private var isFilterPickerPresented = false
    @State private var filterType: FilterType = .rover

    var body: some View {
        ZStack {
            VStack(spacing: .zero) {
                switch viewModel.screenState {
                case .initial:
                    Text("Preloader")
                case .loading:
                    Header(mainViewModel: viewModel,
                           isOverlayPresented: $isOverlayPresented,
                           isFilterPickerPresented: $isFilterPickerPresented,
                           filtertype: $filterType)
                    LoadingView()
                        .modifier(ScreenBodyStyle())
                case .content(let items):
                        Header(mainViewModel: viewModel,
                               isOverlayPresented: $isOverlayPresented,
                               isFilterPickerPresented: $isFilterPickerPresented,
                               filtertype: $filterType)
                    ContentView(photoItems: items)
                        .modifier(ScreenBodyStyle())
                        
                case .error:
                    Header(mainViewModel: viewModel,
                           isOverlayPresented: $isOverlayPresented,
                           isFilterPickerPresented: $isFilterPickerPresented,
                           filtertype: $filterType)
                    ErrorView(viewModel: viewModel)
                        .modifier(ScreenBodyStyle())
                case .empty:
                    Header(mainViewModel: viewModel,
                           isOverlayPresented: $isOverlayPresented,
                           isFilterPickerPresented: $isFilterPickerPresented,
                           filtertype: $filterType)
                    EmptyView(text: "No photos were made 😔. Please try another filter set. ")
                        .modifier(ScreenBodyStyle())
                }
            }

            if isOverlayPresented {
                ModalDatePicker(
                    isPresented: $isOverlayPresented,
                    selectedDate: Date(),
                    mainViewModel: viewModel)
            }

        }
        .overlay(alignment: .bottom) {
            if isFilterPickerPresented {
                FilterPicker(
                    mainViewModel: viewModel,
                    isPresented: $isFilterPickerPresented,
                    filterType: $filterType)

            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .onAppear() {
            viewModel.loadPhotos()
        }


    }
}

struct ScreenBodyStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxHeight: .infinity)
            .layoutPriority(1)
            .background(Color.backgroundOne)
    }
}

#Preview {
    MainView() // Mock data
}
