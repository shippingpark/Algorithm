//
//  main.swift
//  회의실배정
//
//  Created by 박혜운 on 2/7/25.
//

import Foundation

func soultion_회의실배정(_ N: Int, _ mettings: [[Int]]) -> Int {
  let mettings = mettings.sorted { $0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1] }
  var count = 0
  var currentTime = 0
  
  for metting in mettings {
    let (start, end) = (metting[0], metting[1])
    if currentTime <= start {
      count += 1
      currentTime = end
    }
  }
  return count
}

let N = Int(readLine()!)!
let meetings = (0..<N).map { _ in readLine()!.components(separatedBy: " ").map { Int($0)! } }

print(soultion_회의실배정(N, meetings))
