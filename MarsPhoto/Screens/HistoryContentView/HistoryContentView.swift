//
//  HistoryContentView.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 31.05.2024.
//

import SwiftUI

struct HistoryContentView: View {
    let columns = [GridItem(.flexible(), spacing: 12)]
    @ObservedObject var historyViewModel: HistoryViewViewModel

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(historyViewModel.filters) { filter in
                    FilterCard(filter: filter) { filter in
                        historyViewModel.setFilter(filter: filter.filterModel)
                        print("Use filter and return to main view.")
                    } deleteFilter: { filter in
                        historyViewModel.deleteFilter(filterId: filter.id)
                    }
                }
            }
            .padding(20)
        }
    }
}

//#Preview {
//    HistoryContentView()
//}
