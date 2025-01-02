//
//  수열.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/07/12.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let count = input[0]
let check = input[1]

let line: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }

var buket = line[0..<check].reduce(0, +)
var result = buket

if count == check {
  print(buket)
} else {
  for i in 1...(count-check) {
    buket -= line[i-1] //이전 시작점 삭제
    buket += line[i+check-1] //추가되는 마지막 요소
    result = max(result, buket)
  }
  print(result)
}

// MARK: - 시간초과 코드

//let input = readLine()!.split(separator: " ").map{ Int($0)! }
//let count = input[0]
//let check = input[1]
//
//let line: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }
//
//var result = Int.min
//for i in 0...(count-check) {
//    result = max(result, line[i..<i+check].reduce(0, +))
//}
//
//print(result)
