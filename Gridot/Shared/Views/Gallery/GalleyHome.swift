//
//  GalleyHome.swift
//  Gridot
//
//  Created by 박찬울 on 2022/08/13.
//

import SwiftUI

struct GalleryHome: View {
    var columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 50)), count: 4)
    @State var arr: [Int] = [0, 1, 2, 3, 4, 5, 6]
    @State var tar: Int = 0

    var body: some View {
        NavigationView {
            DragDropVGrid(columns: columns, data: $arr, content: { value in
                VStack {
                    Text(String(value))
                        .font(.headline)
                        .foregroundColor(.black)
                }
                .frame(width: 50, height: 50)
                .background(.yellow)
            })
            .navigationTitle("Gallery")
        }
    }
}

struct GalleyHome_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GalleryHome()
        }
    }
}
