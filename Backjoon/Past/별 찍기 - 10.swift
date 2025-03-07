//
//  별 찍기 - 10.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/11/28.
//

import Foundation

// MARK: - 1
// String 값으로 반환 받아서 block + block + block 하려 했으나 실패
// 2차원 형태의 String 값을 더하면 원하는 모양대로 붙지 않음
// 한 줄씩 붙여줘야 함을 인지하고 2차원 Array 형태로 반환 받아 map으로 한 줄 씩 더해주기로 생각
// " " 빈 blank 구간을 매번 직접 구하는 게 조금 찝찝함
// 하지만 한 함수 내에 서로 다른 목적으로 두 가지 재귀를 쓰면 경우가 너무 많이 분화되는 느낌을 받았음
// 더불어 " " 값은 block 형태가 아닌 line 형태로 결합하므로 더더욱
// 재귀함수의 시간 복잡도에 대한 이해는 한 번 호출에 3의 배수로 줄어듦으로
// O(N^2 * log₃N)

let N = Int(readLine()!)!

func block(N: Int) -> Array<Array<String>> {
  guard N != 1 else { return [["*"]] }

  let block: [[String]] = block(N: N/3)
  
  let line = block.map{ $0 + $0 + $0 }
  let mid = block.map{$0 + Array(repeating: " ", count: N/3) + $0}
  var result:[[String]] = []
  
  result.append(contentsOf: line)
  result.append(contentsOf: mid)
  result.append(contentsOf: line)
  return result
}
print(block(N: N).map{ $0.joined() }.joined(separator: "\n"))


// MARK: - 2

let N = Int(readLine()!)!

func drawStar(N: Int) -> [[String]] {
  guard N != 1 else { return [["*"]] }
  
  let block = drawStar(N: N/3)
  let topBottom = block.map{ $0 + $0 + $0 }
  let mid = block.map{ $0 + Array(repeating: " ", count: N/3) + $0 }
  var result: [[String]] = .init()
  result.append(contentsOf: topBottom)
  result.append(contentsOf: mid)
  result.append(contentsOf: topBottom)
  
  return result
}

print(drawStar(N: N).map{ $0.joined() }.joined(separator: "\n"))

// MARK: - 3

let n = Int(readLine()!)!

func madeStar(N: Int) -> [[String]] {
  guard N != 1 else { return [["*"]] }
  
  let block = madeStar(N: N/3)
  let line = block.map{ $0 + $0 + $0 }
  let mid = block.map{ $0 + Array(repeating: " ", count: N/3) + $0 }
  var result: [[String]] = .init()
  result.append(contentsOf: line)
  result.append(contentsOf: mid)
  result.append(contentsOf: line)
  
  return result
}

print(madeStar(N: n).map{ $0.joined() }.joined(separator: "\n"))


// MARK: - 4
// upDown 등등 용도 보다, line 이라는 정적인 명칭이 더 문제를 풀 때 헷갈리지 않았다 

let n = Int(readLine()!)!

func starBlock(lineStarCount: Int) ->[[String]] {
  guard lineStarCount != 1 else { return [["*"]] }
  
  let block = starBlock(lineStarCount: lineStarCount/3)
  let line = block.map{ $0 + $0 + $0 }
  let mid = block.map{ $0 + Array(repeating: " ", count: lineStarCount/3) + $0 }
  var result = [[String]]()
  result.append(contentsOf: line)
  result.append(contentsOf: mid)
  result.append(contentsOf: line)
  
  return result
}

print(starBlock(lineStarCount: n).map{ $0.joined(separator: "") }.joined(separator: "\n"))


// MARK: - 5
// 커다란 반복적인 패턴을 만들 때, 가로로 연장하고 싶으면 2차원 배열을 만든 뒤 각 1차원들을 이어나가는 방식으로 (더하는 )

func star(n: Int) -> [[String]] {
  if n == 1 {
    return [["*"]]
  }
  
  let block = star(n: n / 3)
  let line = block.map{ $0 + $0 + $0 }
  let mid = block.map{ $0 + Array(repeating: " ", count: n/3) + $0 }
  
  var result = line
  result.append(contentsOf: mid)
  result.append(contentsOf: line)
  
  return result
}

let n = Int(readLine()!)!
print(star(n: n).map{ $0.joined(separator: "") }.joined(separator: "\n") )


// MARK: - 6

let N = Int(readLine()!)!

func star(n: Int = N) -> [[String]] {
  if n == 1 {
    return [["*"]]
  }
  
  let block = star(n: n/3)
  let line = block.map{ $0 + $0 + $0 }
  let mid = block.map{ $0 + Array(repeating: " ", count: n/3) + $0 }
  var result = line
  result.append(contentsOf:mid)
  result.append(contentsOf:line)
  
  return result
}

print(star().map{ $0.joined() }.joined(separator: "\n"))

