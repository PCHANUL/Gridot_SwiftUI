//
//  GalleyHome.swift
//  Gridot
//
//  Created by 박찬울 on 2022/08/13.
//

import SwiftUI

struct GalleryHome: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    GalleryRow(categoryName: key, items: modelData.categories[key]!)
                }
            }
            .navigationTitle("Gallery")
        }
    }
}

struct GalleyHome_Previews: PreviewProvider {
    static var previews: some View {
        GalleryHome()
            .environmentObject(ModelData())
    }
}
