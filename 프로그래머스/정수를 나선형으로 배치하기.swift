//
//  정수를 나선형으로 배치하기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/08.
//

// MARK: - 초기 풀이

func solution(_ n:Int) -> [[Int]] {
    guard n != 1 else {return [[1]]}
    
    let direction = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var visited:[[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
    visited[0][0] = true
    var result: [[Int]] = Array(repeating: Array(repeating: 1, count: n), count: n)
    
    var ndirection = 0
    var checkCount = 1
    var r = 0
    var c = 0
    
    while checkCount != (n*n) {
        let nowDirction = direction[ ndirection%4 ]
        let nr = r + nowDirction.0
        let nc = c + nowDirction.1
        
        guard nr >= 0 && nr < n && nc >= 0 && nc < n else {
            ndirection += 1
            continue
        }
        
        guard !visited[nr][nc] else {
            ndirection += 1
            continue
        }
        
        result[nr][nc] += result[r][c]
        visited[nr][nc] = true
        checkCount += 1
        r = nr
        c = nc
    }
    
    return result
}

// MARK: - 개선 풀이


func solution(_ n:Int) -> [[Int]] {
    guard n != 1 else {return [[1]]}
    
    var checkCount = 1
    var ndirection = 0
    let direction = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    var (r, c) = (0, 0)
    result[0][0] = 1

    
    while checkCount != (n*n) {
        let nowDirction = direction[ ndirection%4 ]
        let nr = r + nowDirction.0
        let nc = c + nowDirction.1
        
        guard nr >= 0 && nr < n && nc >= 0 && nc < n else {
            ndirection += 1
            continue
        }
        
        guard result[nr][nc] == 0 else {
            ndirection += 1
            continue
        }
        
        result[nr][nc] = result[r][c] + 1
        // /visited[nr][nc] = true
        checkCount += 1
        r = nr
        c = nc
    }
    
    return result
}



