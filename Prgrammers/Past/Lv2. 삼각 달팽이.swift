//
//  Lv2. 삼각 달팽이.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/02.
//

import Foundation

func solution(_ n:Int) -> [Int] {
    var triangle = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var currentRow = 0
    var currentCol = 0
    var currentNum = 1
    var direction = 0 // 0: down, 1: right, 2: up
    
    while currentNum <= (n * (n + 1)) / 2 {
        triangle[currentRow][currentCol] = currentNum
        
        //그 다음 요소의 위치 좌표 결정
        if direction == 0 { //아래로 이동 하려 함
            if currentRow + 1 < n && triangle[currentRow + 1][currentCol] == 0 {
                currentRow += 1
            } else {
                direction = 1
                currentCol += 1
            }
        } else if direction == 1 { //우로 이동 하려 함
            if currentCol + 1 < n && triangle[currentRow][currentCol + 1] == 0 {
                currentCol += 1
            } else {
                direction = 2
                currentRow -= 1
                currentCol -= 1
            }
        } else { //좌, 상으로 이동 하려 함
            if currentRow - 1 >= 0 && triangle[currentRow - 1][currentCol - 1] == 0 {
                currentRow -= 1
                currentCol -= 1
            } else {
                direction = 0
                currentRow += 1
            }
        }
        //그 다음 요소
        currentNum += 1
    }
    
    //triangle [[1, 0, 0, 0, 0], [2, 12, 0, 0, 0], [3, 13, 11, 0, 0], [4, 14, 15, 10, 0], [5, 6, 7, 8, 9]]
    
    var result = [Int]()
    for row in triangle {
        for num in row {
            if num > 0 {
                result.append(num)
            }
        }
    }
    
    return result
}


 
print(solution(5))
//가장 좌측 인덱스 번호
//0 + 1
//1 + 2
//3 + 3
//6 + 4
//10 + 5
//15
