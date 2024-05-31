//
//  DatePicker.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 29.05.2024.
//

import SwiftUI

struct ModalDatePicker: View {
    @Binding var isPresented: Bool
    @State var selectedDate: Date
    @ObservedObject var mainViewModel: MainViewViewModel

    var body: some View {
        ZStack {
            Color(Color.layerOne.opacity(0.4))
                .ignoresSafeArea()
            VStack {
                HStack(alignment: .center) {
                    Button {
                        isPresented = false
                    } label: {
                        Image("close")
                            .resizable()
                            .frame(width: 44, height: 44)
                    }
                    Text("Date")
                        .sfPro(.title2)
                        .frame(maxWidth: .infinity)
                    Button {
                        mainViewModel.onDateChanged(date: selectedDate.convertToApiString())
                        isPresented = false
                    } label: {
                        Image("tick")
                            .resizable()
                            .frame(width: 44, height: 44)
                    }
                }

                DatePicker(selection: $selectedDate, displayedComponents: [.date]) {}
                    .datePickerStyle(.wheel)
            }
            .padding(20)
            .background(RoundedRectangle(cornerRadius: 50)
                .fill(Color.white))
            .padding(20)
            .onAppear() {
                selectedDate = mainViewModel.filter.date.convertApiStringToDate() ?? Date()
            }

        }
    }
}

#Preview {
    ModalDatePicker(isPresented: .constant(true), selectedDate: Date(), mainViewModel: MainViewViewModel(context: MockData.viewContext))
}
