//
//  쿼드트리.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/11/27.
//

import Foundation

// MARK: - 1
// range는 ClosedRange와 Range 갈린다. 그래서 이걸 파라미터로 특정 타입을 고정시켜버리면 다루기가 까다로워 진다
// [0..<0] 이라고 쓰면 인덱스 에러 발생한다. 반드시 시작점보다 끝점이 커야 한다.
// 파라미터 인덱스 값을 특정 값으로 받는 게 더 편했다. 헷갈리기도 하고. index라는 특성에 맞추어 해당 값이 반드시 사용되어야 하는 값이라고 인지할 수 있어 좋았다. 헷갈리기 때문에 명확하게 할 필요성에 대해 인지했다.
// 문제 푸는 데 엄청 오래 걸렸다.

// 재귀함수의 깊이에 대한 이해가 떨어진다. 2차시에 살펴보자.
// 시간복잡도가 O(4^(logN))라고 하는데, 여기서 logN이 깊이에 해당한다. (밑이 2)
// 아직은 이해가 안된다.

let N = Int(readLine()!)!
var board: [[String]] = .init()
(0..<N).forEach{ _ in board.append(readLine()!.map{ String($0) })}

func quadTree(rowStart: Int, rowFinish: Int, colStart: Int, colFinish: Int) -> String {
  guard rowStart + 1 != rowFinish || colStart + 1 != colFinish else { return board[rowStart][colStart] }

  let rowMid = (rowFinish - rowStart) / 2 + rowStart
  let colMid = (colFinish - colStart) / 2 + colStart
  var checkResult = ""
  
  for section in 0...3 { // 좌상, 우상, 좌하, 우하
    switch section {
    case 0:
      checkResult += quadTree(rowStart: rowStart, rowFinish: rowMid, colStart: colStart, colFinish: colMid)
    case 1:
      checkResult += quadTree(rowStart: rowStart, rowFinish: rowMid, colStart: colMid, colFinish: colFinish)
    case 2:
      checkResult += quadTree(rowStart: rowMid, rowFinish: rowFinish, colStart: colStart, colFinish: colMid)
    case 3:
      checkResult += quadTree(rowStart: rowMid, rowFinish: rowFinish, colStart: colMid, colFinish: colFinish)
    default: continue
    }
  }
  
  if !checkResult.contains("0") || !checkResult.contains("1") {
    return String(checkResult.first!)
  } else {
    return "(" + checkResult + ")"
  }
}

print(quadTree(rowStart: 0, rowFinish: N, colStart: 0, colFinish: N))


// MARK: - 2

let N = Int(readLine()!)!
let block: [[String]] = (0..<N).map{ _ in readLine()!.map{ String($0) } }

func quadTree2(rowRange: ClosedRange<Int>, colRange: ClosedRange<Int>) -> String {
  let rowStart = rowRange.lowerBound
  let rowFinish = rowRange.upperBound
  let colStart = colRange.lowerBound
  let colFinish = colRange.upperBound
  let rowMidLeft = (rowFinish - rowStart) / 2 + rowStart
  let colMidLeft = (colFinish - colStart) / 2 + colStart
  
  guard rowStart != rowFinish || colStart != colFinish else { return block[rowStart][colStart] }
  
  let rowUp = rowStart...rowMidLeft
  let rowDown = (rowMidLeft+1)...rowFinish
  let colLeft = colStart...colMidLeft
  let colRight = (colMidLeft+1)...colFinish
  
  var line = ""
  
  for section in 0..<4 {
    switch section {
    case 0: line += quadTree2(rowRange: rowUp, colRange: colLeft)
    case 1: line += quadTree2(rowRange: rowUp, colRange: colRight)
    case 2: line += quadTree2(rowRange: rowDown, colRange: colLeft)
    case 3: line += quadTree2(rowRange: rowDown, colRange: colRight)
    default: break
    }
  }
  if !line.contains("0") || !line.contains("1") {
    return String(line.first!)
  } else {
    return "(" + line + ")"
  }
}

print(quadTree2(rowRange: 0...(N-1), colRange: 0...(N-1)))


// MARK: - 3

let N = Int(readLine()!)!

let map = (0..<N).map{ readLine()!.split(separator: " ") }

