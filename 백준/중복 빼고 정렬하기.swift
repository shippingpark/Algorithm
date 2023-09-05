//
//  중복 빼고 정렬하기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/09/05.
//


let _ = readLine()
var input = Set(readLine()!.split(separator: " "))
for i in input.map({Int($0)!}).sorted(by: <) {
  print("\(i)", terminator: " ")
}

