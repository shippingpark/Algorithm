//
//  최소, 최대.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/06.
//

import Foundation

let input: Int = Int(readLine()!)!

let numberList: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }

print("\(numberList.min()!) \(numberList.max()!)")
