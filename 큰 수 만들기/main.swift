//
//  main.swift
//  큰 수 만들기
//
//  Created by 박혜운 on 2/25/25.
//

import Foundation
func solution_큰수만들기(_ number: String, _ k: Int) -> String {
    let array: [String] = number.map { String($0) }
    var k = k
    var result: [String] = []
    
    for i in array.indices {

        if k <= 0 {
            result += array[i...]
            break
        }
        
        if result.isEmpty {
            result.append(array[i])
        } else {
            if result.last! >= array[i] {
                result.append(array[i])
                continue
            }
            while let last = result.last, last < array[i], k > 0 {
                result.removeLast()
                k -= 1
            }
            result.append(array[i])
        }
    }

    return result.prefix(result.count-k).joined()
}

print(solution_큰수만들기("4177252841", 4))

// MARK: - DFS 풀이, number의 길이가 너무 길어 시간초과
//func solution_큰수만들기(_ number: String, _ k: Int) -> String {
//    let array: [String] = number.map { String($0) }
//    var result = 0
//    
//    var stack: [(Int, [Int])] = [(0, [])] // 시작Index, [모은 Index]
//    
//    while !stack.isEmpty {
//        let (startIndex, list) = stack.popLast()!
//
//        if list.count == k {
//            var array: [String] = array
//            list.forEach { array[$0] = "" }
//            result = max(result, Int(array.joined(separator: ""))!)
//            continue
//        }
//        
//        for i in startIndex..<array.count {
//            stack.append((i+1, list + [i]))
//        }
//    }
//
//    return String(result)
//}

