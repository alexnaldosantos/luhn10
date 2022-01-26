//
//  Luhn.swift
//  luhn
//
//  Created by Alexnaldo Carvalhos dos Santos on 24/01/22.
//
/* Material : http://www.inf.ufrgs.br/arq/wiki/lib/exe/fetch.php?media=wiki:trab:cesar:2008-2-numero_de_cartao_de_credito.pdf */

import Foundation


public class Luhn10 {
    internal static func sum(_ value: String) -> Int? {
        func sumEachDigit(_ number: Int) -> Int {
            var sum = 0
            let numbers = String(number).reversed().map { String($0) }
            for item in numbers.enumerated() {
                sum += Int(item.element)!
            }
            return sum
        }
        if(value.isEmpty){
            return nil
        }
        var sum = 0
        var isOdd = true
        let numbers = value.reversed().map { String($0) }
        for item in numbers.enumerated() {
            guard let number = Int(item.element) else {
                return nil
            }
            sum += isOdd ? number : sumEachDigit(number * 2)
            isOdd = !isOdd
        }
        return sum
    }
}
