//
//  LV2. 괄호 회전하기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/03/08.
//

import Foundation

func solution(_ s:String) -> Int{
    var result:Int = 0
    var s = s
    
    for _ in s.indices {
        let sFirst = s.removeFirst()
        s += String(sFirst)
        var stack = [Character]()
        
        for char in s {
            var match:Character {
                switch char{
                case ")": return "("
                case "]": return "["
                case "}": return "{"
                default: return "N"
                }
            }
            if match == (stack.last ?? " ") {
                stack.popLast()
            } else {
                stack.append(char)
            }
        }
        
        result += stack.isEmpty ? 1 : 0
    }
    return result
}
    
