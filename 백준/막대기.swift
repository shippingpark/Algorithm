//
//  막대기.swift
//  Algorithm
//
//  Created by 박혜운 on 12/15/23.
//

import Foundation

// MARK: - 1


var sum = Int(readLine()!)!
var arr: [Int] = [64]
while arr.last != 1 {
  arr.append(arr.last! / 2)
}

var result = 0
for i in 0..<arr.count {
  result += sum / arr[i]
  sum -= arr[i] * (sum / arr[i])
  
  if sum == 0 {
    break
  }
}

print(result)


// MARK: - 2

// 기준 숫자 64를 계속해서 2로 나눠가며, 0이 될 때 까지 진행

var n = Int(readLine()!)!
var stickLen = 64
var result = 0

while n != 0 {
  let stickCount = n / stickLen
  result += stickCount
  n -= stickCount * stickLen
  stickLen /= 2
}

print(result)


// MARK: - 3

var n = Int(readLine()!)!
var divisionStick = 64
var fullCount = 0

while n != 0 {
  let stickCount = n / divisionStick
  n -= divisionStick * stickCount
  fullCount += stickCount
  divisionStick /= 2
}

print(fullCount)


// MARK: - 3
// 남의 풀이를 가져왔다
// 2진수로 풀면 쉬운 거였구나...^^ ⭐️특정 값으로 나누어지는 경우에는 반드시 n진수의 활용을 고려하여야 겠다

let n = Int(readLine()!)!
let str = String(n, radix: 2) // 주어진 값이 2진수로 뽀개면 얼마나 뽀개지는 지 확인할 수 있다
let c = str.filter{ $0 == "1" }.count
print(c)
