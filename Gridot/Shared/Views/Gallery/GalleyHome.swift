//
//  GalleyHome.swift
//  Gridot
//
//  Created by 박찬울 on 2022/08/13.
//

import SwiftUI

class DataArr: ObservableObject {
    @Published var arr: [Int] = [1, 2, 3, 4, 5, 6]
    @Published var tar: Int?
}

struct GalleryHome: View {
    var columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 50)), count: 4)
    @State var arr: [Int] = [0, 1, 2, 3, 4, 5, 6]
    @State var tar: Int = 0

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(arr, id: \.self) { value in
                        VStack {
                            Text(String(value))
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                        .frame(width: 50, height: 50)
                        .background(.yellow)
                        .onDrag {
                            tar = value
                            return NSItemProvider(object: String(value) as NSString)
                        }
                        .onDrop(of: [.text], delegate: DragRelocatedDelegate(data: $arr, tar: $tar, value: value))
                    }
                }
            }
            .navigationTitle("Gallery")
        }
    }
}


struct DragRelocatedDelegate: DropDelegate {
    @Binding var data: [Int]
    @Binding var tar: Int
    var value: Int
    
    func dropEntered(info: DropInfo) {
        let from = data.firstIndex(of: tar) ?? 0
        let to = data.firstIndex(of: value) ?? 0
        
        withAnimation(.default) {
            let fromGrid = data[from]
            data[from] = data[to]
            data[to] = fromGrid
        }
    }
    
    func dropExited(info: DropInfo) {
        print("exited \(info)")
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        print("updated \(info)")
        return DropProposal(operation: .move)
    }
    
    func performDrop(info: DropInfo) -> Bool {
        print("drop \(info)")
        
        return true
    }
}

struct GalleyHome_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GalleryHome()
        }
    }
}
