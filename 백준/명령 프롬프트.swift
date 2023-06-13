//
//  명령 프롬프트.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/13.
//

import Foundation

let count: Int = Int(readLine()!)!
var array: [String] = Array(repeating: "", count: 50)

for _ in 0..<count {
    let input: [String] = readLine()!.map{ String($0) }
    array = (0..<input.count).map { array[$0] == "" ? input[$0] : array[$0] }
    array = (0..<input.count).map { array[$0] == input[$0] ? array[$0] : "?" }
}

print(array.joined())
