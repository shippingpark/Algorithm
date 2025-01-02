//
//  기상캐스터.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/07/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (r, c) = (input[0], input[1])

for _ in 0..<r {
  let line = readLine()!.map{ String($0) }
  
  var result = line.map {
    return $0 == "c" ? 0 : -1
  }

    var cloudP = -1
    
    for i in 0..<c {
        if result[i] == 0 {
            cloudP = i
            continue
        }
        guard cloudP != -1 else { continue }
        result[i] = i - cloudP
    }
  print(result.map{ String($0) }.joined(separator: " "))
}
