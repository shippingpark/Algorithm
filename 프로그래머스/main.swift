//
//  File2.swift
//  Algorithm
//
//  Lv1. 예산
//

import Foundation

// MARK: - sorted() 안 쓰고 풀기

func solution(_ d:[Int], _ budget:Int) -> Int {
    var nowBuget = budget //잔여예산
    var nowd = d //남은 배열
    var count = Int() //처리 부서 수
    
    while nowBuget >= 0 {
        guard nowd.count != 0 else { return count }
        let minMoney = nowd.min()!
        let indexOfMin = nowd.firstIndex(of: minMoney)!
        print(nowd)
        print(minMoney)
        nowBuget -= minMoney
        nowd.remove(at: indexOfMin)
        count += 1
    }
    return count - 1
}

//print(solution([1,3,2,5,4], 9))
print(solution([2,2,3,3], 10))

//print(zip([1,3], [2,2]).map{ * }.reduce(0, +))
