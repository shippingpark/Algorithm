//
//  main.swift
//  Algorithm
//
//  LV1.옹알이 (2)
//

import Foundation
//"aya", "ye", "woo", "ma"
func solution(_ babbling:[String]) -> Int {
    var result = 0

    for real in babbling {
        var old:Substring = "" //자르기 전의 값 담길 변수
        var new:Substring = Substring(real) //자른 후의 값 담길 변수
        while new != "" {
            old = new
            if old.hasPrefix("ye") || old.hasPrefix("ma") {
                guard old.count != 2 else {result += 1; break}
                new = old.suffix(old.count - 2)
                guard old.prefix(2) != new.prefix(2) else {break}
            } else if old.hasPrefix("aya") || old.hasPrefix("woo") {
                guard old.count != 3 else {result += 1; break}
                new = old.suffix(old.count - 3)
                guard old.prefix(3) != new.prefix(3) else {break}
            } else {
                break
            }
        }
    }
    return result
}

//
//print(solution(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"]))//2
//print(solution(["ayaye", "uuu", "yeayaye", "yemawoo", "ayaayaa"]))//3

