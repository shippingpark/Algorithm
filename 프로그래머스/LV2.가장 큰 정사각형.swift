//
//  LV2.가장 큰 정사각형.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/09.
//

//import Foundation
//
//func solution(_ board: [[Int]]) -> Int {
//    var answer = 0
//    var board = board
//    let N = board.count
//    let M = board[0].count
//
//    for i in 0..<N {
//        for j in 0..<M {
//            if i > 0 && j > 0 && board[i][j] == 1 {
//                board[i][j] += min(board[i-1][j-1], min(board[i-1][j], board[i][j-1]))
//            }
//            answer = max(answer, board[i][j])
//        }
//    }
//
//    return answer * answer
//}
//
//
//
//print(solution([[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]])) //9
//print(solution([[0,0,1,1],[1,1,1,1]]))//4
