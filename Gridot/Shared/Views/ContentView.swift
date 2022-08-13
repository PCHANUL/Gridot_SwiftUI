//
//  ContentView.swift
//  Shared
//
//  Created by 박찬울 on 2022/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GalleryHome()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13 mini", "iPad mini (6th generation)"], id: \.self) { device in
            ContentView()
                .environmentObject(ModelData())
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
       
    }
}
