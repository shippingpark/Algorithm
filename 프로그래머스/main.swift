//
//  222.swift
//  Algorithm
//
//  LV1. 소수 만들기
//

import Foundation

//(1) 0의 개수가 2개 이상 존재할 때, 1의 개수가 곧 소수의 개수 //짝 + 짝 + 홀
//(2) 1의 개수 중 3개를 뽑을 경우의 수 //홀 + 홀 + 홀
//
//enum HolJJack {
//    case hol
//    case jjack
//}
//
//func solution(_ nums:[Int]) -> Int {
//    var numsHolJJack:[Int: HolJJack] = [:]
//
//    var primeNum = (2...nums.max()!).filter{
//        var count == 0
//        for i in 2...nums.max()! {
//            if 2 count
//            count += 1
//        }
//    }
//
//    nums.forEach { num in
//        if num % 2 == 0 {
//            numsHolJJack[num] = .jjack
//        }
//        else {
//            numsHolJJack[num] = .hol
//        }
//    }
//
//    print(numsHolJJack)
//
//    for i in
//
//
//    let numsPercent2 = nums.map{ $0 % 4 } // [1,2,3,0]
//    print(numsPercent2)
//    let zeroCount = numsPercent2.filter{ $0 == 0 }.count //3
//    let oneCount = numsPercent2.filter{ $0 == 1 }.count //2
//    var result = 0
//
//    if zeroCount >= 2 {
//        var cal = 1
//        for i in 2...oneCount {
//            guard i != 2 else {continue}
//            cal = cal * i
//        }
//        result += cal * oneCount
//    }
//
//    //oneCount C 3 <-- 1 중에서 3 개 뽑을 경우의 수
//    if oneCount >= 3 {
//        var cal = 1
//        for i in 3...oneCount {
//            guard i != 3 else {continue}
//            cal = cal * i
//        }
//        result += cal
//    }
//
//    return result
//}

print(solution([1,2,3,4])) //1
print(solution([1,2,7,6,4])) //4
