//
//  LV2. 타겟넘버.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/19.
//

import Foundation

//조합 가능한 경우의 수 2^(numbers.count)
// MARK: - DFS : 성공

func solution(_ numbers: [Int], _ target: Int) -> Int {
    return dfs(numbers, target, value: 0, depth: 0)
}

func dfs(_ numbers: [Int], _ target: Int, value: Int, depth: Int) -> Int {
    if depth == numbers.count {
        return value == target ? 1 : 0
    }
    
    let plus = dfs(numbers, target, value: value + numbers[depth], depth: depth + 1)
    let minus = dfs(numbers, target, value: value - numbers[depth], depth: depth + 1)
    
    return plus + minus
}


// MARK: - BFS : 효율성 테스트 실패

//func solution(_ numbers: [Int], _ target: Int) -> Int {
//    var count = 0
//    var queue = [(value: 0, depth: 0)]
//
//    while !queue.isEmpty {
//        print(queue)
//        let current = queue.removeFirst()
//        let value = current.value
//        let depth = current.depth
//
//        if depth == numbers.count {
//            if value == target {
//                count += 1
//            }
//        } else {
//            queue.append((value: value + numbers[depth], depth: depth + 1))
//            queue.append((value: value - numbers[depth], depth: depth + 1))
//        }
//    }
//
//    return count
//}

