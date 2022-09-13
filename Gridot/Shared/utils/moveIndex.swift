//
//  moveIndex.swift
//  Gridot
//
//  Created by 박찬울 on 2022/09/13.
//

import SwiftUI

func moveIndex<C: MutableCollection> (data: inout C, from: Int, to: Int) {
    if (from >= 0 && from < data.count && to >= 0 && to < data.count) {
        if from < to {
            data.move(fromOffsets: IndexSet(integersIn: from...from), toOffset: to + 1)
        } else {
            data.move(fromOffsets: IndexSet(integersIn: to..<from), toOffset: from + 1)
        }
    }
}
