//
//  File.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/06.
//

import Foundation

let input: [Int] = readLine()!.split(separator: " ").map { Int( String(String($0).reversed()) )! }

print(input.max()!)

