//
//  luhnTests.swift
//  luhnTests
//
//  Created by Alexnaldo Carvalhos dos Santos on 24/01/22.
//

import XCTest
@testable import luhn

class luhnTests: XCTestCase {

    func test_luhn_sum_when_empty_value() throws {
        let value = ""
        let sum = Luhn10.sum(value)
        XCTAssertNil(sum)
    }
    
    func test_luhn_invalid_when_empty_value() throws {
        let value = ""
        XCTAssertFalse(Luhn10.isValid(value))
    }
    
    func test_luhn_sum_when_invalid_value() throws {
        let value = "a"
        let sum = Luhn10.sum(value)
        XCTAssertNil(sum)
    }
    
    func test_luhn_invalid_when_invalid_value() throws {
        let value = "a"
        XCTAssertFalse(Luhn10.isValid(value))
    }
    
    func test_luhn_sum_when_correct_value() throws {
        let expected = 70
        let value = "49927398716"
        let sum = Luhn10.sum(value)
        XCTAssertEqual(sum, expected)
    }
    
    func test_luhn_valid_when_correct_value() throws {
        let value = "49927398716"
        XCTAssertTrue(Luhn10.isValid(value))
    }
}
