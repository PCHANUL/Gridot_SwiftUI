//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by 박찬울 on 2022/09/12.
//

import XCTest

class Tests_iOS: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app.terminate()
    }

    func testExample() throws {
        let cell = app.staticTexts["0"]
        let tar = app.staticTexts["5"]
        
        let start = cell.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let finish = tar.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        start.press(forDuration: 2, thenDragTo: finish, withVelocity: .slow, thenHoldForDuration: 10)
        sleep(5)
    }
}
