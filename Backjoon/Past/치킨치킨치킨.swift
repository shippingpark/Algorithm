//
//  치킨치킨치킨.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/09/05.
//

let input = readLine()!.split(separator: " ").map{ Int($0)! },
N = input[0], M = input[1]

let personFavorit: [[Int]] = (0..<N).map{ _ in readLine()!.split(separator: " ").map{ Int($0)!} }
var result: Int = Int.min


func combinationfunc (count: Int = 0, start: Int = 0, combination: [Int] = []) {
  
  guard start <= M else { return }
  if count == 3 {
    let sum = personFavorit.map { row in
      combination.map { row[$0] }.max()!
    }.reduce(0, +)
    result = max(result, sum)
    return
  }
  
  for i in start..<M {
    combinationfunc(count: count + 1, start: i + 1, combination: combination + [i])
  }
}

combinationfunc()
print(result)
