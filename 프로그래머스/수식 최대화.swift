//
//  수식 최대화.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/29.
//

import Foundation

func solution(_ expression:String) -> Int64 {
    var word:String = ""
    var array:[String] = []
    for char in expression {
        if char.isNumber {
            word.append(String(char))
        } else {
            array.append(word)
            array.append(String(char))
            word = ""
        }
    }
    array.append(word)
    
    var result = 0
    let visited = [false, false, false]
    func back(array: [String], visited: [Bool]) {
        print(array)
        guard array.count > 1 else {
            result = max(result, Int(abs(Double(Int(array.last!)!))))
            return
        }
        
        for i in 0..<3 {
            if !visited[i] {
                var visit = visited
                visit[i] = true
                back(array: doPlus(array: array), visited: visit)
            }
        }
            if !visited[0] {
                var visit = visited
                visit[0] = true
                back(array: doPlus(array: array), visited: visit)
            }
            if !visited[1] {
                var visit = visited
                visit[1] = true
                back(array: doMinuse(array: array), visited: visit)
            }
            if !visited[2] {
                var visit = visited
                visit[2] = true
                back(array: doMulti(array: array), visited: visit)
            }
    }
    
    back(array: array, visited: visited)
    
    return Int64(result)
}

func doPlus(array: [String]) -> [String] {
    var resultArray: [String] = [array.first!]
    for i in stride(from: 1, through: array.count-1, by: 2) {
        if array[i] == "+" {
            let operand = Int(resultArray.last!)! + Int(array[i+1])!
            resultArray[resultArray.count - 1] = String(operand)
        } else {
            resultArray.append(array[i])
            resultArray.append(array[i+1])
        }
    }
    return resultArray
}

func doMinuse(array: [String]) -> [String] {
    var resultArray: [String] = [array.first!]
    for i in stride(from: 1, through: array.count-1, by: 2) {
        if array[i] == "-" {
            let operand = Int(resultArray.last!)! - Int(array[i+1])!
            resultArray[resultArray.count - 1] = String(operand)
        } else {
            resultArray.append(array[i])
            resultArray.append(array[i+1])
        }
    }
    return resultArray
}

func doMulti(array: [String]) -> [String] {
    var resultArray: [String] = [array.first!]
    for i in stride(from: 1, through: array.count-1, by: 2) {
        if array[i] == "*" {
            let operand = Int(resultArray.last!)! * Int(array[i+1])!
            resultArray[resultArray.count - 1] = String(operand)
        } else {
            resultArray.append(array[i])
            resultArray.append(array[i+1])
        }
    }
    return resultArray
}
