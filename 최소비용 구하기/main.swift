//
//  main.swift
//  최소비용 구하기
//
//  Created by 박혜운 on 2/26/25.
//

import Foundation

// MARK: - 인접행렬
let N = Int(readLine()!)! // 도시의 개수
let M = Int(readLine()!)! // 버스의 개수

var pq = [(Int, Int)]()
var dist = [Int](repeating: Int.max, count: N+1)

var graph = Array(repeating: Array(repeating: -1, count: N+1), count: N+1)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    if graph[input[0]][input[1]] != -1 {
        graph[input[0]][input[1]] = min(graph[input[0]][input[1]], input[2])
    } else {
        graph[input[0]][input[1]] = input[2]
    }
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (start, end) = (input[0], input[1])

pq.append((start, 0))
dist[start] = 0

while !pq.isEmpty {
    let minIndex = pq.indices.min(by: { pq[$0].1 < pq[$1].1 })!
    let (current, weight) = pq.remove(at: minIndex)

    if current == end {
        break
    }
    
    for i in 1...N {
        guard graph[current][i] != -1 else { continue }
        if dist[i] > graph[current][i]+weight {
            dist[i] = graph[current][i]+weight
            pq.append((i, dist[i]))
        }
    }
}

print(dist[end] == Int.max ? 0 : dist[end])


// MARK: - 인접리스트

//let N = Int(readLine()!)! // 도시의 개수
//let M = Int(readLine()!)! // 버스의 개수
//
//var pq = [(Int, Int)]()
//var dist = [Int](repeating: Int.max, count: N+1)
//
//var graph: [[(Int, Int)]] = Array(repeating: [], count: N+1)
//
//for _ in 0..<M {
//    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//    
//    let list = graph[input[0]]
//    let newVertex = (input[1], input[2])
//    if let index = list.firstIndex { $0.0 == input[1] } {
//        let value = min(graph[input[0]][index].1, input[2])
//        graph[input[0]][index] = (input[1], value)
//    } else {
//        graph[input[0]].append(newVertex)
//    }
//}
//
//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (start, end) = (input[0], input[1])
//
//pq.append((start, 0))
//dist[start] = 0
//
//while !pq.isEmpty {
//    let minIndex = pq.indices.min(by: { pq[$0].1 < pq[$1].1 })!
//    let (current, weight) = pq.remove(at: minIndex)
//
//    if current == end {
//        break
//    }
//    
//    for (i, nextWeight) in graph[current] {
//        if dist[i] > nextWeight+weight {
//            dist[i] = nextWeight+weight
//            pq.append((i, dist[i]))
//        }
//    }
//}
//
//print(dist[end] == Int.max ? 0 : dist[end])
