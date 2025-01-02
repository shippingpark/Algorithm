//
//  File.swift
//  Algorithm
//
//  LV1. 명예의 전당(1)
//

import Foundation

// MARK: - 같은 점수가 있으면, 사람 수를 세야 한다.


//func solution(_ k:Int, _ score:[Int]) -> [Int] {
//
//    var rankingK: [Int] = [score[0]]
//    var result = [score[0]]
//
//    for a in score[1...] {
//        print("rankingK: \(rankingK)")
//        print("result: \(result)")
//
//        guard rankingK.first! < a else {result.append(result.last!); continue}
//
//        guard !rankingK.contains(a) else {result.append(result.last!); continue} //같은 값 있을 때 처리
//
//        for (index, rank) in rankingK.enumerated() {
//
//            if rank > a {
//                rankingK.insert(a, at: index)
//                break
//            }
//        }
//
//        if rankingK.last! < a {
//            rankingK.append(a)
//        }
//
//        if a == 20 {
//            print("hear")
//        }
//        if rankingK.count > k {
//            print("count")
//            result.append(rankingK[rankingK.endIndex-k+1])
//        } else {
//            print("result.append(rankingK.first!)")
//            result.append(rankingK.first!)
//        }
//    }
//
//
//    return result
//}



// MARK: - 다시 풀이

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    
    return Array<Int>(0...score.count-1).map {
        let end:Int = $0 >= k ? $0-k+1 : 0
        return Array(score[0...$0].sorted())[end]
    }
}

// MARK: - 추가 풀이

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var stack:[Int] = [score.first!]
    var result:[Int] = [score.first!]
    
    for i in 1..<score.count {
        stack.append(score[i])
        stack.sort(by: >)
        
        if stack.count > k {
            stack.popLast()
        }
        
        result.append(stack.last!)
    }
    
    return result
}
