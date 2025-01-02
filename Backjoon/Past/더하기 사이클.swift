//
//  더하기 사이클.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/06.
//

import Foundation

let input: Int = Int(readLine()!)!
var before: Int = 0
var after: Int = input
var count: Int = 0

repeat {
    before = after
    let newNumber = ((before / 10) + (before % 10)) % 10
    after = (before % 10 * 10) + newNumber % 10
    count += 1
} while input != after

print(count)
