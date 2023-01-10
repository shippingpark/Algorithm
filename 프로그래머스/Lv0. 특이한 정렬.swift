//
//  File.swift
//  Algorithm
//
//  Lv0. 특이한 정렬

//

import Foundation


//func solution(_ numlist:[Int], _ n:Int) -> [Int] {
//    return numlist.map{$0-n}.sorted {
//        guard abs($0) != abs($1) else {return $0>=$1}
//        return abs($0) < abs($1)
//    }.map{$0+n}
//}

// MARK: - 더 나은 풀이 : 우선 순위에 따라 비교하는 법 - 튜플

func solution(_ numlist:[Int], _ n:Int) -> [Int] {
    return numlist.sorted(by: { (abs($0 - n), -$0) < (abs($1 - n), -$1) })
}


