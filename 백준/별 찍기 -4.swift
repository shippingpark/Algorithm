//
//  별 찍기 -4.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/06.
//

let input: Int = Int(readLine()!)!

for i in 0..<input {
    var empty = String(repeating: " ", count: i)
    var star = String(repeating: "*", count: input - i)
    print(empty+star)
}
