//
//  개미 4307.swift
//  Algorithm
//
//  Created by 박혜운 on 12/18/23.
//

import Foundation

// MARK: - 1
// 부딪혀서 멀어지는 것에 대한 패널티나, 그룹의 분류를 알아야 할 필요가 없으므로
// 방향이 반대로 바뀌는 것은 고려하지 않아도 된다
// 시간복잡도는 상수 
let n = Int(readLine()!)!
for _ in 0..<n {
  let input = readLine()!.split(separator: " ").map{ Int($0)! },
      L = input[0], N = input[1]
  
  var speed = (0..<N).map{ _ in Int(readLine()!)! }
  var minT = speed.map{ min($0, abs(L-$0)) }
  var maxT = speed.map{ max($0, abs(L-$0)) }
  print("\(minT.max()!) \(maxT.max()!)")
}
