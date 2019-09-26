//
//  ViewController.swift
//  Calculator
//
//  Created by Lena Sabadina on 2019-09-24.
//  Copyright © 2019 Whiskerz AB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTyping = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Can't convert display label text into a Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func funcButtonPressed(_ sender: UIButton) {
        isFinishedTyping = true
        calculator.setNumber(displayValue)
        if let calcMethod = sender.currentTitle {
            
            guard let result = calculator.calculate(symbol: CalculatorFunction(rawValue: calcMethod) ?? .unknown) else {
                fatalError("The result of the calculation is nil")
            }
            displayValue = result
        }
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTyping {
                if numValue == "." {
                    displayLabel.text = "0."
                } else {
                    displayLabel.text = numValue
                }
                isFinishedTyping = false
            } else {
                if let textLabel = displayLabel.text {
                    if !textLabel.contains(".") || numValue != "." {
                        displayLabel.text = textLabel + numValue
                    }
                }
            }
        }
    }
    
}

