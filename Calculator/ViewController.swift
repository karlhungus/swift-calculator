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
  }
  @IBAction func operate(sender: UIButton) {
    let operation = sender.currentTitle!
    if userIsInTheMiddleOfTypingANumber {
      enter()
    }
    switch operation {
    case "×":
      if operandStack.count >= 2 {
        displayValue = operandStack.removeLast() * operandStack.removeLast()
        enter()
      }
      //case "÷":
      //case "+":
      //case "-":
    default: break;
    }
  }
  
  var operandStack = Array<Double>()
  
  @IBAction func enter() {
    userIsInTheMiddleOfTypingANumber = false
    operandStack.append(displayValue)
    print("operandStack: \(operandStack)")
  }
  
  var displayValue : Double {
    get {
      return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
    }
    set {
      display.text = "\(newValue)"
      userIsInTheMiddleOfTypingANumber = false
    }
  }
  
}

