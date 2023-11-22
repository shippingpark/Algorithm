//
//  자신감 점수.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/11/22.
//

import Foundation

// 1. 원형 배열이 직선 배열과 다른 점은 0번째와 N-1번째가 맞닿아 있다는 점이다
// 2. 최댓값, 또는 최솟값을 구하는 문제는 두 가지 방향으로 접근할 수 있다
//    - 최적 값을 구하는 알고리즘을 찾아 해결하는 / 모든 경우의 수를 다 구하여 최적 값을 찾는
// 위 문제는 시간 복잡도가 모든 point를 제외하는 경우 N과 원형 자존감 점수를 계산하는 경우 N으로 O(N^2)
// N의 최댓값이 1000이므로 10^6 백만은 1-10억 내로 시간 복잡도 상으로 문제가 없다
// 고로 전부 탐색하여 찾는 방법을 택한다

// N은 4 이상
func prideScore(N: Int, warriors: [Int]) {
  var result = Int.min
  for i in 0..<N {
    var warriors = warriors
    warriors.remove(at: i)
    let circle = warriors
    var prideCount = 0
    for middleIndex in circle.indices {
      var leftIndex = middleIndex == 0 ? N-2 : middleIndex - 1
      var rightIndex = middleIndex == (N-2) ? 0 : middleIndex + 1
      prideCount += (circle[middleIndex] > circle[leftIndex]) && (circle[middleIndex] > circle[rightIndex]) ? 1 : 0
    }
    result = max(result, prideCount)
  }
  print(result)
}

prideScore(N: 8, warriors: [7, 7, 5, 8, 9, 4, 6, 2]) // 3
prideScore(N: 10, warriors: [5, 3, 7, 5, 3, 3, 6, 1, 8, 7]) //3
prideScore(N: 12, warriors: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]) //1
