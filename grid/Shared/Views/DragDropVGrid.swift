//
//  DragDropVGrid.swift
//  
//
//  Created by 박찬울 on 2022/09/12.
//

import SwiftUI

struct DragDropVGrid<Content, C>: View
    where Content: View, C: MutableCollection, C: RandomAccessCollection, C.Index: Hashable, C.Element: Hashable {
    var columns: [GridItem]
    @Binding var data: C
    @ViewBuilder var content: (_ value: C.Element) -> Content

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                RelocatableView(data: $data) { value in
                    content(value)
                }
            }
            .accessibilityIdentifier("grid")
        }
    }
}

struct RelocatableView<Content, C>: View
    where Content: View, C: MutableCollection, C: RandomAccessCollection, C.Index: Hashable, C.Element: Hashable {
    @Binding var data: C
    @ViewBuilder var content: (_ data: C.Element) -> Content
    @State var tar: Int = 0
    
    var body: some View {
        ForEach(data, id: \.self) { value in
            if let idx = data.firstIndex(of: value) as? Int {
                content(value)
                    .onDrag {
                        tar = idx
                        return NSItemProvider(object: String(idx) as NSString)
                    }
                    .onDrop(of: [.text], delegate: RelocateDelegate(data: $data, tar: $tar, index: idx))
            }
        }
    }
}

struct RelocateDelegate<C>: DropDelegate
    where C: MutableCollection, C: RandomAccessCollection, C.Index: Hashable {
    @Binding var data: C
    @Binding var tar: Int
    var index: Int
    
    func dropEntered(info: DropInfo) {
        if tar != index {
            withAnimation(.default) {
                moveIndex(data: &data, from: tar, to: index)
                tar = index
            }
        }
    }
    
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return DropProposal(operation: .move)
    }
    
    func validateDrop(info: DropInfo) -> Bool {
        return true
    }
    
    func performDrop(info: DropInfo) -> Bool {
        return true
    }
}