func quadTree3(rowRange: ClosedRange, colRange: ClosedRange) -> String {
  guard (rowRange.lowerBound != rowRange.upperBound)
          || (colRange.lowerBound != colRange.upperBound) else { return map[rowRange.lowerBound][colRange.lowerBound] }
  let rowMidLeft = (rowRange.upperBound - rowRange.lowerBound) / 2 + rowRange.lowerBound
  let colMidUp = (colRange.upperBound - colRange.lowerBound) / 2 + colRange.lowerBound
  
  let upLeft = quadTree3(rowRange: rowRange.lowerBound...rowMidLeft, colRange: colRange.lowerBound...colMidUp)
  let upRight = quadTree3(rowRange: rowRange.lowerBound...rowMidLeft, colRange: (colMidUp+1)...colRange.upperBound)
  let downLeft = quadTree3(rowRange: (rowMidLeft+1)...rowRange.upperBound, colRange: colRange.lowerBound...colMidUp)
  let downRight = quadTree3(rowRange: (rowMidLeft+1)...rowRange.upperBound, colRange: (colMidUp+1)...colRange.upperBound))
  
  let result = upLeft + upRight + downLeft + downRight
  
  if !result.contains("1") || !result.contains("0") {
    return upLeft
  } else {
    return "(" + result + ")"
  }
}




// MARK: - 3
// split 썼더니 안됌... 바로 map 때려야 했음. 아마 분리하는 "" 를 쓸 수 없으니 그랬던 듯 

let N = Int(readLine()!)!
var board: [[String]] = .init()
(0..<N).forEach{ _ in board.append(readLine()!.map{ String($0) })}

func quadTree3(rowRange: ClosedRange<Int>, colRange: ClosedRange<Int>) -> String {
  guard (rowRange.lowerBound != rowRange.upperBound)
          || (colRange.lowerBound != colRange.upperBound) else { return board[rowRange.lowerBound][colRange.lowerBound] }
  let rowMidLeft = (rowRange.upperBound - rowRange.lowerBound) / 2 + rowRange.lowerBound
  let colMidUp = (colRange.upperBound - colRange.lowerBound) / 2 + colRange.lowerBound
  
  let upLeft = quadTree3(rowRange: rowRange.lowerBound...rowMidLeft, colRange: colRange.lowerBound...colMidUp)
  let upRight = quadTree3(rowRange: rowRange.lowerBound...rowMidLeft, colRange: (colMidUp+1)...colRange.upperBound)
  let downLeft = quadTree3(rowRange: (rowMidLeft+1)...rowRange.upperBound, colRange: colRange.lowerBound...colMidUp)
  let downRight = quadTree3(rowRange: (rowMidLeft+1)...rowRange.upperBound, colRange: (colMidUp+1)...colRange.upperBound)
  
  let result = upLeft + upRight + downLeft + downRight
  
  if !result.contains("1") || !result.contains("0") {
    return upLeft
  } else {
    return "(" + result + ")"
  }
}

print(quadTree3(rowRange: 0...(N-1), colRange: 0...(N-1)))

// MARK: - 4
// split의 separator 가 ""일 경우 안 잘림. 이럴 땐 map 으로 쪼개기
let n = Int(readLine()!)!
let map = (0..<n).map{ _ in readLine()!.map{ $0 } }

func dfs(colRange: ClosedRange<Int>, rowRange: ClosedRange<Int>) -> String {
  if (colRange.lowerBound == colRange.upperBound) || (rowRange.lowerBound == rowRange.upperBound) {
    return String(map[colRange.lowerBound][rowRange.lowerBound])
  }
  
  let colMidLeft = (colRange.upperBound - colRange.lowerBound) / 2 + colRange.lowerBound
  let rowMidLeft = (rowRange.upperBound - rowRange.lowerBound) / 2 + rowRange.lowerBound
  
  let upLeft = dfs(colRange: colRange.lowerBound...colMidLeft, rowRange: rowRange.lowerBound...rowMidLeft)
  let upRight = dfs(colRange: colRange.lowerBound...colMidLeft, rowRange: (rowMidLeft+1)...rowRange.upperBound)
  let downLeft = dfs(colRange: (colMidLeft+1)...colRange.upperBound, rowRange: rowRange.lowerBound...rowMidLeft)
  let downRight = dfs(colRange: (colMidLeft+1)...colRange.upperBound, rowRange: (rowMidLeft+1)...rowRange.upperBound)
  
  let result = upLeft + upRight + downLeft + downRight
  
  if !result.contains("0") || !result.contains("1") {
    return upLeft
  } else {
    return "(" + result + ")"
  }
}

print(dfs(colRange: 0...(n-1), rowRange: 0...(n-1)))
