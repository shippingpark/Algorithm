//
//  File.swift
//  Algorithm
//
//  LV1. 신규 아이디 추천
//

import Foundation

func solution(_ new_id:String) -> String {
    var new_id_Array = new_id.map{$0}
    var result:[String] = []
    
    for id in new_id_Array {
        if id.isUppercase {
            result.append(id.lowercased())
            continue
        }
        
        if !(id.isLetter || id.isNumber || id == "-" || id == "_" || id == ".") {
            continue
        }
        
        if id == "." {
            guard result.last != "." else {continue}
            result.append(".")
            continue
        }
        
        else {
            result.append(String(id))
        }
    }
    
    if result.first == "." {
        result.removeFirst()
    }
    
    if result.last == "." {
        result.removeLast()
    }

    if result.isEmpty {
        result.append("a")
    }
    
    let resultCount = result.count
    
    if resultCount <= 2 {
        var lastChar:String = result.last!
        result += Array(repeating: lastChar, count: 3 - result.count)
    } else if resultCount >= 16 {
        result[15...] = []
        if result.last == "." {
            result.removeLast()
        }
    }
    
    return result.joined()
}

print(solution("...!@BaT#*..y.abcdefghijklm")) //"bat.y.abcdefghi"
