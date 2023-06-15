//
//  사격내기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/14.
//

import Foundation

let input: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }
let result = (input[0] | input[1]) & (input[0] ^ input[1])
print(result)
