//
//  GalleyHome.swift
//  Gridot
//
//  Created by 박찬울 on 2022/08/13.
//

import SwiftUI

struct GalleryHome: View {
    var columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 50)), count: 4)
    @State var arr = [0, 1, 2, 3, 4, 5, 6]
    @State var tar: Int = 0

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    RelocatableView(data: $arr) { value in
                        VStack {
                            Text(String(value))
                                .font(.headline)
                                .foregroundColor(.black)
                        }
                        .frame(width: 50, height: 50)
                        .background(.yellow)
                    }
                }
            }
            .navigationTitle("Gallery")
        }
    }
}

struct RelocatableView<Content, C> : View where Content : View, C : MutableCollection, C : RandomAccessCollection, C.Index : Hashable, C.Element : Hashable {
    var content: (_ data: C.Element) -> Content
    @Binding var data: C
    @State var tar: Int = 0
    
    public init(data: Binding<C>, @ViewBuilder content: @escaping (_ data: C.Element) -> Content) {
        self.content = content
        self._data = data
    }
    
    var body: some View {
        ForEach(data, id: \.self) { value in
            content(value)
                .onDrag {
                    tar = data.firstIndex(of: value) as! Int
                    return NSItemProvider(object: String(tar) as NSString)
                }
                .onDrop(
                    of: [.text],
                    delegate: DragRelocatedDelegate(data: $data, tar: $tar, index: data.firstIndex(of: value) as! Int)
                )
        }
    }
}

struct DragRelocatedDelegate<C>: DropDelegate where C : MutableCollection, C : RandomAccessCollection, C.Index : Hashable {
    @Binding var data: C
    @Binding var tar: Int
    var index: Int
    
    func dropEntered(info: DropInfo) {
        let from = data.index(data.startIndex, offsetBy: tar)
        let to = data.index(data.startIndex, offsetBy: index)
        withAnimation(.default) {
            data.swapAt(from, to)
            tar = index
        }
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func performDrop(info: DropInfo) -> Bool {
        return false
    }
}

struct GalleyHome_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GalleryHome()
        }
    }
}
