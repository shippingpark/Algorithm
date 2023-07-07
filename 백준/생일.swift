//
//  생일.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/07/07.
//

import Foundation

let number = Int(readLine()!)!
var personList:[[String]] = []

for _ in 0..<number {
    let input = readLine()!.split(separator: " ").map{ String($0) }
    personList.append(input)
}

personList.sort {
  var arr1 = $0[1...3].map{ Int($0)! }
  var arr2 = $1[1...3].map{ Int($0)! }
  if arr1[2] != arr2[2] {
    return arr1[2] > arr2[2]
  } else if arr1[1] != arr2[1] {
    return arr1[1] > arr2[1]
  } else {
    return arr1[0] > arr2[0]
  }
}

print(personList.first![0])
print(personList.last![0])
