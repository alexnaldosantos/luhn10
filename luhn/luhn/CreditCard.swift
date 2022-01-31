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
    func isValid(cardCode: String) -> Bool
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
    
    public func isValid(cardCode: String) -> Bool {
        if(!isIt(cardCode: cardCode)){
            return false
        }
        return cardCode.count == size && Luhn10.isValid(cardCode)
    }
    
    func isIt(cardCode: String) -> Bool {
        let isMe = prefix.contains { value in
            return checkMatchCreditCardPrefix(cardCode, prefix: value)
        }
        return isMe
    }
    
    func checkMatchCreditCardPrefix(_ cardCode: String, prefix: String) -> Bool {
        return cardCode.prefix(prefix.count) == prefix
    }
}

public final class Visa : DefaultCreditCard {
    
    public init() {
        super.init(name: "Visa", prefix: ["4"], size: 0)
    }
    
    override public func isValid(cardCode: String) -> Bool {
        if(!isIt(cardCode: cardCode)){
            return false
        }
        return (cardCode.count == 13 || cardCode.count == 16) && Luhn10.isValid(cardCode)
    }
}

public class CreditCardStrategy {
    
    /*
    A ordem da lista é importante porque alguns prefixos são aparentemente compostos por outros.
    Ex: "3" (JCB) é o mesmo inicial do Amex e Diners. Por isso, na lista, o JCB deve ser o último a ser verificado.
    * */
    static var creditCards = [
        DefaultCreditCard(name: "Mastercard", prefix: ["51","52","53","54","55"], size: 16),
        Visa() /* especial porque o mesmo código tem 2 tamanhos */,
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

