//
//  main.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/02/16.
//

import Foundation

// MARK: - Error : CoreDump

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    var alphabet:[Character] = "abcdefghijklmnopqrstuvwxyz".map{$0}
    var result:[String] = [] 
    
    for skipChar in skip {
        guard let skipIndex = alphabet.firstIndex(of: skipChar) else {continue}
        alphabet.remove(at: skipIndex)
    }
    
    for sChar in s {
        var findIndex:Int = alphabet.firstIndex(of: sChar)! + index
        
        if findIndex + 1 > alphabet.count {
            findIndex = findIndex % alphabet.count
        }
        result.append(String(alphabet[findIndex]))
    }
    
    return result.joined()
}

print(solution("aukks", "wbqd", 5))
