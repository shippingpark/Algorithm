//
//  요격 시스템.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/07/10.
//

import Foundation

func solution(_ targets:[[Int]]) -> Int {
    var targets = targets.sorted{
        return $0[1] > $1[1] //끝점을 기준으로 정렬
    }
    
    var (start, finish) = (Int.min, Int.max)
    var result = 1
    
    for target in targets {
        start = max(start, target[0])
        finish = min(finish, target[1])
        
        if finish - start <= 0 {
            result += 1
            (start, finish) = (target[0], target[1])
        }
    }
    
    return result
}
