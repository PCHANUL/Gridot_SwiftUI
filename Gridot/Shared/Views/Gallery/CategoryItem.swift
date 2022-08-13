//
//  CategoryItem.swift
//  Gridot
//
//  Created by 박찬울 on 2022/08/13.
//

import SwiftUI

struct CategoryItem: View {
    var asset: Asset
    
    var body: some View {
        VStack(alignment: .leading) {
            asset.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(asset.name)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(asset: ModelData().assets[0])
    }
}
