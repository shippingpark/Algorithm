//
//  뒤집기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/11/24.
//

import Foundation

let S = readLine()!

func solve(S: String) {
  let arrayZero = S.split(separator: "0")
  let arrayOne = S.split(separator: "1")
  print( min(arrayZero.count, arrayOne.count) )
}

solve(S: S)
