//
//  짐 챙기는 숌.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/09/06.
//

import Foundation

func solve() {
  let input = readLine()!.split(separator: " ").compactMap{ Int($0) },
  bookcount = input[0], maxWeight = input[1]
  
  guard bookcount != 0 else {print("0"); return}

  var books = readLine()!.split(separator: " ").compactMap{ Int($0) }
  var validWeight = maxWeight
  var result = 1

  for book in books {
    if validWeight < book {
      validWeight = maxWeight - book
      result += 1
    } else {
      validWeight -= book
    }
  }

  print(result)
}

solve()
