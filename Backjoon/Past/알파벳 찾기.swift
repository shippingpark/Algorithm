//
//  알파벳 찾기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/06.
//

import Foundation

let input: String = readLine()!
let lowercaseAlphabets: [Character] = (97...122).compactMap { Character(UnicodeScalar($0)) }

var resultArray: [Int] = Array(repeating: -1, count: lowercaseAlphabets.count)

for i in 0..<input.count {
    let alphabet = input[input.index(input.startIndex, offsetBy: i)]
    if let index = lowercaseAlphabets.firstIndex(of: alphabet) {
        if resultArray[index] == -1 {
            resultArray[index] = i
        }
    }
}

print(resultArray.map{ String($0) }.joined(separator: " "))
