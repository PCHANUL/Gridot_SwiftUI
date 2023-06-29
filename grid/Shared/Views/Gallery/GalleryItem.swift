//
//  GalleryItem.swift
//  Gridot
//
//  Created by 박찬울 on 2022/09/18.
//

import SwiftUI

struct GalleryItem: View {
    var value: String
    var thumbnail: UIImage
    
    var body: some View {
    VStack {
            Image(uiImage: thumbnail)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .background(.black)

            Text(String(value))
                .font(.headline)
                .foregroundColor(.black)
        }
        .frame(width: 100, height: 130)
    }
}

struct GalleryItem_Previews: PreviewProvider {
    static var previews: some View {
        GalleryItem(value: "default", thumbnail: UIImage(named: "empty")!)
    }
}
