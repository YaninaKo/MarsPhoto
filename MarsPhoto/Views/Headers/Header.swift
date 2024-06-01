//
//  Header.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 29.05.2024.
//

import SwiftUI

struct Header: View {

    @ObservedObject var mainViewModel: MainViewViewModel
    @Binding var isOverlayPresented: Bool
    @Binding var isFilterPickerPresented: Bool
    @Binding var filtertype: FilterType
    @State private var showingAlert = false

    var body: some View {
        ZStack {
            Color(Color.accentOne).ignoresSafeArea(.all, edges: .top)
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("MARS.CAMERA")
                            .sfPro(.largeTitle)
                        Text(mainViewModel.filter.date.convertToMonthDayYearString() ?? "")
                            .sfPro(.body2)
                    }

                    Spacer()

                    Button {
                        isOverlayPresented.toggle()
                    } label: {
                        Image("calendar")
                    }
                }

                HStack() {
                    Button {
                        filtertype = .rover
                        withAnimation {
                            isFilterPickerPresented.toggle()
                        }
                    } label: {
                        FilterButton(name: "rover", title: mainViewModel.filter.rover.capitalized)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .modifier(FilterButtonStyle())

                    Spacer(minLength: 12)

                    Button {
                        filtertype = .camera
                        withAnimation {
                            isFilterPickerPresented.toggle()
                        }
                    } label: {
                        FilterButton(name: "camera", title: mainViewModel.filter.camera.uppercased())
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .modifier(FilterButtonStyle())

                    Spacer(minLength: 23)

                    Button {
                        showingAlert = true
                    } label: {
                        Image("add")
                    }
                    .alert("Save Filters", isPresented: $showingAlert) {
                        Button("Save") { mainViewModel.saveFilter() }
                        Button("Cancel", role: .cancel) { }
                        
                    } message: {
                        Text("The current filters and the date you have chosen can be saved to the filter history.")
                    }
                    .modifier(FilterButtonStyle())
                }
            }
            .padding([.horizontal, .bottom], 20)

        }
    }
}

struct FilterButton: View {
    let name: String
    let title: String

    var body: some View {
        Image(name)
            .resizable()
            .frame(width: 24, height: 24)
            .padding(.trailing, 7)
        Text(title)
            .sfPro(.body2)
            .foregroundStyle(Color.layerOne)
    }
}

struct FilterButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(7)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.backgroundOne))
    }
}

#Preview {
    Header(mainViewModel: MainViewViewModel(context: MockData.viewContext), isOverlayPresented: .constant(false), isFilterPickerPresented: .constant(false), filtertype: .constant(.camera))
}
