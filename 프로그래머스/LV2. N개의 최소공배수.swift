//
//  LV2. N개의 최소공배수.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/03/02.
//

import Foundation

// MARK: - 최대 공약수 확용 풀이

func gcd(_ a: Int, _ b: Int) -> Int {
  let r = a % b
  if r != 0 {
    return gcd(b, r)
  } else {
    return b
  }
}

func lcm(_ m: Int, _ n: Int) -> Int {
  return m / gcd(m, n) * n
}
func solution(_ arr:[Int]) -> Int {
    return arr.reduce(1) { lcm($0, $1) }
}



// MARK: - 개선 풀이
//
//func solution(_ arr:[Int]) -> Int {
//    let maxNum = arr.max()!
//    var result = maxNum
//    while arr.filter({result % $0 == 0}).count != arr.count {
//        result += maxNum
//    }
//    return result
//}
//
//print(solution([2,6,8,14]))




// MARK: - 처음 풀이

//func solution(_ arr:[Int]) -> Int {
//    var primeNum = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 39, 41, 43, 47, 53, 59, 67, 71, 73, 79, 83, 87, 89, 91, 97]
//    var arrSorted = arr.sorted()
//    var num: Int = primeNum.removeFirst()
//    var result: Int = 1
//
//    while !arrSorted.isEmpty {
//        arrSorted = arrSorted.filter{$0 != 1}
//
//        guard !arrSorted.filter({$0 % num == 0}).isEmpty else {num = primeNum.removeFirst(); continue}
//
//        arrSorted = arrSorted.map{
//            if $0 % num == 0 {
//                return $0 / num
//            }
//            else { return $0 }
//        }
//
//        result *= num
//    }
//
//    return result
//}

//print(solution([12, 32, 45, 67, 72])) //96480

