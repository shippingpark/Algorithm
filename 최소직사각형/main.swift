//
//  main.swift
//  최소직사각형
//
//  Created by 박혜운 on 2/11/25.
//

import Foundation

// 넓이를 반환하므로 가로 길이인지 세로 길이인지는 중요하지 않음
// 즉, 짧은 값과 긴 값이 주어지는 것과 같다
// 짧은 값 중 가장 짧은 큰 길이와
// 긴 값 중 가장 긴 길이를 구하기

func solution_최소직사각형_값비교(_ sizes:[[Int]]) -> Int {
  var topMin = 0
  var topMax = 0
  sizes.forEach { size in
    topMin = max(topMin, size.min()!)
    topMax = max(topMax, size.max()!)
  }
  return topMin * topMax
}
