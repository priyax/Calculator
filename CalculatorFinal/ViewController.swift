//
//  ViewController.swift
//  CalculatorFinal
//
//  Created by Priya Xavier on 6/17/16.
//Copyright © 2016 Priya. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var Display: UILabel!
     var isIntheMiddleOfTypying : Bool = false
     var OperandStack = Array<Double>()
     var currentMathFunction :String = ""
     var nextMathFunction :String = ""
    
     var formatter = NumberFormatter()
  
    var operatorHasBeenSelected :Bool = false


    
    @IBAction func AppendDigit(_ sender: UIButton)
    {
        let digit = sender.currentTitle!
         if isIntheMiddleOfTypying
        { Display.text = Display.text! + digit
          print("Display text = \(Display.text!)")
        }
        else {
        Display.text = digit
        isIntheMiddleOfTypying = true
        }

        operatorHasBeenSelected = false
        print("Operator Has been selected \(operatorHasBeenSelected)")
    }
    
    
    @IBAction func AllClear()
    {
        Display.text = "0"
        isIntheMiddleOfTypying = false
        OperandStack = []
        currentMathFunction = ""
        nextMathFunction = ""
        operatorHasBeenSelected = false
    }
    
    @IBAction func Percentage() {
        formatter.usesSignificantDigits = true
        var value = formatter.number(from: Display.text!)!.doubleValue
        value = value / 100

        Display.text = formatter.string(from: NSNumber(value: value))
    }
    
    @IBAction func DecimalPoint() {
        let value = formatter.number(from: Display.text!)!.doubleValue
      //check if number is already a fraction
      
          if isIntheMiddleOfTypying {
            if value == floor(value){
              Display.text = Display.text! + "."   //Add decimal point only if its an integer
            }
          } else {
            Display.text = "0."
            isIntheMiddleOfTypying = true
          }
      
      
    }
    
    @IBAction func Sign() {
        formatter.usesSignificantDigits = true
        var value = formatter.number(from: Display.text!)!.doubleValue
        value = value * -1
        Display.text = formatter.string(from: NSNumber(value: value))
        isIntheMiddleOfTypying = true
    }
    
    @IBAction func math(_ sender: UIButton)
    {
        var answer :Double = 0
        isIntheMiddleOfTypying = false
      formatter.usesSignificantDigits = true
      formatter.alwaysShowsDecimalSeparator = false

        if operatorHasBeenSelected == false {
          
          //Convert text into NSNumber
            let operand = formatter.number(from: Display.text!)!.doubleValue
            OperandStack.append(operand) // Add numbers to be operated on into an array
            operatorHasBeenSelected = true
            print("\(OperandStack)") //print
            print("Operator has been selected \(operatorHasBeenSelected)")
        }
       
        if sender.currentTitle! != "="
        {
            if OperandStack.count < 2 {
                currentMathFunction = sender.currentTitle!}
            else {
                nextMathFunction = sender.currentTitle!
            }
            
            print("current math fn \(currentMathFunction). next math fn \(nextMathFunction)")
        }
        
      if OperandStack.count == 2
        { switch currentMathFunction
                      {
                        case "+": answer = OperandStack[0] + OperandStack[1]
            
            
                        case "-": answer = OperandStack[0] - OperandStack[1]
            

                        case "/": answer = OperandStack[0] / OperandStack[1]
            
                
                        case "x": answer = OperandStack[0] * OperandStack[1]
            
                
                        default : Display.text = " "
            
                        }
          Display.text = formatter.string(from: NSNumber(value: answer))
          
          OperandStack = [answer]  //Store the answer in the array for continuing calculations
          
          print("Operand Stack = \(OperandStack)")
          print("Answer =\(String(answer))")
          
          if sender.currentTitle == "=" {
            OperandStack = [] //Clear the array to start a new calculation
            currentMathFunction = ""
            nextMathFunction = ""
            operatorHasBeenSelected = false
          }
            else {
            currentMathFunction = nextMathFunction
            nextMathFunction = ""

           }
          //print("\(operatorHasBeenSelected)")
       
        }
      }
    
   }
