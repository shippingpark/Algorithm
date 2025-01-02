//
//  게리멘더링2.swift
//  Algorithm
//
//  Created by 박혜운 on 1/15/24.
//

import Foundation

// MARK: - 1 : 보고 품, 근데 틀림 
// 모르겠다
// 일단, 1영역, 2영역 나누는 기준은 문제에 나와있다. 계속 그림 보고 확인하려는 버릇 고치자
// 영역을 물리적으로 (코드적으로) 쪼개는 방법이 고민되었다
// 5영역을 기준으로 확인하는 방법을 진행해야하는데, 그리디로 풀어야 하나?
// 그렇다면 하나하나 확인하는 게 오래 걸리지 않나?
// DP와 같은 방식으로 무언가 걸러주어야 할 것 같은데, 어떻게 무엇을?
// 이라는 생각까지 도달하고 타인의 풀이를 보았다

// 타인의 풀이는,
// 1) x, y, d1, d2값에 따른 영역의 차이를 (결과값)을 배열에 담아 돌려주는 함수
// 2) 그 함수를 모든 x, y, d1, d2에 대하여 함수의 값 중 가장 차이가 적은 값을 결과 값으로 받는 반복문

let n = Int(readLine()!)!
var map = [[]] + (0..<n).map { _ in [0]+readLine()!.split { $0 == " " }.map { Int($0)! } }
var ans = Int.max

func divide(y: Int, x: Int, d1: Int, d2: Int) -> Int {
  var citizen = [Int](repeating: 0, count: 5)
  for r in 1...n {
    for c in 1...n {
      if y+x <= r+c, r+c <= y-x+2*d2 && x-y-2*d1 <= c-r, c-r <= x-y {
        citizen[4] += map[r][c]
      } else if 1 <= r, r < y+d1 && 1 <= c, c <= x {
        citizen[0] += map[r][c]
      } else if 1 <= r, r <= y+d2 && x < c, c <= n {
        citizen[1] += map[r][c]
      } else if y+d1 <= r, r <= n && 1 <= c, c < x-d1+d2 {
        citizen[2] += map[r][c]
      } else {
        citizen[3] += map[r][c]
      }
    }
  }
  return citizen.max()! - citizen.min()!
}

for y in 1..<n {
  for x in 1..<n {
    for d1 in 1..<n {
      for d2 in 1..<n {
        guard y+d1+d2<=n && 1<=x-d1 && x+d2<=n else { continue }
        ans = min(ans, divide(y: y, x: x, d1: d1, d2: d2))
      }
    }
  }
}
print(ans)


