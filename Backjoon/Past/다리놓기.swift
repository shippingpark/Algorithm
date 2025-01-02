//
//  다리놓기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/08/14.
//

import Foundation

let N = Int(readLine()!)!
let bridgeCase = (0..<N).map{ _ in  readLine()!.split(separator: " ").compactMap{ Int($0) } }

for bridge in bridgeCase {
  let n = bridge[1]
  let r = min(bridge[0], bridge[1] - bridge[0])
  var result = 1
  for i in 0..<r {
    result = result * (n - i) / (i + 1)
  }
  print(result)
}

