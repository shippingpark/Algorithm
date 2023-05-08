//
//  File.swift
//  Algorithm
//
//  Created by 박혜운 on 2022/12/16.
//

import Foundation

let input = readLine()!.components(separatedBy: " ").map{Int($0)!}
let N = input[0]
let M = input[1]
let V = input[2]

var graph:[[Int]] = {
    var graph:[[Int]] = Array(repeating: [], count: N+1)
    for _ in 0..<M {
        let relation = readLine()!.split(separator: " ").map{Int(String($0))!}
        graph[relation[0]].append(relation[1])
        graph[relation[1]].append(relation[0])
        graph[relation[0]].sort()
        graph[relation[1]].sort()
    }
    return graph
}()

var check = Array(repeating: false, count: N+1)
var resultDfs = ""

func dfsSolve(_ now: Int) {
    check[now] = true
    resultDfs += "\(now) "
    for i in graph[now] {
        if !check[i] {
            dfsSolve(i)
        }
    }
}

func bfsSolve(_ now: Int) {
    var visited:Set<Int> = [now]
    var queue:[Int] = graph[now]
    var result = "\(now) "

    while !queue.isEmpty {
        let node = queue.removeFirst()
        if !visited.contains(node) {
            visited.insert(node)
            result += "\(node) "
            queue.append(contentsOf: graph[node])
        }
    }
    print(result)
}

dfsSolve(V)
print(resultDfs)
bfsSolve(V)

//var checklist = Array(repeating: true, count: N+1)
//var queue: [Int] = []

//func bfs(v: Int) {
//    queue.append(v)
//    checklist[v] = false
////    var node = v
//
//    while !queue.isEmpty {
//       let node = queue.removeFirst() //앞에서 삭제
//       print(node, terminator: " ")
//
//    for i in graph[node].sorted() {
//      if checklist[i] {
//        checklist[i] = false
//        queue.append(i)
//      }
//    }
//    }
//}


//이 코드가 왜 틀리냐
//func bfs(v: Int) {
//    queue.append(v)
//    checklist[v] = false
//    var node = v
//
//    while !queue.isEmpty {
////        node = queue.removeFirst()
////        print(node)
//        for i in graph[node].sorted() {
//          if checklist[i] {
//            checklist[i] = false //방문표시 해주고
//            queue.append(i) //추가
//          }
//        }
//        node = queue.removeFirst() //이건 틀리다
//        print(node, terminator: " ")
//        print(queue)
//
//    }
//}




//반례

//4 4 1
//1 2
//1 3
//2 3
//3 4

//[true, true, true, true, true]
//[true, false, false, false, true]

