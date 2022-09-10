//
//  BaseTestCase.swift
//  UnitTest iOS
//
//  Created by 박찬울 on 2022/09/07.
//

import XCTest

open class BaseTestCase: XCTestCase {

    // 초기에 주입받아야 할 데이터를 지정한다.
    open func given(_ task: () -> Void) {
        task()
    }

    // 발생해야 할 이벤트 또는 메소드 호출등을 실행시킨다.
    open func when(_ task: () -> Void) {
        task()
    }

    // 결과 값이 기대와 같은지 확인한다.
    open func then(_ task: () -> Void) {
        task()
    }
}
