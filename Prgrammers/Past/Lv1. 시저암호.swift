//
//  File.swift
//  Algorithm
//
//  Lv1. 시저암호
//

import Foundation

// MARK: - 다듬은 풀이, 직관적인 해석

func solution(_ s:String, _ n:Int) -> String {
    let alphabets:[Character] = "abcdefghijklmnopqrstuvwxyz".map { $0 }
    return String(s.map {
        guard let index = alphabets.firstIndex(of: Character($0.lowercased())) else { return $0 }
        let letter = alphabets[(index + n) % alphabets.count]
        return $0.isUppercase ? Character(letter.uppercased()) : letter
    })
}

// MARK: - 첫 풀이

func solution(_ s:String, _ n:Int) -> String {
    let alphabet:[String] = Array("abcdefghijklmnopqrstuvwxyz").map{String($0)}
    
    func change(char: Character, move: Int) -> String {
        guard let index = alphabet.firstIndex(of: char.lowercased()) else {return String(char)}
        let moveIndex = ( index + move) % 26
        return char.isLowercase ? alphabet[moveIndex] : alphabet[moveIndex].uppercased()
    }
    
    return s.map{change(char: $0, move: n)}.joined()
}

//print(solution("ZZ", 2))


//extension String {
//    var isLowercased: Bool {
//        for c in utf8 where (65...90) ~= c { return false }
//        return true
//    }
//}
//
//func solution(_ s:String, _ n:Int) -> String {
//    let alphabet = Array("abcdefghijklnmopqrstuvwxyz")
//    let alphaBet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
//
//
//    let sArray = s.map{
//        guard $0 != " " else {
//            return $0
//        }
//        let index = alphabet.firstIndex(of: Character($0.lowercased()))!
//        if index + n > alphabet.count-1 {
//            if String($0).isLowercased {
//                return alphabet[index+n - alphabet.count]
//            }
//            return alphaBet[index+n - alphabet.count]
//        }
//        if String($0).isLowercased {
//            return alphabet[index+n]
//        }
//        return alphaBet[index+n]
//    }
//
//    return String(sArray)
//}

//func solution(_ s:String, _ n:Int) -> String {
//    let alphabet = "abcdefghijklnmopqrstuvwxyz".map{String($0)}
//    let alphaBet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map{String($0)}
//    let alphabetCount = alphabet.count
//    var result:[String] = []
//
//    func isLowercased(char: String) -> Bool {
//        return alphabet.contains(char)
//    }
//
//    for char in Array(s) {
//        guard char != " " else {result.append(" "); continue }
//        let index:Int = {
//            var index = alphabet.firstIndex(of: char.lowercased())!
//            index += n
//            if index >= alphabetCount - 1 {
//                return index - alphabetCount
//            }
//            return index
//        }()
//
//        if isLowercased(char: String(char)) {
//            result.append(alphabet[index])
//        }else{
//            result.append(alphaBet[index])
//        }
//    }
//
//    return result.joined()
//}


print(solution("AB", 1))
print(solution("z", 1))
print(solution("a B z", 4))



