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
