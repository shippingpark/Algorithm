//
//  이전 순열.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/08/09.
//

//import Foundation
//
//let n = Int(readLine()!)! //4
//let line = readLine()! //1 2 3 4
//var find: [Int] = line.split(separator: " ").compactMap{ Int($0) }
//
//if find == find.sorted(by: <) {
//  print("-1")
//} else {
//  var largeIndex = 0
//  for index in 0..<(n-1) {
//    if find[index] > find[index + 1] {
//      largeIndex = index
//    }
//  }
//
//  var changeIndex = 0
//  for index in ((largeIndex+1)..<n) {
//    if find[index] < find[largeIndex] {
//      changeIndex = index
//    }
//  }
//
//  find.swapAt(largeIndex, changeIndex)
//  find[(largeIndex+1)..<n].sort(by: >)
//
//  print(find.map{ String($0) }.joined(separator: " "))
//}

// MARK: - 참고 풀이

//let n = Int(readLine()!)!
//var arr = readLine()!.split(separator: " ").map{Int($0)!}
//var temp: Int = 0
//var bigTemp = 0
//
//if arr.sorted() == arr {
//    print("-1")
//}else {
//    for i in 0..<arr.count{
//        if i + 1 < arr.count, arr[i] > arr[i + 1]{
//            temp = i
//        }
//    }
//
//    for i in (temp + 1)..<arr.count {
//        if arr[temp] > arr[i] {
//            bigTemp = i
//        }
//    }
//  print(temp, bigTemp)
//
//    arr.swapAt(temp, bigTemp)
//    arr[(temp + 1)..<arr.count].sort(by: >)
//
//    print(arr.map{String($0)}.joined(separator: " "))
//}
//
