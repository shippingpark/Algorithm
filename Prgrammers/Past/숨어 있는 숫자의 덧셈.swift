//
//  숨어 있는 숫자의 덧셈.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/10.
//

import Foundation

func solution(_ my_string:String) -> Int {
    return extractNumbersFromString(my_string).reduce(0, +)
}

func extractNumbersFromString(_ input: String) -> [Int] {
    let characterSet = CharacterSet.decimalDigits.inverted
    let components = input.components(separatedBy: characterSet)
    let numbers = components.compactMap { Int($0) }
    
    return numbers
}
