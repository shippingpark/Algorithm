//
//  File.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/01/25.
//

import Foundation

//func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
//    var result = 0
//    var resultArr = [Int]()
//
//    for i in 1...number { //10^5
//        let num = checkDivisor(num: i)
//        if num > limit {
//            resultArr.append(power)
//            result += power
//        } else {
//            resultArr.append(num)
//            result += num
//        }
//    }
//    print(resultArr)
//    return result
//}
//
//func checkDivisor(num:Int) -> Int {
//    guard num != 1 else {return 1}
//    var result: Int = 1
//    let numberPer2 = num / 2 //10^3
//    for i in 1...numberPer2 {
//        if num % i == 0 {
//            result += 1
//        }
//    }
//    return result
//}

//func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
//    var result = Array(repeating: 0, count: number)
//    for i in 1...number {
//        for j in 1...Int(sqrt(Double(i))) {
//            if i % j == 0 {
//                if (j * j) == i {
//                    result[i-1] += 1
//                } else {
//                    result[i-1] += 2
//                }
//            }
//            if result[i-1] > limit {
//                result[i-1] = power
//                break
//            }
//        }
//    }
//    return result.reduce(0,+)
//}

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var attack = [Int](repeating: 1, count: number+1)
    attack[0] = 0
    for i in 2...number {
        var c = i
        while c <= number {
            print("\(c) <= \(number)")
            attack[c] += 1
            c += i
        }
        print(attack)
    }
    attack = attack.map { $0 > limit ? power : $0 }
    return attack.reduce(0, +)
}


print(solution(5, 3, 2)) //10
print(solution(10, 3, 2))


