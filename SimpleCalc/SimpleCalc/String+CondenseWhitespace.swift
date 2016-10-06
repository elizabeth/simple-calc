//
//  String+CondenseWhitespace.swift
//  SimpleCalc
//
//  Created by iGuest on 10/6/16.
//  Copyright © 2016 Elizabeth. All rights reserved.
//
//  Thanks stackoverflow http://stackoverflow.com/questions/33058676/how-to-remove-multiple-spaces-in-strings-with-swift-2

import Foundation

extension String {
    var condensedWhitespace: String {
        let components = self.components(separatedBy: NSCharacterSet.whitespacesAndNewlines)
        return components.filter { !$0.isEmpty }.joined(separator: " ")
    }
}
