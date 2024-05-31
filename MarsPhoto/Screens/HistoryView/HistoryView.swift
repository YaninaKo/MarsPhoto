//
//  HistoryView.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 31.05.2024.
//

import SwiftUI

struct HistoryView: View {

    @FetchRequest(sortDescriptors: []) var filters: FetchedResults<Filter>
    @ObservedObject var historyViewModel: HistoryViewViewModel

    init(viewModel: HistoryViewViewModel) {
        self.historyViewModel = viewModel
    }

    var body: some View {
        VStack(spacing: .zero) {
            HistoryHeader()
            if historyViewModel.filters.isEmpty {
                EmptyView(text: "Browsing history is empty.")
                    .modifier(ScreenBodyStyle())
            } else {
                HistoryContentView(historyViewModel: historyViewModel)
                    .modifier(ScreenBodyStyle())
            }

        }.navigationBarBackButtonHidden(true)
    }
}

//#Preview {
//    HistoryView(viewModel: HistoryViewViewModel(context: MockData.viewContext))
//}
