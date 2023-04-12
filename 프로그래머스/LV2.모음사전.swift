//
//  LV2.모음사전.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/11.
//

import Foundation

// MARK: - DFS

func solution(_ word: String) -> Int {
    let alphabet: [String] = ["A", "E", "I", "O", "U"]
    var result: [String] = []
    
    func dfs(str: String) {
        result.append(str)

        guard str.count != 5 else {return}
        
        for i in 0..<5 {
            dfs(str: str + alphabet[i])
        }
    }
    
    dfs(str: "")
    
    return result.firstIndex(of: word)!
}

// MARK: - 6진수 (수학적 접근)

//func solution(_ word: String) -> Int {
//    var answer = 0
//    let char: [Character] = ["A", "E", "I", "O", "U"]
//    let li = [781, 156, 31, 6, 1]
//
//    for (index, value) in word.enumerated() {
//        if let charIndex = char.firstIndex(of: value) {
//            answer += charIndex * li[index]
//        }
//    }
//
//    answer += word.count
//    return answer
//}


//func solution(_ word:String) -> Int {
//    var result = 0
//    var word = word
//
//    var 제곱 = 4.0
//    for char in word {
//        var value: Int = {
//            switch char {
//            case "A":return 0
//            case "E":return 1
//            case "I":return 2
//            case "O":return 3
//            case "U":return 4
//            default: return 0
//            }
//        }()
//        result += Int(pow(5.0, 제곱)) * value + 1
//        제곱 -= 1.0
//    }
//
//    var test = word.filter{$0 != "A"}.first ?? "A"
//
//    var value: Int = {
//        switch test {
//        case "A":return 0
//        case "E":return 1
//        case "I":return 2
//        case "O":return 3
//        case "U":return 4
//        default: return 0
//        }
//    }()
//    print(test)
//
//    var addBeford:Int = 0
//    switch word.count {
//    case 1: addBeford += Int(pow(5.0, 3.0)) * value; fallthrough
//    case 2: addBeford += Int(pow(5.0, 2.0)) * value; fallthrough
//    case 3: addBeford += Int(pow(5.0, 1.0)) * value; fallthrough
//    case 4: addBeford += value;
//    default: addBeford += 0
//    }
//
//    return result + addBeford
//}

//
//print(solution("I"))
//print(solution("EIAAA"))
//print(solution("A"))
