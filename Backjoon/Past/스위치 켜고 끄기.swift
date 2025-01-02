//
//  스위치 켜고 끄기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/14.
//

import Foundation

let fullCount: Int = Int(readLine()!)!
let array: [String] = readLine()!.split(separator: " ").map { String($0) }
var result: [String] = array
let count: Int = Int(readLine()!)!

for _ in 1...count {
    let input: [String] = readLine()!.split(separator: " ").map { String($0) }
    let option: String = input[0]
    let position: Int = Int(input[1])!
    
    switch option {
    case "1":
        var index = position - 1
        while index < fullCount {
            result[index] = result[index] == "1" ? "0" : "1"
            index += position
        }
    case "2":
        var left = position - 1
        var right = position - 1
        while true {
            guard (left-1) >= 0 && (right+1) < fullCount else { break }
            guard result[left-1] == result[right+1] else { break }
            left -= 1
            right += 1
        }
      (left...right).forEach{ result[$0] = result[$0] == "1" ? "0" : "1" }

    default: break
    }
}

var index = 0
while index < fullCount {
  print(result[index], terminator: " ")
  index += 1
  if (index) % 20 == 0 {
    print("")
  }
}
