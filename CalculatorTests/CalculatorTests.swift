//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Lena Sabadina on 2019-09-25.
//  Copyright © 2019 Whiskerz AB. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var logic: CalculatorLogic!
    
    override func setUp() {
        logic = CalculatorLogic()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_minusOperation() {
        logic.setNumber(10)
        
        let calculatedResult = logic.calculate(function: .minus)
        let expectedResult = 9.0
        
        XCTAssertEqual(calculatedResult, expectedResult)
    }
    
    func test_percentageOperation() {
        logic.setNumber(100)
        
        let calculatedResult = logic.calculate(function: .percentage)
        let expectedResult = 1.0
        
        XCTAssertEqual(calculatedResult, expectedResult)
    }
    
    func test_clearOperation() {
        logic.setNumber(100)
        
        let calculatedResult = logic.calculate(function: .clear)
        let expectedResult = 0.0
        
        XCTAssertEqual(calculatedResult, expectedResult)
    }
    
    func test_plusMinusOperation() {
        logic.setNumber(-100)
        
        let plusCalculatedResult = logic.calculate(function: .plusMinus)
        let plusExpectedResult = 100.0
        
        XCTAssertEqual(plusCalculatedResult, plusExpectedResult)
        
        logic.setNumber(100)
        
        let minisCalculatedResult = logic.calculate(function: .plusMinus)
        let minusExpectedResult = -100.0
        
        XCTAssertEqual(minisCalculatedResult, minusExpectedResult)
    }
    
    func test_unknownOperation() {
        logic.setNumber(35)
        
        let calculatedResult = logic.calculate(function: .unknown)
        
        XCTAssertNil(calculatedResult)
    }
}
