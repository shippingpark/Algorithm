//
//  LV2. 괄호 변환.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/23.
//

import Foundation

func solution(_ p:String) -> String {
    guard !p.isEmpty else { return "" }
    var result = ""
    
    func openCloseMaker(w: String) -> String {
        guard !w.isEmpty else { return "" }
        var u:String = ""
        var v:String = ""

        for i in 0..<w.count {
            let startIndex = w.startIndex
            let index = w.index(w.startIndex, offsetBy: i)
            let vindex = w.index(index, offsetBy: 1)
            let string = w[startIndex...index]
            let leftCount = string.filter{ $0 == "(" }.count
            let rightCount = string.filter{ $0 == ")" }.count
            if leftCount == rightCount {
                u = String(string)
                v = String(w[vindex..<w.endIndex])
                break
            }
        }

        if checkProper(u: u) {
            return u + openCloseMaker(w: v)
        } else {
            var temp = "("
            temp += openCloseMaker(w: v)
            temp += ")"
            u.removeFirst()
            u.removeLast()
            u = u.map { $0 == ")" ? "(" : ")"}.joined()
            temp += u
            return temp
        }
    }

    return openCloseMaker(w: p)
}

func checkProper(u: String) -> Bool {
    var stack: [Character] = []
    for char in u {
        if char == "(" {
            stack.append(char)
        } else {
            if stack.last == "(" {
                stack.removeLast()
            }
        }
    }
    return stack.isEmpty
}
