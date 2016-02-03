//
//  ViewController.swift
//  Calculator
//
//  Created by Izaak Alpert on 2016-02-02.
//  Copyright © 2016 Izaak Alpert. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var display: UILabel!
	var userIsInTheMiddleOfTypingANumber: Bool = false

	@IBAction func appendDigit(sender: UIButton) {
		let digit = sender.currentTitle!
		if userIsInTheMiddleOfTypingANumber {
			display.text = display.text! + digit
		}
		else {
			userIsInTheMiddleOfTypingANumber = true
			display.text = digit			
		}
		print("digit = \(digit)")
	}
}

