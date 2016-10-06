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
            print("Must enter a valid operation")
    }
}

func multiOperation(array: Array<String>) {
    let operand = array[array.count - 1]
    let numLength = array.count - 2;
    
    switch operand {
        case "count":
            print("Result: \(numLength)")
        case "avg":
            var avg = 0
            
            for i in 0...numLength {
                avg += Int(array[i])!
            }
    
            print("Result: \(avg)")
        case "fact":
            let first = Int(array[0])
            if (numLength == 1) {
                print("Factorial can only accept one number")
            } else if first! < 0 {
                print("Factorial number must be 0 or greater")
            } else {
                guard let first = Int(array[0]) else {
                    print("Factorial number must be an integer")
                    exit(0)
                }
            
                var result = first
                var temp = first
                repeat {
                    temp = temp - 1
                    result = result * first
                } while (temp > 0)
            }
    }
}

print("Enter an expression separated by returns or a multi-operand operation:")

if let response = readLine(stripNewLine: true)! {
	var input = split(response!) {$0 == " "}

	// check if multiple arguments entered in first input (normal operation) or multioperand operation
	if input.count == 1 {
		
		var first = Double(input[0]) 
		while first == nil {
			print("Must enter a valid number")
			let num = readLine(stripNewLine: true)!
			first = Double(input[0])
		}

		if let operation = readLine(stripNewLine: true) {
			if let inputSecond = readLine(stringNewLine: true) {
				guard let second = Double(inputSecond) else {
					print("Must enter a valid number")
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
} else {
    print("Nothing")
}

exit(0)



//
//let num = UInt.init(response)!
