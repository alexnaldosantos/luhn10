//
//  CreditCard.swift
//  luhn
//
//  Created by Alexnaldo Carvalhos dos Santos on 25/01/22.
//

import Foundation

public protocol CreditCard {
    var name: String { get }
    var prefix: [String] { get }
    var size: Int { get }
    func sum(cardCode: String) -> Int?
}

public class DefaultCreditCard : CreditCard {
    
    public let name: String
    public let prefix: [String]
    public let size: Int
    
    public init(name: String, prefix: [String], size: Int) {
        self.name = name
        self.prefix = prefix
        self.size = size
    }
    
    public func sum(cardCode: String) -> Int? {
        if(!isIt(cardCode: cardCode)){
            return nil
        }
        return Luhn10.sum(cardCode)
    }
    
    func isIt(cardCode: String) -> Bool {
        var isMe = prefix.contains { value in
            return checkMatchCreditCardPrefix(cardCode, prefix: value)
        }
        isMe = isMe && cardCode.count == size
        return isMe
    }
    
    func checkMatchCreditCardPrefix(_ cardCode: String, prefix: String) -> Bool {
        return cardCode.prefix(prefix.count) == prefix
    }
}

public class CreditCardStrategy {
    
    static var creditCards = [
        DefaultCreditCard(name: "Mastercard", prefix: ["51","52","53","54","55"], size: 16),
        DefaultCreditCard(name: "Visa", prefix: ["4"], size: 13),
        DefaultCreditCard(name: "Visa", prefix: ["4"], size: 16),
        DefaultCreditCard(name: "Amex", prefix: ["34","37"], size: 15),
        DefaultCreditCard(name: "Diners", prefix: ["30","36","38"], size: 14),
        DefaultCreditCard(name: "Discover", prefix: ["6011"], size: 16),
        DefaultCreditCard(name: "enRoute", prefix: ["2014","2149"], size: 15),
        DefaultCreditCard(name: "JCB", prefix: ["3"], size: 16),
        DefaultCreditCard(name: "JCB", prefix: ["2131","1800"], size: 15)
    ]
    
    public static func detectCreditCard(_ cardCode: String) -> CreditCard? {
        for creditCard in creditCards {
            if(creditCard.isIt(cardCode: cardCode)){
                return creditCard
            }
        }
        return nil
    }
}

