//
//  GalleyHome.swift
//  Gridot
//
//  Created by 박찬울 on 2022/08/13.
//

import SwiftUI

struct GalleryHome: View {
    var columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 100)), count: 3)
    @State var arr: [Int] = [0, 1, 2, 3, 4, 5, 6]
    
    var body: some View {
        NavigationView {
            DragDropVGrid(columns: columns, data: $arr) { value in
                GalleryItem(value: String(value), thumbnail: UIImage(named: "empty")!)
            }
            .navigationTitle("Gallery")
        }
    }
}

struct GalleyHome_Previews: PreviewProvider {
    static var previews: some View {
        GalleryHome()
    }
}
