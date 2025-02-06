//
//  택배 배달과 수거하기.swift
//  Prgrammers
//
//  Created by 박혜운 on 1/22/25.
//

import Foundation

func solution(_ cap: Int, _ n: Int, _ deliveries: [Int], _ pickups: [Int]) -> Int64 {
  var totalDistance: Int64 = 0
  
  var truckDeliveries = 0
  var truchPickups = 0
  
  for i in stride(from: n - 1, through: 0, by: -1) {
    truckDeliveries += deliveries[i]
    truchPickups += pickups[i]
    
    while truckDeliveries > 0 || truchPickups > 0 {
      // 트럭에 처리할 물량을 감축
      truckDeliveries -=  cap
      truchPickups -= cap
      
      // 왕복 거리 계산
      totalDistance += Int64((i + 1) * 2)
    }
  }
  
  return totalDistance
}
