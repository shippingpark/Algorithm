//
//  Base Conversion.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/08/07.
//

let input = readLine()!.split(separator: " ").compactMap{ Int($0) },
A = input[0],
B = input[1]

let numberCount = Int(readLine()!)!
let Anumber = readLine()!.split(separator: " ").compactMap{ Int($0) }
var tenNumber = (0..<numberCount).map {
  var x = 1
  for _ in 0..<$0 {
    x *= A
  }
  return Anumber[numberCount-$0-1] * x
}.reduce(0, +)

var result: [Int] = []
var tempNumber = tenNumber

while tempNumber > 0 {
  let digit = tempNumber % B
  result.append(digit)
  tempNumber /= B
}

result = result.reversed()
for i in result {
  print(i, terminator: " ")
}
