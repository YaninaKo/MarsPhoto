//
//  FilterCard.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 31.05.2024.
//

import SwiftUI

struct FilterCard: View {

    var filter: FilterViewModel
    @State private var isActionSheetPresented = false
    var useFilter: ((_ filter: FilterViewModel) -> Void)
    var deleteFilter: ((_ filter: FilterViewModel) -> Void)

    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(Color.accentOne)
                Text("Filters")
                    .sfPro(.title2)
                    .foregroundStyle(Color.accentOne)
            }

            CardText(roverName: filter.roverFullName, cameraName: filter.cameraFullName, earthDate: filter.dateFormatted)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.top, 10)
        .padding([.bottom, .horizontal], 16)
        .modifier(cardBackground())
        .onTapGesture {
            isActionSheetPresented = true
        }
        .actionSheet(isPresented: $isActionSheetPresented) {
            ActionSheet(
                title: Text("Menu Filter"),
                buttons: [
                    .default(Text("Use")) {
                        useFilter(filter)
                    },
                    .destructive(Text("Delete")) {
                        deleteFilter(filter)
                    },
                    .cancel()
                ]
            )
        }
    }
}
