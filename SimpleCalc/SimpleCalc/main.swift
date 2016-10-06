//
//  main.swift
//  SimpleCalc
//
//  Created by Elizabeth on 10/4/16.
//  Copyright © 2016 Elizabeth. All rights reserved.
//

import Foundation

// calculate and print the result of the operation
func calculate(first: Double, second: Double, op: String) {
    switch op {
        case "+":
            print("Result: \(first + second)")
        case "-":
            print("Result: \(first - second)")
        case "*":
            print("Result: \(first * second)")
        case "/":
            print("Result: \(first / second)")
        case "%":
            print("Result: \(first.truncatingRemainder(dividingBy: second))")
        default:
            print("Must enter a valid operation: +, -, *, /, %")
    }
}

func multiOperation(array: Array<String>) {
    let operand = array[array.count - 1]
    let numLength = array.count - 1;
    
    switch operand {
        case "count":
            print("Result: \(numLength)")
        case "avg":
            var avg = 0
            
            for i in 0...<numLength {
                avg += Int(array[i])!
            }
    
            print("Result: \(avg/(numLength))")
        case "fact":
            let first = Int(array[0])!
            if first == nil{
            	print("Factorial number must be an integer") 
            } else if numLength > 1 {    
                print("Factorial can only accept one number"  
            } else if first < 0 {
                print("Factorial number must be 0 or greater")
            } else if first == 0 {
            	print("Result: 1")
            } else {
                var result = first
                var temp = first - 1
                while temp > 0 {
                    result = result * temp

                    temp = temp - 1
                }

                print("Result: \(result)")
            }
        default:
        	print("Must enter a valid operation: count, avg, fact")
    }
}

func getValidNum() -> Double {
	var num: T? = nil
	do {
		print("Must enter a valid number")
		num = readLine(strippingNewLine: true)!
	} while (num == nil)

	return Double(num)
}

// This runs first
while true {
	print("Enter an expression separated by returns or a multi-operand operation/nType exit to exit:")

	if let response = readLine(strippingNewLine: true) {
		var input = response.components(separatedBy: " ")

		// check if multiple arguments entered in first input (normal operation) or multioperand operation
		if input.count == 1 {
			if (input[0] == "exit") {
				exit(0)
			}

			var first = Double(input[0]) 
			if first == nil {
				first = getValidNum
			}

			if let operation = readLine(strippingNewline: true) {
				if let inputSecond = readLine(strippingNewLine: true) {
					guard var second = Double(inputSecond) if second == nil {
						second = getValidNum
					}
					
					calculate(first, second, operation)
				} else {
					print("Please enter a number")
				}
			} else {
				print("Please enter an operation")
				// 
			}
		} else {
			multiOperation(input)
		}
	}
}