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
