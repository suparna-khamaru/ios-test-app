//
//  PerformanceTests.swift
//  PerformanceTests
//
//  Created by Khamaru, Suparna on 01/09/19.
//

import XCTest

class PerformanceTests: XCTestCase {
        
    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
    }
        
    func testPerformance() {
        self.measureMetrics([XCTPerformanceMetric.wallClockTime], automaticallyStartMeasuring: false){
            
            startMeasuring()
            calculateSum(firstNumber: 1, secondNumber: 2)
            stopMeasuring()
        }
    }
    
    func calculateSum(firstNumber: Int,
                      secondNumber: Int) {
        
        let firstTextField = app.textFields["IntegerA"]
        let secondTextField = app.textFields["IntegerB"]
        
        firstTextField.tap()
        firstTextField.typeText(String(firstNumber))
        
        secondTextField.tap()
        secondTextField.typeText(String(secondNumber))
        
        app.buttons["ComputeSumButton"].tap()
    }
}
