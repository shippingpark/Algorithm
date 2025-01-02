//
//  BinarySearch.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/13.
//

import Foundation

class ImmigrationCheck {
    private static let MAX = 1_000_000_000
    private static var time: [Int] = []
    private static var N: Int = 0

    func solution(_ n: Int, _ times: [Int]) -> Int64 { //BinarySearch
        ImmigrationCheck.N = n
        ImmigrationCheck.time = times

        var left: Int64 = 1
        var right: Int64 = Int64(MAX) * Int64(MAX)

        while left < right {
            let mid = (left + right) / 2
            if isPossible(target: mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }

        return left
    }

    private func isPossible(target: Int64) -> Bool {
        var n = Int64(ImmigrationCheck.N)

        for i in ImmigrationCheck.time {
            n -= target / Int64(i)
        }

        return n <= 0
    }
}
