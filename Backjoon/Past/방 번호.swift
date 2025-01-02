//
//  방 번호.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/30.
//

import Foundation

let word:String = readLine()!
//var check:[Character:Int] = ["0": 0, "1": 0, "2": 0, "3": 0, "4": 0, "5": 0, "6": 0, "7": 0, "8": 0, "9": 0]
var check:[Character:Int] = Dictionary(uniqueKeysWithValues: (0...9).map { (Character(UnicodeScalar($0 + 48)!), Int(0)) })
var result:Int = 1

func valid6or9(char:Character) {
    if check["6"]! >= result && check["9"]! >= result {
        check[char] = check[char]! + 1
    } else if check["6"]! >= result  {
        check["9"] = check["9"]! + 1
    } else {
        check["6"] = check["6"]! + 1
    }
}

for char in word {
    if char == "6" || char == "9" {
        valid6or9(char:char)
    } else {
        check[char] = check[char]! + 1
    }
    
    if check[char]! > result {
        result += 1
    }
}


