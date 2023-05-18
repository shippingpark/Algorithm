//
//  30.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/17.
//

import Foundation

// MARK: - 수학적 풀이, 3의 배수는 모든 자릿수를 더했을 때 3의 배수

//func solution() {
//    let readNumber = readLine()!
//    let stringArray = readNumber.map{Int(String($0))!}
//    let isValid = stringArray.reduce(0){$0 + $1} % 3 == 0 && stringArray.contains(0)
//    var result = -1
//
//    if isValid {
//        let sortArray:[String] = stringArray.sorted(by: >).map{String($0)}
//        result = Int(sortArray.joined()) ?? 0
//    }
//
//    print(result)
//}
//
//solution()

func solution() -> String {
    guard let readNumber = readLine() else {return "-1"}
    let intArray = readNumber.map{ Int(String($0))! }.sorted(by: >)
    let isValid = intArray.reduce(0, +) % 3 == 0 && intArray.contains(0)
    var result = "-1"

    if isValid {
        result = intArray.map{ String($0) }.joined()
    }

    return result
}

//print(solution())
