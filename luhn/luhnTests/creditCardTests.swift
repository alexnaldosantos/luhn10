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
    
    func test_detect_valid_card_but_invalid_size() throws {
        let card = CreditCardStrategy.detectCreditCard("4")
        XCTAssertNotNil(card)
        XCTAssertFalse(card!.isValid(cardCode: "4"))
    }
    
    func test_detect_visa_card_but_mastercard_code() throws {
        let expected = "Visa"
        let card = CreditCardStrategy.detectCreditCard("4")
        XCTAssertEqual(card?.name, expected)
        XCTAssertFalse(card!.isValid(cardCode: "5105105105105100"))
    }
    
    // mastercard
    
    func test_detect_mastercard_valid_prefix_51() throws {
        let expected = "Mastercard"
        let card = CreditCardStrategy.detectCreditCard("5105105105105100")
        XCTAssertEqual(card?.name, expected)
        XCTAssertTrue(card!.isValid(cardCode: "5105105105105100"))
    }
    
    func test_detect_mastercard_valid_prefix_52() throws {
        XCTAssert(false, "TODO: mastercard prefix 52")
    }
    
    func test_detect_mastercard_valid_prefix_53() throws {
        XCTAssert(false, "TODO: mastercard prefix 53")
    }
    
    func test_detect_mastercard_valid_prefix_54() throws {
        XCTAssert(false, "TODO: mastercard prefix 54")
    }
    
    func test_detect_mastercard_valid_prefix_55() throws {
        XCTAssert(false, "TODO: mastercard prefix 55")
    }
    
    func test_detect_mastercard_but_invalid_code() throws {
        let code = "55"
        let card = CreditCardStrategy.detectCreditCard(code)
        XCTAssertEqual(card?.name, "Mastercard")
        XCTAssertFalse(card!.isValid(cardCode: code))
    }
    
    // visa
    
    func test_detect_visa_but_invalid_code() throws {
        let code = "4"
        let card = CreditCardStrategy.detectCreditCard(code)
        XCTAssertEqual(card?.name, "Visa")
        XCTAssertFalse(card!.isValid(cardCode: code))
    }
        
    func test_detect_visa_prefix_valid_13_size() throws {
        let expected = "Visa"
        let card = CreditCardStrategy.detectCreditCard("4222222222222")
        XCTAssertEqual(card?.name, expected)
        XCTAssertTrue(card!.isValid(cardCode: "4222222222222"))
    }
    
    func test_detect_visa_prefix_valid_16_size() throws {
        XCTAssert(false, "TODO: valid visa size 16")
    }
    
    func test_detect_visa_prefix_16_size_but_invalid_code() throws {
        let expected = "Visa"
        let card = CreditCardStrategy.detectCreditCard("4222222222222222")
        XCTAssertEqual(card?.name, expected)
        XCTAssertFalse(card!.isValid(cardCode: "4222222222222222"))
    }
    
    // amex
    
    func test_detect_valid_amex_prefix_34_but_invalid_code() throws {
        let expected = "Amex"
        let card = CreditCardStrategy.detectCreditCard("34")
        XCTAssertEqual(card?.name, expected)
        XCTAssertFalse(card!.isValid(cardCode: "34"))
    }
    
    func test_detect_valid_amex_prefix_37_but_invalid_code() throws {
        let expected = "Amex"
        let card = CreditCardStrategy.detectCreditCard("37")
        XCTAssertEqual(card?.name, expected)
        XCTAssertFalse(card!.isValid(cardCode: "37"))
    }
    
    func test_detect_amex_valid_prefix_34() throws {
        XCTAssert(false, "TODO: amex prefix 34")
    }
        
    func test_detect_amex_valid_prefix_37() throws {
        let expected = "Amex"
        let card = CreditCardStrategy.detectCreditCard("378282246310005")
        XCTAssertEqual(card?.name, expected)
        XCTAssertTrue(card!.isValid(cardCode: "378282246310005"))
    }
    
    // Diners
    
    func test_detect_valid_diners_prefix_30_but_invalid_code() throws {
        let expected = "Diners"
        let card = CreditCardStrategy.detectCreditCard("30")
        XCTAssertEqual(card?.name, expected)
        XCTAssertFalse(card!.isValid(cardCode: "30"))
    }
    
    func test_detect_valid_diners_prefix_36_but_invalid_code() throws {
        let expected = "Diners"
        let card = CreditCardStrategy.detectCreditCard("36")
        XCTAssertEqual(card?.name, expected)
        XCTAssertFalse(card!.isValid(cardCode: "36"))
    }
    
    func test_detect_valid_diners_prefix_38_but_invalid_code() throws {
        let expected = "Diners"
        let card = CreditCardStrategy.detectCreditCard("38")
        XCTAssertEqual(card?.name, expected)
        XCTAssertFalse(card!.isValid(cardCode: "38"))
    }
    
    func test_detect_diners_valid_prefix_30() throws {
        XCTAssert(false, "TODO: diners prefix 30")
    }
    
    func test_detect_diners_valid_prefix_36() throws {
        XCTAssert(false, "TODO: diners prefix 36")
    }
        
    func test_detect_diners_valid_prefix_38() throws {
        let expected = "Diners"
        let card = CreditCardStrategy.detectCreditCard("38520000023237")
        XCTAssertEqual(card?.name, expected)
        XCTAssertTrue(card!.isValid(cardCode: "38520000023237"))
    }
    
    // Discover
    
    func test_detect_valid_discover_prefix_but_invalid_code() throws {
        let expected = "Discover"
        let card = CreditCardStrategy.detectCreditCard("6011")
        XCTAssertEqual(card?.name, expected)
        XCTAssertFalse(card!.isValid(cardCode: "6011"))
    }
    
    func test_detect_discover_valid_prefix() throws {
        XCTAssert(false, "TODO: discover prefix")
    }
    
    // enRoute
    
    func test_detect_valid_enRoute_prefix_2014_but_invalid_code() throws {
        let expected = "enRoute"
        let card = CreditCardStrategy.detectCreditCard("2014")
        XCTAssertEqual(card?.name, expected)
        XCTAssertFalse(card!.isValid(cardCode: "2014"))
    }
    
    func test_detect_valid_enRoute_prefix_2149_but_invalid_code() throws {
        let expected = "enRoute"
        let card = CreditCardStrategy.detectCreditCard("2149")
        XCTAssertEqual(card?.name, expected)
        XCTAssertFalse(card!.isValid(cardCode: "2149"))
    }
    
    func test_detect_enRoute_valid_prefix_2014() throws {
        XCTAssert(false, "TODO: enRoute prefix 2014")
    }
    
    func test_detect_enRoute_valid_prefix_2149() throws {
        XCTAssert(false, "TODO: enRoute prefix 2149")
    }
    
    // JCB
        
    func test_detect_jcb_prefix_3_but_invalid_code() throws {
        let expected = "JCB"
        let card = CreditCardStrategy.detectCreditCard("3")
        XCTAssertEqual(card?.name, expected)
        XCTAssertFalse(card!.isValid(cardCode: "3"))
    }
    
    func test_detect_jcb_prefix_2131_but_invalid_code() throws {
        let expected = "JCB"
        let card = CreditCardStrategy.detectCreditCard("2131")
        XCTAssertEqual(card?.name, expected)
        XCTAssertFalse(card!.isValid(cardCode: "2131"))
    }
    
    func test_detect_jcb_prefix_1800_but_invalid_code() throws {
        let expected = "JCB"
        let card = CreditCardStrategy.detectCreditCard("1800")
        XCTAssertEqual(card?.name, expected)
        XCTAssertFalse(card!.isValid(cardCode: "1800"))
    }
    
    func test_detect_jcb_valid_prefix_3() throws {
        XCTAssert(false, "TODO: JCB prefix 3")
    }
    
    func test_detect_jcb_valid_prefix_2131() throws {
        XCTAssert(false, "TODO: JCB prefix 2131")
    }
    
    func test_detect_jcb_valid_prefix_1800() throws {
        XCTAssert(false, "TODO: JCB prefix 1800")
    }
}
