//
//  잃어버린 괄호.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/08/24.
//

var input = readLine()!.split(separator: "-").map {String($0)}
let first = input.removeFirst().split(separator: "+").map {Int(String($0))!}
var result = first.reduce(0, +)

var temp = input.map{ $0.split(separator: "+").map{Int(String($0))!}.reduce(0, +)}.reduce(0, +)

print(result-temp)
