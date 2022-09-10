//
//  UnitTest_iOS.swift
//  UnitTest iOS
//
//  Created by 박찬울 on 2022/09/07.
//

import XCTest
@testable import Gridot

class Test_DragRelocatedDelegate: BaseTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_dropEntered() throws {
        let a = Even(num: 0)

        when {
            XCTAssert(a.isEven == true)
        }
    }
}
