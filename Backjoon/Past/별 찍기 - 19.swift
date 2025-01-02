//
//  별 찍기 - 19.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/16.
//

import Foundation

func solution() {
    guard let N = Int(readLine()!) else {return}
    let middleCIndex = 홀수(N: N)-1
    let middleRIndex = 홀수(N: N)-1

    var array = Array(repeating: Array(repeating: " ", count: 홀수(N: N)*2 - 1), count : 홀수(N: N)*2 - 1)

    for n in 1...N {
        let firstRIndex = middleRIndex - 2*(n-1)
        let lastRIndex = middleRIndex + 2*(n-1)
        let firstCIndex = middleCIndex - 2*(n-1)
        let lastCIndex = middleCIndex + 2*(n-1)
        
        //위 아래 가득 찬 바닥
        array[firstRIndex].replaceSubrange(firstCIndex...lastCIndex, with: Array(repeating: "*", count: lastCIndex-firstCIndex+1))
        array[lastRIndex].replaceSubrange(firstCIndex...lastCIndex, with: Array(repeating: "*", count: lastCIndex-firstCIndex+1))
        
        //옆 기둥
        for r in firstRIndex...lastRIndex{
            array[r][firstCIndex] = "*"
            array[r][lastCIndex] = "*"
        }
    }

    for line in array {
        print(line.joined())
    }
}

func 홀수(N:Int) -> Int {
    return N * 2 - 1
}

solution()
