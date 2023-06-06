//
//  스택.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/06.
//

let inputRepeat: Int = Int(readLine()!)!
var stack: [String] = []

for _ in 1...inputRepeat {
    let input: [String] = readLine()!.split(separator: " ").map { String($0) }
    
    switch input[0] {
    case "push": stack.append(input[1])
    case "pop":
        if let last = stack.popLast() {
            print(last)
        } else {
            print("-1")
        }
    case "size": print(stack.count)
    case "empty": print(stack.isEmpty ? 1 : 0)
    case "top":
        if let last = stack.last {
            print(last)
        } else {
            print("-1")
        }
    default: continue
    }
}

