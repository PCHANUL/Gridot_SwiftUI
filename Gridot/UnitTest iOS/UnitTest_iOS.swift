//
//  UnitTest_iOS.swift
//  UnitTest iOS
//
//  Created by 박찬울 on 2022/09/07.
//

import XCTest
import SwiftUI
@testable import Gridot

class Tests_DragDropVGrid: BaseTestCase {
    var intArr: [Int] = []
    var strArr: [String] = []
    var tar: Int = 0
    
    func test_moveIndex_outOfBounds() throws {
        let arr: [Int] = [0, 1, 2, 3, 4, 5]
        
        given {
            intArr.append(contentsOf: arr)
            tar = 0
        }
        
        when {
            moveIndex(data: &intArr, from: 0, to: 8)
        }
        
        then {
            XCTAssert(intArr == arr)
        }
    }
}
