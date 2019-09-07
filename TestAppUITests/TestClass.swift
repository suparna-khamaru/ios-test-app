//  TestClass.swift
//  TestAppUITests
//
//  Created by Khamaru, Suparna on 31/08/19.

import XCTest

class TestClass: BaseClass {
    
    let two = TestData.two
    let five = TestData.five
    let seven = TestData.seven
    
    override func setUp() {
        super.setUp()
        app.launch()
    }
    
    func testCalculateSum() {
        let calculateScreen = CalculateScreen(app)
        
        calculateScreen
            .enter(number: two, in: calculateScreen.firstTextField)
            .enter(number: five, in: calculateScreen.secondTextField)
            .tapOn(button: calculateScreen.computeButton)
        
        XCTAssertEqual(seven, calculateScreen.actual)
    }
}
