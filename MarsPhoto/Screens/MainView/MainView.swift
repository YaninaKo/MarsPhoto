//
//  ContentView.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 29.05.2024.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.managedObjectContext) var viewContext

    @State private var isOverlayPresented = false
    @State private var isFilterPickerPresented = false
    @State private var filterType: FilterType = .rover
    @State private var navigationPath = NavigationPath()
    @State private var showHistoryButton = false

    @ObservedObject private var viewModel: MainViewViewModel

    init(viewModel: MainViewViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                switch viewModel.screenState {
                case .initial:
                    PreloaderView().zIndex(1)
                case .loading:
                    VStack(spacing: .zero) {
                        Header(mainViewModel: viewModel,
                               isOverlayPresented: $isOverlayPresented,
                               isFilterPickerPresented: $isFilterPickerPresented,
                               filtertype: $filterType)
                        LoadingView()
                            .modifier(ScreenBodyStyle())
                    }
                case .content(let items):
                    VStack(spacing: .zero) {
                        Header(mainViewModel: viewModel,
                               isOverlayPresented: $isOverlayPresented,
                               isFilterPickerPresented: $isFilterPickerPresented,
                               filtertype: $filterType)
                        ContentView(photoItems: items)
                            .modifier(ScreenBodyStyle())
                    }

                case .error:
                    VStack(spacing: .zero) {
                        Header(mainViewModel: viewModel,
                               isOverlayPresented: $isOverlayPresented,
                               isFilterPickerPresented: $isFilterPickerPresented,
                               filtertype: $filterType)
                        ErrorView(onRefresh: {viewModel.loadPhotos()})
                            .modifier(ScreenBodyStyle())
                    }
                case .empty:
                    VStack(spacing: .zero) {
                        Header(mainViewModel: viewModel,
                               isOverlayPresented: $isOverlayPresented,
                               isFilterPickerPresented: $isFilterPickerPresented,
                               filtertype: $filterType)
                        EmptyView(text: "No photos were made 😔. Please try another filter set.")
                            .modifier(ScreenBodyStyle())
                    }
                }

                VStack(alignment: .trailing) {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            navigationPath.append("history")
                        } label: {
                            Image("history")
                                .resizable()
                                .frame(width: 44, height: 44)
                                .padding(26)
                                .background(Circle().foregroundStyle(Color.accentOne)
                                    .frame(width: 70, height: 70))
                        }
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
            .navigationDestination(for: String.self) { destination in
                if destination == "history" {
                    HistoryView(viewModel: HistoryViewViewModel(
                        context: viewContext,
                        selectedFilter: $viewModel.filter,
                        navigationPath: $navigationPath))
                }
            }
        }
    }
}

#Preview {
    MainView(viewModel: MainViewViewModel(context: MockData.viewContext))
}
