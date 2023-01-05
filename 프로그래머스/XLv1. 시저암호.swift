//
//  File.swift
//  Algorithm
//
//  Lv1. 시저암호
//

import Foundation


extension String {
    var isLowercased: Bool {
        for c in utf8 where (65...90) ~= c { return false }
        return true
    }
}

func solution(_ s:String, _ n:Int) -> String {
    let alphabet = Array("abcdefghijklnmopqrstuvwxyz")
    let alphaBet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    var sArray = s.map{
        guard $0 != " " else {
            return $0
        }
        let index = alphabet.firstIndex(of: Character($0.lowercased()))!
        if index + n > alphabet.count-1 {
            if String($0).isLowercased {
                return alphabet[index+n - alphabet.count]
            }
            return alphaBet[index+n - alphabet.count]
        }
        if String($0).isLowercased {
            return alphabet[index+n]
        }
        return alphaBet[index+n]
    }
    
    return String(sArray)
}
//
//print(solution("AB", 1))
//print(solution("z", 1))
//print(solution("a B z", 4))
//


