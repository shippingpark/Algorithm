//
//  LV2. 뒤에 있는 큰 수 찾기 .swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/17.
//

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var numbers:[Int] = numbers
    var stack:[Int] = []
    var result:[Int] = []
    
nextNum: while !numbers.isEmpty {
        let num = numbers.popLast()!
        
        while !stack.isEmpty {
            if num < stack.last! {
                result.append(stack.last!)
                stack.append(num)
                continue nextNum
            }
            else {
                stack.removeLast()
            }
        }
        
        result.append(-1)
        stack.append(num)
    }
    
    return result.reversed()
}

//print(solution([2, 3, 3, 5]))

//print(solution([9, 1, 5, 3, 6, 2])) //[-1, 5, 6, 6, -1, -1]

// MARK: - 개선풀이

func solution(_ numbers:[Int]) -> [Int] {
    var stack = [Int]()
    var result = Array(repeating: 0, count: numbers.count)
    
    for i in (0..<numbers.count).reversed() {
        while !stack.isEmpty && stack.last! <= numbers[i] {stack.removeLast()}
        stack.isEmpty ? (result[i] = -1) : (result[i] = stack.last!)
        stack.append(numbers[i])
    }
    
    return result
    
}
