//
//  main.swift
//  Created by 박혜운 on 2023/02/22.
//



import Foundation




//func solution(_ number: String, _ k: Int) -> String {
//    var stack = [Character]()
//    let numbers = Array(number)
//    var removeCount = k
//
//    for n in numbers {
//        while !stack.isEmpty && stack.last! < n && removeCount > 0 {
//            stack.removeLast()
//            removeCount -= 1
//        }
//        stack.append(n)
//    }
//
//    if removeCount > 0 {
//        stack.removeLast(removeCount)
//    }
//
//    return String(stack)
//}










//// MARK: - 텀 프로젝트 미완
//
//let T:Int = Int(readLine()!)!
//
//for _ in 1...T {
//    let N = Int(readLine()!)!
//    let choices = readLine()!.compactMap({Int(String($0))})
//    solve(studentsCount: N, choices: choices)
//}
//
//func solve(studentsCount: Int, choices: [Int]) {
//    let choices: [Int] = [0] + choices
//    var result = studentsCount
//    var visited = Array(repeating: false, count: studentsCount + 1)
//    visited[0] = true
//    var loopVisited: [Bool] = visited
//
//    for i in 1...studentsCount { //10^5
//        loopVisited = visited
//        var stack:[Int] = []
//
//        if !loopVisited[i] {
//            dfs(now: i, find: i, stack: stack)
//        }
//    }
//
//    func dfs(now: Int, find: Int, stack:[Int]) {
//        guard !loopVisited[now] else {return}
//        loopVisited[now] = true
//        var stack = stack
//        stack.append(now)
//
//        if !loopVisited[choices[now]] {
//            dfs(now: choices[now], find: find, stack: stack)
//        } else {
//            if choices[now] == find {
//                visited = 방문처리(원본: visited, 추가: stack)
//                result -= (stack.count - 1)
//            }
//        }
//    }
//
//    print(visited.filter{$0 == false}.count)
//}
//
//func 방문처리(원본:[Bool], 추가:[Int]) -> [Bool] {
//    var visited: [Bool] = 원본
//
//    for i in 추가 {
//        visited[i] = true
//    }
//
//    return visited
//}
