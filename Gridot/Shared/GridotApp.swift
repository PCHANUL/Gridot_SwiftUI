//
//  GridotApp.swift
//  Shared
//
//  Created by 박찬울 on 2022/07/24.
//

import SwiftUI

@main
struct GridotApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
