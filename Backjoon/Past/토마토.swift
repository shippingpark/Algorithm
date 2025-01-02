//
//  토마토.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/09.
//
//
//import Foundation
//
//typealias Position = (N:Int, M:Int)
//
//func solution() -> Int {
//    let input = readLine()!.split(separator: " ").map { Int($0)! }
//    let M = input[0]
//    let N = input[1]
//    let nx = [0, 0, -1, 1]
//    let ny = [-1, 1, 0, 0]
//
//    var box = [[Int]]()
//    var 확인할Stack:[Position] = []
//    var 다음에Stack:[Position] = []
//    var days = -1
//
//    // 상자 정보 입력받기
//    for i in 0..<N {
//        let row = readLine()!.split(separator: " ").map { Int($0)! }
//        box.append(row)
//        for (j, value) in row.enumerated() {
//            if value == 1 {
//                확인할Stack.append(Position(N: i, M: j)) //시작점 지정
//            }
//        }
//    }
//
//    // BFS
//    while !확인할Stack.isEmpty {
//        let size = 확인할Stack.count
//        for _ in 0..<size {
//            let curr = 확인할Stack.removeLast()
//
//            for i in 0..<4 {
//                let nN = curr.N + ny[i]
//                let nM = curr.M + nx[i]
//
//                if nN >= 0 && nN < N && nM >= 0 && nM < M &&
//                    box[nN][nM] == 0 {
//                    box[nN][nM] = 1
//                    다음에Stack.append(Position(N: nN, M: nM))
//                }
//            }
//        }
//        확인할Stack = 다음에Stack
//        다음에Stack = []
//        days += 1
//    }
//
//    // 모든 토마토가 익었는지 확인
//    for row in box {
//        if row.contains(0) {
//            return -1
//        }
//    }
//
//    return days
//}
//
//print(solution())
//

//func solution() -> Int {
//    let input:[Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
//    let M:Int = input[0]
//    let N:Int = input[1]
//
//    var stack:[(N: Int, M: Int)] = []
//
//    var map: [[Int]] = {
//        var array:[[Int]] = Array(repeating: [], count: N)
//        for i in 0..<N {
//            array[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
//            for j in 0..<M {
//                if array[i][j] == 1 {
//                    stack.append((N: i, M: j))
//                }
//            }
//        }
//        return array
//    }()
//
//    guard !stack.isEmpty else {return -1}
//    let 하루기준 = (N:-10, M:-10)
//    stack.append(하루기준)
//
//    let ny = [-1, 1, 0, 0]
//    let nx = [0, 0, -1, 1]
//
//    var count = 0
//    while !stack.isEmpty {
//
//        let node = stack.removeFirst()
//
//        guard node != 하루기준 else {
//            if !stack.isEmpty {
//                stack.append(하루기준)
//                count += 1
//                continue
//            } else {
//                break
//            }
//        }
//
//        for i in 0..<4 {
//            let nN = node.N + ny[i]
//            let nM = node.M + nx[i]
//
//            guard nN >= 0 && nM >= 0 && nN < N && nM < M else {continue}
//            guard map[nN][nM] != -1 && map[nN][nM] == 0 else {continue}
//
//            map[nN][nM] = map[node.N][node.M] + 1
//            stack.append((N: nN, M: nM))
//        }
//    }
//
//    check: for i in 0..<N {
//        for j in 0..<M {
//            if map[i][j] == 0 {
//                count = -1
//                break check
//            }
//        }
//    }
//
//    return count
//}
//
//
//print(solution())
