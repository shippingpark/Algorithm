//
//  주사위 세개.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/06.
//


let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
var diceCount: [Int] = Array(repeating: 0, count: 7)

for dic in input {
    diceCount[dic] = diceCount[dic] + 1
}

let maxCount: Int = diceCount.max()!

var result = diceCount.enumerated().filter { $0.element == maxCount }

if maxCount == 3 {
    print(10000 + 1000 * result.last!.offset)
} else if maxCount == 2 {
    print(1000 + 100 * result.last!.offset)
} else {
    print(100 * result.last!.offset)
}
