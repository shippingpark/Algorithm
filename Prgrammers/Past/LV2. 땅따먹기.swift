//
//  LV2. 땅따먹기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/05.
//

import Foundation

func solution(_ land: [[Int]]) -> Int {
    var dp = land
    //지금 나의 위치까지 오기 위한 전 행의 최대 값을 저장한다
    for row in 1..<land.count { //행
        for col in 0..<4 { //현재 열
            var maxVal = 0 //현재 행의 현재 열까지 오기 위한 앞선 열의 최댓값

            for prevCol in 0..<4 { //앞선 열
                if col != prevCol { //앞선 열과 현재 열이 같으면 고려 X
                    maxVal = max(maxVal, dp[row - 1][prevCol]) //요소들의 크기가 비순차적일 수 있으므로 열 전체를 훑으며 최댓값(maxVal)을 갱신하는 형태
                }
            }

            dp[row][col] += maxVal //현재 행의 현재 열까지 오기 위한 앞선 행열의 최댓값을 자기 자신에 더함
        }
    }
    //dp //[[1, 2, 3, 5], [10, 11, 12, 11], [16, 15, 13, 13]]

    return dp.last!.max()! //마지막 행의 최댓값이 곧 이전 행으로부터 최댓값을 쌓아온 경로중 가장 큰 값
}


 
//func solution(_ land: [[Int]]) -> Int {
//    var dp = land
//
//    for row in 1..<dp.count {
//        for col in 0..<4 {
//            var maxValue = 0
//            for preCol in 0..<4 {
//                if col != preCol {
//                    maxValue = max(maxValue, dp[row-1][preCol])
//                }
//            }
//
//            dp[row][col] += maxValue
//        }
//    }
//    return dp.last!.max()!
//}
