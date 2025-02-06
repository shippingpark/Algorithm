//
//  main.swift
//  삼각달팽이
//
//  Created by 박혜운 on 2/6/25.
//

import Foundation

func solution_삼각달팽이(_ n: Int) -> [Int] {
  var map = Array(repeating: Array(repeating: 0, count: n), count: n)
  var num = 1
  let limit = (n*(n+1))/2
  var (nx, ny) = (0, 0)
  
  while num <= limit {
    while true {
      map[nx][ny] = num
      num += 1
      guard nx+1 < n && map[nx+1][ny] == 0 else { break }
      nx += 1
    }
    guard num <= limit else { break }
    ny += 1
    while true {
      map[nx][ny] = num
      num += 1
      guard ny+1 < n && map[nx][ny+1] == 0 else { break }
      ny += 1
    }
    
    guard num <= limit else { break }
    nx -= 1
    ny -= 1
    while true {
      map[nx][ny] = num
      num += 1
      guard nx-1 >= 0 && ny-1 >= 0 && map[nx-1][ny-1] == 0 else { break }
      nx -= 1
      ny -= 1
    }
    
    nx += 1
  }
  
  return map.flatMap { $0.filter { $0 != 0 } }
}


print(solution_삼각달팽이(5))
