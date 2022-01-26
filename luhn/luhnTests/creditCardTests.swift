//
//  creditCardTests.swift
//  luhnTests
//
//  Created by Alexnaldo Carvalhos dos Santos on 25/01/22.
//

import XCTest
@testable import luhn

class creditCardTests: XCTestCase {

    func test_detect_empty_creditcard() throws {
        let card = CreditCardStrategy.detectCreditCard("")
        XCTAssertNil(card)
    }
    
    func test_detect_invalid_string() throws {
        let card = CreditCardStrategy.detectCreditCard("a")
        XCTAssertNil(card)
    }
    
    func test_detect_valid_prefix_but_incorrect_size() throws {
        let card = CreditCardStrategy.detectCreditCard("51")
        XCTAssertNil(card)
    }
    
    func test_detect_mastercard_prefix() throws {
        let expected = "Mastercard"
        var card = CreditCardStrategy.detectCreditCard("5105105105105100")
        XCTAssertEqual(card?.name, expected)
        card = CreditCardStrategy.detectCreditCard("5205105105105100")
        XCTAssertEqual(card?.name, expected)
        card = CreditCardStrategy.detectCreditCard("5305105105105100")
        XCTAssertEqual(card?.name, expected)
        card = CreditCardStrategy.detectCreditCard("5405105105105100")
        XCTAssertEqual(card?.name, expected)
        card = CreditCardStrategy.detectCreditCard("5505105105105100")
        XCTAssertEqual(card?.name, expected)
    }
    
    func test_detect_mastercard_but_invalid_code() throws {
        let code = "5555555555554443"
        let card = CreditCardStrategy.detectCreditCard(code)
        XCTAssertEqual(card?.name, "Mastercard")
        XCTAssertFalse(card!.isValid(cardCode: code))
    }
}
