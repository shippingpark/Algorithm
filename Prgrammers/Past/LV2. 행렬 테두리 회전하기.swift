//
//  LV2. 행렬 테두리 회전하기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/22.
//

import Foundation

// MARK: - stricd 풀이


func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    
    var original: [[Int]] = { //기준 지도
        var array:[[Int]] = []
        var start = 1
        for i in 0..<rows {
            let line = Array(start..<(start+columns))
            array.append(line)
            start += columns
        }
        return array
    }()
    
    var result: [Int] = []
    
    func rotate(map: [[Int]], point1: (r:Int, c:Int), point2: (r:Int, c:Int)) -> [[Int]] { //결과값 처리
        var minN = Int.max
        var rotateMap = map
        for c in stride(from: point2.c, through: point1.c + 1, by:-1) {
            rotateMap[point1.r][c] = map[point1.r][c-1]
            minN = min(minN, map[point1.r][c-1])
        }
        
        for r in stride(from: point2.r, through: point1.r + 1, by:-1) {
            rotateMap[r][point2.c] = map[r-1][point2.c]
            minN = min(minN, map[r-1][point2.c])
        }
        
        for c in stride(from: point1.c, through: point2.c - 1, by:1) {
            rotateMap[point2.r][c] = map[point2.r][c+1]
            minN = min(minN, map[point2.r][c+1])
        }
        
        for r in stride(from: point1.r, through: point2.r - 1, by:1) {
            rotateMap[r][point1.c] = map[r+1][point1.c]
            minN = min(minN, map[r+1][point1.c])
        }
        result.append(minN)
        return rotateMap
    }
    
    
    for querie in queries {
        original = rotate(map: original, point1: (querie[0]-1, querie[1]-1), point2: (querie[2]-1, querie[3]-1))
    }

    return result
    
}


// MARK: - 범위 연산 풀이

import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    
    var original: [[Int]] = { //기준 지도
        var array:[[Int]] = []
        var start = 1
        for i in 0..<rows {
            let line = Array(start..<(start+columns))
            array.append(line)
            start += columns
        }
        return array
    }()
    
    var result: [Int] = []
    
    func rotate(map: [[Int]], point1: (r:Int, c:Int), point2: (r:Int, c:Int)) -> [[Int]] { //결과값 처리
        var minN = Int.max
        var rotateMap = map

        for c in (point1.c+1...point2.c).reversed() {
            rotateMap[point1.r][c] = map[point1.r][c-1]
            minN = min(minN, map[point1.r][c-1])
        }
        
        for r in (point1.r+1...point2.r).reversed() {
            rotateMap[r][point2.c] = map[r-1][point2.c]
            minN = min(minN, map[r-1][point2.c])
        }
        
        for c in (point1.c...point2.c-1) {
            rotateMap[point2.r][c] = map[point2.r][c+1]
            minN = min(minN, map[point2.r][c+1])
        }
        
        for r in (point1.r...point2.r-1) {
            rotateMap[r][point1.c] = map[r+1][point1.c]
            minN = min(minN, map[r+1][point1.c])
        }
        result.append(minN)
        return rotateMap
    }
    
    
    for querie in queries {
        original = rotate(map: original, point1: (querie[0]-1, querie[1]-1), point2: (querie[2]-1, querie[3]-1))
    }

    return result
    
}

