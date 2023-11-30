//
//  뒤집기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/11/24.
//

import Foundation

// MARK: - 1 O(N)

let S = readLine()!

func solve(S: String) {
  let arrayZero = S.split(separator: "0")
  let arrayOne = S.split(separator: "1")
  print( min(arrayZero.count, arrayOne.count) )
}

solve(S: S)

// MARK: - 2

let s = readLine()!

func solve2(s: String) {
  let first = s.split(separator: "0")
  let second = s.split(separator: "1")
  print(min(first.count, second.count))
}

solve2(s: s)



// MARK: - 3
// 2차 시 보다 간략하게 풀 수 있었지만, 가독성은 더 나쁘다 

let line = readLine()!

print(min(line.split(separator:"0").count, line.split(separator:"1").count))




// MARK: - 4

let line = readLine()!

print(min(line.split(separator: "0").count, line.split(separator: "1").count))

