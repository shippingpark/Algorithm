//
//  File.swift
//  Algorithm
//
//  LV1. 가장 가까운 같은 글자
//

import Foundation

func solution(_ s:String) -> [Int] {
    let sArr = s.map{String($0)}
    var sDic = [String:Int]()
    var result = [Int]()
    
    for (i, a) in sArr.enumerated() {
        guard sArr.firstIndex(of: a) != i else {
            sDic[a] = i
            result.append(-1);
            continue
        }
        result.append(i - sDic[a]!)
        sDic[a] = i
    }
    return result
}

print(solution("banana"))//[-1, -1, -1, 2, 2, 2]

// MARK: - 고차함수 풀이

func solution(_ s: String) -> [Int] {
    return s.enumerated().map { (i, c) in i - (Array(s)[0..<i].lastIndex(of: c) ?? i + 1) }
}


