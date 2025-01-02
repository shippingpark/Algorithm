//
//  팬덤이 넘쳐흘러.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/19.
//

import Foundation

let n:Int = Int(readLine()!)!
var (startP, lastP) = (Int.min, Int.max)

for _ in 0..<n {
    let input: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }
  startP = max(startP, input[0])
  lastP = min(lastP, input[1])
}

//print(startP-lastP>0 ? lastP-startP : 0)
