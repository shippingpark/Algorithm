//
//  카드(1).swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/13.
//

import Foundation

let input: Int = Int(readLine()!)!
var stack: [Int] = (1...input).map { Int($0) }.reversed()
var result: [Int] = []

while !stack.isEmpty {
    result.append(stack.removeLast())
    guard let next = stack.popLast() else { continue }
    stack.insert(next, at: 0)
}

print(result.map{ String($0) }.joined(separator: " "))

