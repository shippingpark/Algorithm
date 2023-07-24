//
//  햄버거 분배.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/07/25.
//

import Foundation

let input:[Int] = readLine()!.split(separator: " ").map{ Int($0)! }
var inputLine:[String] = readLine()!.map{ String($0) }
let (m, k) = (input[0], input[1])
var result = 0

for i in 0..<m {
    guard inputLine[i] == "P" else { continue }
    let start = (i - k >= 0) ? (i - k) : 0
    let finish = (i + k < m) ? (i + k) : (m - 1)
    for d in start...finish {
        if inputLine[d] == "H" {
            inputLine[d] = "X"
            result += 1
            break
        }
    }
}
print(result)
