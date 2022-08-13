//
//  GalleryRow.swift
//  Gridot
//
//  Created by 박찬울 on 2022/08/13.
//

import SwiftUI

struct GalleryRow: View {
    var categoryName: String
    var items: [Asset]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { asset in
                        NavigationLink {
                            AssetDetail(asset: asset)
                        } label: {
                            CategoryItem(asset: asset)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct GalleryRow_Previews: PreviewProvider {
    static var assets = ModelData().assets
    
    static var previews: some View {
        GalleryRow(
            categoryName: assets[0].category.rawValue,
            items: Array(assets.prefix(4))
        )
    }
}
