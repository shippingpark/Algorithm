//
//  LV2. 귤 고르기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/03/13.
//

import Foundation

// MARK: - 개선된 풀이

func solution(_ k: Int, _ tangerine: [Int]) -> Int {
    //Dictionary(grouping: tangerine) { $0 } //[4: [4], 1: [1], 3: [3, 3], 2: [2, 2], 5: [5, 5]]
    return Dictionary(grouping: tangerine) { $0 }.values
        .sorted { $0.count > $1.count }
        .reduce((0, 0)) { acc, array in acc.1 >= k ? acc : (acc.0 + 1, acc.1 + array.count) }
        .0
}


// MARK: - 첫 풀이

//func solution(_ k:Int, _ tangerine:[Int]) -> Int {
//    var dict:[Int:Int] = [:]
//    var count = k
//    var result = 0
//
//    for tan in tangerine  {
//        dict[tan] = (dict[tan] ?? 0) + 1
//    }
//
//    for (_, tanCount) in dict.sorted(by: { $0.value > $1.value }) {
//        guard count > 0 else {break}
//        count -= tanCount
//        result += 1
//    }
//
//    return result
//}

print(solution(6, [1, 3, 2, 5, 4, 5, 2, 3]))
