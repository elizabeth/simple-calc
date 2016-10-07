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
    let numLength = array.count - 2;
    
    operate: switch operand {
    case multiOperation[0]:
        for i in 1..<numLength + 1 {
            guard Double(array[i]) != nil else {
                print("Must enter valid numbers. Please try again")
                break operate
            }
        }
        
        print("Result: \(numLength)")
    case multiOperation[1]:
        var avg: Double = 0
        
        for i in 1..<numLength + 1 {
            guard let num = Double(array[i]) else {
                print("Must enter valid numbers. Please try again")
                break operate
            }
            avg += num
        }
        print("Result: \(avg/Double(numLength))")
    case multiOperation[2]:
        let first: Int? = Int(array[1])
        if first == nil{
            print("Factorial number must be an integer. Please try again")
        } else if numLength > 1 {
            print("Factorial can only accept one number. Please try again")
        } else if first! < 0 {
            print("Factorial number must be 0 or greater. Please try again")
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

let arguments = CommandLine.arguments

// check if multiple arguments entered normal operation or multi operation
if arguments.count == 4 && operation.contains(arguments[2]) {
    var operation = arguments[2]
            
    guard let first = Double(arguments[1]) else {
        print("Invalid arguments please try again")
        exit(0)
    }
    
    guard let second = Double(arguments[3]) else {
        print("Invalid arguments please try again")
        exit(0)
    }
    
    calculate(first: first, second: second, op: operation)
} else if multiOperation.contains(arguments[arguments.count-1]) {
    calculateMulti(array: arguments)
} else {
    print("Invalid arguments please try again")
}

