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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func funcButtonPressed(_ sender: UIButton) {
        isFinishedTyping = true
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishedTyping {
            displayLabel.text = numValue
                isFinishedTyping = false
            } else {
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
    
}

