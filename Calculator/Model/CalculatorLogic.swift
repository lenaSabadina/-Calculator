//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Lena Sabadina on 2019-09-25.
//  Copyright © 2019 Whiskerz AB. All rights reserved.
//

import Foundation

enum CalculatorFunction: String {
    case plusMinus = "+/-"
    case clear = "C"
    case percentage = "%"
    case addition = "+"
    case subtraction = "-"
    case multiplication = "x"
    case division = "/"
    case result = "="
    
    case unknown = "?"
}

struct CalculatorLogic {
    
    private var number: Double?
    private var intermediateCalculation: (n1: Double, operation: CalculatorFunction)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: CalculatorFunction) -> Double? {
        guard let n = number else { return nil }
        
        switch symbol {
        case .clear:
            return 0
        case .percentage:
            return n / 100
        case .plusMinus:
            return n * -1
        case .result:
            return performTwoNumberCalculation(n2: n)
        default:
            intermediateCalculation = (n1: n, operation: symbol)
        }
        return nil
    }
    
    private func performTwoNumberCalculation(n2: Double) -> Double? {
        if let n1 = intermediateCalculation?.n1, let operation = intermediateCalculation?.operation {
            switch operation {
            case .addition:
                return n1 + n2
            case .subtraction:
                return n1 - n2
            case .multiplication:
                return n1 * n2
            case .division:
                return n1 / n2
            default:
                fatalError("The operation passed in doesn't match any of the cases.")
            }
        }
        return nil
    }
}
