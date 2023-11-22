//
//  3과 7.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/11/22.
//

import Foundation

// 1. Int를 자리마다 확인하려면 String으로 변환하다
//    하지만 Swift는 문자열 처리가 까다롭기 때문에 (index 접근이 까다롭기 때문에), Array로의 변환을 고려한다

func threeAndSeven(N: Int) {
  var count = 0
  for i in 1...N {
    let word = String(i)
    for char in word {
      if char == "3" || char == "7" {
        count += 1
      }
    }
  }
  print(count)
}

threeAndSeven(N: 37)
threeAndSeven(N: 100)
