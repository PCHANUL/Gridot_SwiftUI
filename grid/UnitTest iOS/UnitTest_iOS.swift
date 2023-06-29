//
//  UnitTest_iOS.swift
//  UnitTest iOS
//
//  Created by 박찬울 on 2022/09/07.
//

import XCTest
import SwiftUI
@testable import Gridot

struct TestObj {
    var id: Int
    var name: String
}

class Tests_moveIndex: BaseTestCase {
    var intArr: [Int] = []
    var strArr: [String] = []
    var objArr: [TestObj] = []
    
    func test_2to4() throws {
        given { intArr = [0, 1, 2, 3, 4, 5] }
        when { moveIndex(data: &intArr, from: 2, to: 4) }
        then { XCTAssert(intArr == [0, 1, 3, 4, 2, 5]) }
    }
    
    func test_4to2() throws {
        given { intArr = [0, 1, 2, 3, 4, 5] }
        when { moveIndex(data: &intArr, from: 4, to: 2) }
        then { XCTAssert(intArr == [0, 1, 4, 2, 3, 5]) }
    }
    
    func test_intArray() throws {
        given { intArr = [0, 1, 2, 3] }
        when { moveIndex(data: &intArr, from: 0, to: 3) }
        then { XCTAssert(intArr == [1, 2, 3, 0]) }
    }
    
    func test_strArray() throws {
        given { strArr = ["a", "b", "c", "d"] }
        when { moveIndex(data: &strArr, from: 0, to: 3) }
        then { XCTAssert(strArr == ["b", "c", "d", "a"]) }
    }
    
    func test_objArray() throws {
        given {
            objArr = [
                TestObj(id: 0, name: "John"),
                TestObj(id: 1, name: "Tom"),
                TestObj(id: 2, name: "Han"),
                TestObj(id: 3, name: "Kim")
            ]
        }
        when { moveIndex(data: &objArr, from: 0, to: 3) }
        then {
            XCTAssert(objArr[0].id == 1 && objArr[0].name == "Tom")
            XCTAssert(objArr[1].id == 2 && objArr[1].name == "Han")
            XCTAssert(objArr[2].id == 3 && objArr[2].name == "Kim")
            XCTAssert(objArr[3].id == 0 && objArr[3].name == "John")
        }
    }
    
    func test_outOfBounds() throws {
        let ints: [Int] = [0, 1, 2, 3, 4, 5]

        given { intArr = ints }
        
        // over
        when { moveIndex(data: &intArr, from: 0, to: 100) }
        then { XCTAssert(intArr == ints) }
        
        // under
        when { moveIndex(data: &intArr, from: -100, to: 0) }
        then { XCTAssert(intArr == ints) }
    }
    
    func test_emptyArray() throws {
        given { intArr = [] }
        when { moveIndex(data: &intArr, from: 0, to: 0) }
        then { XCTAssert(intArr == []) }
    }
}
