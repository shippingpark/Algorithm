//
//  홍삼게임.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/18.
//

import Foundation

//func solution() {
//    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
//    let n = input[0]
//    let gamer1 = input[1] - 1
//    let gamer2 = input[2] - 1
//    let A = input[3]
//    let B = input[4]
//
//    var result = 0
//
//    var Astack:[Int] = [gamer1]
//    var Bstack:[Int] = [gamer2]
//
//    guard !move(current: gamer1, lenght: A, n: n).contains(gamer2) else {return print(1)}
//
//    while true {
//        var afterStack:[Int] = []
//
//        for caseA in Astack { //A주자가 지목
//            afterStack.append(contentsOf: move(current: caseA, lenght: A, n: n))
//        }
//
//        Astack = afterStack
//        result += 1
//        afterStack = []
//
//        if checkCanFinishGame(Astack: Astack, Bstack: Bstack) { //겹치는 지 확인
//            return print(result)
//
//        }
//
//        for caseB in Bstack { //B주자가 지목
//            afterStack.append(contentsOf: move(current: caseB, lenght: B, n: n))
//        }
//
//        Bstack = afterStack
//        result += 1
//
//        if checkCanFinishGame(Astack: Astack, Bstack: Bstack) { //겹치는 지 확인
//            return print(result)
//        }
//
//        if Astack.first == gamer1 {
//            break
//        }
//    }
//
//    print("Evil Galazy")
//}
//
//func move(current: Int, lenght: Int, n: Int) -> [Int] {
//    return [(current - lenght + n) % n, (current + lenght) % n]
//}
//
//func checkCanFinishGame(Astack: [Int], Bstack: [Int]) -> Bool {
//    for caseA in Astack {
//        if Bstack.contains(caseA) {
//            return true
//        }
//    }
//    return false
//}
//
//solution()
