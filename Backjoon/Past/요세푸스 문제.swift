//
//  요세푸스 문제.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/23.
//

import Foundation

let input = readLine()!.split(separator: " ").map{String($0)}
var n = Int(input[0])!
let k = Int(input[1])!
var array:[String] = Array(1...n).map{String($0)}
var result:[String] = []
var point = 0

while !array.isEmpty {
    point += k - 1
    point = point % array.count
    result.append(array.remove(at: point))
}

//print("<\(result.map{String($0)}.joined(separator: ", "))>")
