//
//  UIStatus.swift
//  TestAppUITests
//
//  Created by Khamaru, Suparna on 07/09/19.
//

import Foundation
import XCTest

enum UIStatus: String {
    case exist = "exists == true"
    case notExist = "exists == false"
    case selected = "selected == true"
    case notSelected = "selected == false"
    case hittable = "isHittable == true"
    case notHittable = "isHittable == false"
}

func expect(element: XCUIElement,
            status: UIStatus,
            withIn timeout: TimeInterval = 20) {
    let expectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: status.rawValue), object: element)
    let result = XCTWaiter.wait(for: [expectation], timeout: timeout)
    
    if(result == .timedOut) {
        XCTFail(expectation.description)
    }
}
