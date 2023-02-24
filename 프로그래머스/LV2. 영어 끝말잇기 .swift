//
//  LV2. 영어 끝말잇기 .swift
//  Algorithm
//
//  Created by 박혜운 on 2023/02/24.
//

import Foundation

// MARK: - 더 나은 풀이

func solution(_ n:Int, _ words:[String]) -> [Int] {
    for i in 1..<words.count { //뒤를 기준으로 센다 (첫번째 사람은 절대 틀릴 일이 없음)
        if (words[i-1][words[i-1].index(words[i-1].endIndex, offsetBy:-1)] != words[i][words[i].startIndex])
            || (words[0..<i].contains(words[i])){
            return [((i+1) % n == 0 ? n : (i+1) % n), Int(i/n)+1]
        }
    }
    return [0,0]
}




// MARK: - 개선 된 다른 풀이

//func solution(_ n:Int, _ words:[String]) -> [Int] {
//    var count = Array(repeating: 0, count: n)
//    var overWord = [String]()
//
//    for i in 0..<words.count {
//        let turn = (i + n) % n
//        guard !overWord.contains(words[i]) else {return [turn + 1, count[turn]+1]}
//        if i > 0 {
//            guard (overWord.last ?? "0").last! == words[i].first! else { return [turn + 1, count[turn] + 1]}
//        }
//        count[turn] += 1
//        overWord.append(words[i])
//    }
//    return [0, 0]
//}

// MARK: - 기존 풀이 수정 후 해결

//func solution(_ n:Int, _ words:[String]) -> [Int] {
//    let words = words
//    var personNum:Int = 0
//    var turn:Int = 0
//
//    for (index, word) in words.enumerated() {
//        if words[0...index].filter({$0 == word}).count > 1 { //이미 했던 단어
//            personNum = (index + 1) % n == 0 ? n : (index + 1) % n
//            turn = (index) / n + 1
//            break
//        }
//        else if index > 0 && words[index-1].last != words[index].first { //끝말잇기 검사
//            personNum = (index + 1) % n == 0 ? n : (index + 1) % n
//            turn = (index) / n + 1
//            break
//        }
//    }
//
//    return [personNum, turn]
//}



// MARK: - 19번 테스트 실패 : 원인 파악 -> 중복 단어를 순차적으로 확인하지 않기 때문에 순서상의 문제가 생긴다

//func solution(_ n:Int, _ words:[String]) -> [Int] {
//    let words = words
//    var personNum:Int = 0
//    var turn:Int = 0
//
//    for (index, word) in words.enumerated() {
//        if words.filter({$0 == word}).count > 1 { //이미 했던 단어
//            let secondIndex = words[(index+1)...].firstIndex(of: word)!
//            personNum = (secondIndex + 1) % n == 0 ? n : (secondIndex + 1) % n
//            turn = (secondIndex) / n + 1
//            break
//        }
//        else if index > 0 && words[index-1].last != words[index].first { //끝말잇기 검사
//            personNum = (index + 1) % n == 0 ? n : (index + 1) % n
//            turn = (index) / n + 1
//            break
//        }
//
//    }
//
//    return [personNum, turn]
//}

//print(solution(2, ["ac","ca","ac","ac"])) //[1,2]
//print(solution(2, ["land", "dream", "mom", "mom", "ror"]))
//print(solution(2, ["land", "dream", "mom", "mom"]))
