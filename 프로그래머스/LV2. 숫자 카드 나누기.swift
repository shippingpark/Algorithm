//
//  LV2. 숫자 카드 나누기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/29.
//

import Foundation

// MARK: - 유클리드 호재법

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
  var a = Int.min
  
  // 최대공약수
  func gcd(_ a: Int, _ b: Int) -> Int{
      if (b == 0) { return a }
      return gcd(b, a % b)
  }
  
  var aGcd = arrayA[0]
  var bGcd = arrayB[0]
  
  for i in 0..<arrayA.count {
    aGcd = gcd(aGcd, arrayA[i])
    bGcd = gcd(bGcd, arrayB[i])
  }
  
  func checkA() -> Bool {
    for i in 0..<arrayA.count {
      if arrayB[i] % aGcd == 0 {
        return false
      }
    }
    return true
  }
  
  func checkB() -> Bool {
    for i in 0..<arrayA.count {
      if arrayA[i] % bGcd == 0 {
        return false
      }
    }
    return true
  }
  
  a = checkA() ? max(a, aGcd) : a
  a = checkB() ? max(a, bGcd) : a
  
  return a == Int.min ? 0 : a

}




// MARK: - 시간초과 풀이

//import Foundation
//
//func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
//    //1-1) 각 배열 중 적어도 한 개의 배열은 n의 배수 형태이다 else { return 0 }
//    //1-2) 각 배열의 n 값은 최솟값의 약수 중 하나이다
//    //1-3) n 값은 배열에 존재하지 않는 값일 수 있다
//    //1-4) n 값은 배열의 최솟값에 가장 가까운 값이어야 한다
//    //2) n이 될 수 있는 가장 큰 값이 상대의 배열을 전부 나누지 못한다면 n은 a가 된다
//    //3) 각 배열의 a값을 구해 가장 큰 것을 선택한다
//
//    var minA = arrayA.min()!
//    var minB = arrayB.min()!
//    var aIs2:Bool = false
//    var a = Int.min
//
//    func checkA() {
//        guard minA != 1 else { return }
//        nLoop: for n in (2...minA).reversed() {
//            guard minA % n == 0 else { continue }
//            for a in arrayA {
//                guard a % n == 0 else { continue nLoop }
//            }
//
//            for b in arrayB {
//                guard b % n != 0 else { continue nLoop }
//            }
//            a = max(a, n)
//            return
//        }
//    }
//
//    func checkB() {//A를 나누어 떨어지게 하고 B는 나누어 떨어지지 않게 하는
//        guard minB != 1 else { return }
//        nLoop: for n in (2...minB).reversed() {
//            guard minB % n == 0 else { continue }
//            for a in arrayA {
//                guard a % n != 0 else { continue nLoop }
//            }
//
//            for b in arrayB {
//                guard b % n == 0 else { continue nLoop }
//            }
//            a = max(a, n)
//            return
//        }
//    }
//
//    checkA()
//    checkB()
//
//    return a == Int.min ? 0 : a
//}
//
//
