//
//  LV2.[1차] 프렌즈4블록 도움말.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/12.
//

import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int { //(i, j)
    
    
    func canClearArea2X2(position:(Int, Int)) -> Bool {
        let main = afterBoard[position.0][position.1]

        return afterBoard[position.0 + 1][position.1] == main && afterBoard[position.0][position.1 + 1] == main && afterBoard[position.0 + 1][position.1 + 1] == main
    }
    
    func checkpointToEmptyArea() {
        for j in 0..<(m-1) {
            for i in 0..<(n-1) {
                if afterBoard[j][i] == "1" {
                    afterBoard[j][i] = ""
                    afterBoard[j+1][i] = afterBoard[j+1][i] != "1" ? "" : "1"
                    afterBoard[j][i+1] = afterBoard[j][i+1] != "1" ? "" : "1"
                    afterBoard[j+1][i+1] = afterBoard[j+1][i+1] != "1" ? "" : "1"
                }
            }
        }
    }
    
    func dropBlockToEmptyArea() {
        for j in (1..<(m)).reversed() {
            for i in 0..<n {
                if afterBoard[j][i] == "" { //내가 비었다면
                    for jj in (1...j).reversed() {
                        afterBoard[jj][i] = afterBoard[jj-1][i]
                        afterBoard[jj-1][i] = ""
                    }
                }
            }
        }
    }

    func returnEmptyCount() -> Int {
        var count = 0
        
        for j in 0..<m {
            for i in 0..<n {
                if afterBoard[j][i] == "" {
                    count += 1
                }
            }
        }
        return count
    }
    
    var afterBoard:[[String]] = board.map{$0.map{String($0)}}
    var beforeBoard:[[String]] = []
    
    while afterBoard != beforeBoard {
        beforeBoard = afterBoard
        
        for j in 0..<(m-1) {
            for i in 0..<(n-1) {
                if canClearArea2X2(position: (j, i)) {
                    afterBoard[j][i] = "1"
                }
            }
        }

        checkpointToEmptyArea()
        dropBlockToEmptyArea()
    }
    
    return returnEmptyCount()
}


//print(solution(10, 10, ["DDABBAABBA",
//                      "AAAAAABBBA",
//                      "DDACCBBBAA",
//                      "DDABBBBBAA",
//                      "AAABBABBBA",
//                      "CCADDAABBB",
//                      "CCADDAABBB",
//                      "BBACCABBBA",
//                      "BBAAABBBAA",
//                      "DDABBBBAAA"]))
