//
//  LV2. [3차]압축.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/03/28.
//

import Foundation

func solution(_ msg:String) -> [Int] {
    var alphaDic: [String] = "abcdefghijklmnopqrstuvwxyz".map{String($0)}
    let msgArr: [String] = msg.map{String($0.lowercased())}
    var pass:Int = 0
    var result:[Int] = []
    
    for (index, alpha) in msg.lowercased().enumerated() {
        guard pass <= 1 else {pass -= 1 ; continue}
        var add = 0
        var addWord:String = String(alpha)
        var validWord:String = String(alpha)
        while index + add < msg.count {
            addWord = msgArr[index...index+add].joined()
            guard alphaDic.contains(addWord) else {break}
            validWord = addWord
            add += 1
        }
        pass = add
        result.append(alphaDic.firstIndex(of: validWord)! + 1)
        guard addWord.count > 1 else {continue}
        alphaDic.append(addWord.lowercased())
    }
    
    return result
}

//print(solution("KAKAO"))
//print(solution("TOBEORNOTTOBEORTOBEORNOT"))
//print(solution("ABABABABABABABAB"))
