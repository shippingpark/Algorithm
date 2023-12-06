//
//  숫자 카드 2.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/11/23.
//

import Foundation

// MARK: - 1

let _ = readLine()!
let ownCards = readLine()!.split(separator: " ")
let _ = readLine()!
let checkCards = readLine()!.split(separator: " ")

var frequencyDictionary: [String: Int] = Dictionary()

ownCards
  .forEach{ frequencyDictionary[String($0), default: 0] += 1 }

let result = checkCards
  .map{ frequencyDictionary[String($0)] ?? 0 }
  .map{ String($0) }

print(result.joined(separator: " "))


// MARK: - 2

let _ = readLine()!
let deck = readLine()!.split(separator: " ")
let _ = readLine()!
let check = readLine()!.split(separator: " ")

let deckDic = Dictionary(grouping: deck, by: { $0 }).mapValues{ $0.count }
let result = check.map{ deckDic[$0] ?? 0 }.map{ String($0) }
print(result.joined(separator: " "))


// MARK: - 3

let _ = readLine()
let sangGeonsDeck = readLine()!.split(separator: " ")
let _ = readLine()
var check = readLine()!.split(separator: " ")

var cardFrequency: [String.SubSequence: Int] = .init()

sangGeonsDeck.forEach{ cardFrequency[$0, default: 0] += 1 }
print(check.map{ cardFrequency[$0] ?? 0 }.map{ String($0) }.joined(separator: " "))



// MARK: - 4
// 시간초과 해소
// 왜 시간초과 난 지는 여전히 잘 모르겠다 

let _ = readLine()
let deck = readLine()!.split(separator: " ")
let _ = readLine()
let check = readLine()!.split(separator: " ")

var myDeckCount: [String.SubSequence: Int] = .init()

deck.forEach{ myDeckCount[$0, default: 0] += 1 }
print(check.map{ myDeckCount[$0] ?? 0 }.map{ String($0) }.joined(separator: " ")) // 시간초과 해소

//let result = check.map{ myDeckCount[$0, default: 0] }
//result.forEach{ print($0, terminator: " ") } // 시간초과 발생


// MARK: - 5
// 시간초과 발생
// grouping 으로 만들면 발생하는 듯

let _ = readLine()
let input = readLine()!.split(separator: " "),
deck = Dictionary(grouping: input, by: { $0 }).mapValues{ $0.count }
let _ = readLine()
let check = readLine()!.split(separator: " ")
let result = check.map{ deck[$0] ?? 0 }.map{ String($0) }

print(result.joined(separator: " "))
