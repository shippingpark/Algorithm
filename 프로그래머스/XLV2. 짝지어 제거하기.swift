//
//  XLV2. 짝지어 제거하기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/02/23.
//

import Foundation

// MARK: - 세 번째 수정 풀이 : 인덱스 (진행중)


//func solution(_ s:String) -> Int{
//    let sArray = s.map{$0}
//    var leftIndex:Int = 0
//    var rightIndex:Int = 1
//
//    var left: String = ""
//    var right: String = s
//
//    while rightIndex != s.count {
//        let pop = rightIndex
//        rightIndex += 1
//        if let last = left.last {
//            if last == pop {
//                left.removeLast()
//            } else {
//                left.append(pop)
//            }
//        } else {
//            left.append(pop)
//        }
//    }
//    return left.isEmpty ? 1 : 0
//}
//
//print(solution("qaabaabqss"))




// MARK: - 두 번째 수정 풀이 (시간초과)

//func solution(_ s:String) -> Int{
//    var left: String = ""
//    var right: String = s
//
//    while right.isEmpty == false {
//        let pop = right.removeFirst()
//        if let last = left.last {
//            if last == pop {
//                left.removeLast()
//            } else {
//                left.append(pop)
//            }
//        } else {
//            left.append(pop)
//        }
//    }
//    return left.isEmpty ? 1 : 0
//}


// MARK: - 첫 번째 수정 풀이 : 인덱스로만 풀기 (시간초과)
//func solution(_ s:String) -> Int{
//    let s:[Character] = s.map{$0}
//    let sCount:Int = s.count
//    var sIndex = Array(s.indices)
//    var checkIndex:[Int] = Array(repeating: -1, count: sCount)
//    var leftIndex:Int = 0
//    var answer:Int = 1
//
//    while checkIndex != sIndex {
//        guard let rightIndex = checkIndex[(leftIndex+1)...].firstIndex(of: -1) else {answer = 0; break}
//        if s[leftIndex] == s[rightIndex] {
//            checkIndex[leftIndex] = leftIndex
//            checkIndex[rightIndex] = rightIndex
//            if let renewLeftindex = checkIndex.firstIndex(of: -1) {
//                leftIndex = renewLeftindex
//            }
//        } else {
//            leftIndex = rightIndex
//        }
//    }
//    return answer
//}

// MARK: - 첫 풀이 (시간초과)


//func solution(_ s:String) -> Int{
//    var answer:Int = 1
//    var s = s.map{$0}
//
//
//    var currentIndex = 0
//
//
//    while s.count != 0 {
//        guard currentIndex != s.count - 1 else {answer = 0; break}
//
//        if s[currentIndex] == s[currentIndex+1] {
//            s.removeSubrange(currentIndex...currentIndex+1)
//            currentIndex = 0
//        } else {
//            currentIndex += 1
//        }
//
//    }
//
//    return answer
//}

