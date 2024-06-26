//
//  MarsPhotoApp.swift
//  MarsPhoto
//
//  Created by Yanina Kovrakh on 29.05.2024.
//

import SwiftUI

@main
struct MarsPhotoApp: App {
    var body: some Scene {
        WindowGroup {
            let viewContext = CoreDataManager.shared.persistentStoreContainer.viewContext

            MainView(viewModel: MainViewViewModel(context: viewContext))
                .environment(\.managedObjectContext, viewContext)
        }
    }
}
