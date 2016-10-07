//
//  main.swift
//  SimpleCalc
//
//  Created by Elizabeth on 10/4/16.
//  Copyright © 2016 Elizabeth. All rights reserved.
//

import Foundation

private let operation = ["+", "-", "*", "/", "%"]
private let multiOperation = ["count", "avg", "fact"]

// calculate and print the result of the operation
func calculate(first: Double, second: Double, op: String) {
    switch op {
    case operation[0]:
        print("Result: \(first) \(operation[0]) \(second) = \(first + second)")
    case operation[1]:
        print("Result: \(first) \(operation[1]) \(second) = \(first - second)")
    case operation[2]:
        print("Result: \(first) \(operation[2]) \(second) = \(first * second)")
    case operation[3]:
        print("Result: \(first) \(operation[3]) \(second) = \(first / second)")
    case operation[4]:
        print("Result: \(first) \(operation[4]) \(second) = \(first.truncatingRemainder(dividingBy: second))")
    default:
        print("Error. Please try again")
    }
}

func calculateMulti(array: Array<String>) {
    let operand = array[array.count - 1]
    let numLength = array.count - 1;
    
    operate: switch operand {
    case multiOperation[0]:
        for i in 0..<numLength {
            guard Double(array[i]) != nil else {
                print("Must enter valid numbers. Please try again")
                break operate
            }
        }
        print("Result: \(numLength)")
    case multiOperation[1]:
        var avg: Double = 0
        
        for i in 0..<numLength {
            guard let num = Double(array[i]) else {
                print("Must enter valid numbers. Please try again")
                break operate
            }
            avg += num
        }
        print("Result: \(avg/Double(numLength))")
    case multiOperation[2]:
        let first: Int? = Int(array[0])
        if first == nil{
            print("Factorial number must be an integer")
        } else if numLength > 1 {
            print("Factorial can only accept one number")
        } else if first! < 0 {
            print("Factorial number must be 0 or greater")
        } else if first == 0 {
            print("Result: 1")
        } else {
            var result = first!
            var temp = first! - 1
            while temp > 0 {
                result = result * temp
                temp = temp - 1
            }

            print("Result: \(result)")
        }
    default:
        print("Must enter valid a valid operation: count, avg, fact. Please try again")
    }
}

func getValidNum() -> Double {
	var num: Double? = nil
	repeat {
		print("Please enter a valid number:")
        let input = readLine(strippingNewline: true)?.condensedWhitespace
        checkExit(input: input!)
        num = Double(input!)
	} while (num == nil)

	return num!
}

func checkExit(input: String) {
    if input == "exit" {
        exit(0)
    }
}

// This runs first
while true {
	print("Enter an expression separated by returns or a multi-operand operation (Type exit to exit):")

	if let response = readLine(strippingNewline: true)?.condensedWhitespace {
		var input = response.components(separatedBy: " ")

		// check if multiple arguments entered in first input (normal operation) or operation operation
		if input.count == 1 {
            checkExit(input: input[0])
            
			var first = Double(input[0])
			if first == nil {
				first = getValidNum()
			}

            var inputOp = readLine(strippingNewline: true)?.condensedWhitespace
            
			while !(operation.contains(inputOp!)) {
                checkExit(input: inputOp!)
                
                print("Must enter a valid operation: +, -, *, /, %:")
                inputOp = readLine(strippingNewline: true)?.condensedWhitespace
            }
            
            var inputSecond = (readLine(strippingNewline: true))?.condensedWhitespace
            
            var second = Double(inputSecond!)
            if second == nil {
                second = getValidNum()
            }
                
            calculate(first: first!, second: second!, op: inputOp!)
		} else {
			calculateMulti(array: input)
		}
	}
    
    print()
}
