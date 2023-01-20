//
//  File.swift
//  Algorithm
//
//  LV1.크레인 인형뽑기 게임
//

import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var gameBoard = board
    var dolls:[Int] = []
    var removeDoll = 0
    
    for move in moves {
        guard gameBoard.last![move - 1] != 0 else {continue}
        
        let innerIndex = move - 1
        
        let outIndex:Int = {
            for (index, layer) in gameBoard.enumerated() {
                guard layer[innerIndex] == 0 else {
                    return index
                }
            }
            return 0
        }()
        
        let doll = gameBoard[outIndex][innerIndex]
        gameBoard[outIndex][innerIndex] = 0
        
        if doll == dolls.first {
            removeDoll += 2
            dolls.removeFirst()
        } else {
            dolls.insert(doll, at: 0)
        }
    }
    return removeDoll
}

print(solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4])) //4

//print("뽑아간 인형 : \(doll)")
