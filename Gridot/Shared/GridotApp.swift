//
//  GridotApp.swift
//  Shared
//
//  Created by 박찬울 on 2022/07/23.
//

import SwiftUI

@main
struct GridotApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
