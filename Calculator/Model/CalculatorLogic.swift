//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Lena Sabadina on 2019-09-25.
//  Copyright © 2019 Whiskerz AB. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    var number: Double 
    
    func calculate(symbol: String) -> Double? {
    
        switch(symbol) {
        case "+/-":
            return number * -1
        case "C":
            return 0
        case "%":
            return number / 100
        default:
            return nil
        }
//        if symbol == "+/-" {
//            return number * -1
//        } else if symbol == "C" {
//            return 0
//        } else if symbol == "%" {
//            return number / 100
//        }
//        return nil
    }
    
}
