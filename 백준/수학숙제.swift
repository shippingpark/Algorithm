//
//  수학숙제.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/08/02.
//

import Foundation

let input = Int(readLine()!)!
var setNumber: [String] = []

for _ in 0..<input {
  let line = readLine()!.map{ Character(extendedGraphemeClusterLiteral: $0) }
  let nList =
    line
      .map { return $0.isLetter ? String("A") : String($0) }
      .joined()
      .split(separator: "A")
      .compactMap{
        if $0.count > 1 && $0.prefix(1) == "0" {
          var new = $0
          while new.first == "0" && new.count > 1 {
            new.removeFirst()
          }
          return String(new)
        } else {
         return String($0)
        }
      }
  setNumber.append(contentsOf: nList)
}

for i in setNumber.sorted(by: <) {
  print(i)
}
