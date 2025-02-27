//
//  main.swift
//  연구소
//
//  Created by 박혜운 on 2/27/25.
//

import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])

var graph = [[Int]](repeating: [], count: N)
for i in 0..<N {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    graph[i] = input
}

var visited = Array(repeating: Array(repeating: false, count: M), count: N)

func wallTracking(_ stack: [(Int, Int)] = [], startIndex: Int = 0) {
    if stack.count == 3 { // 세 개가 되면
        var graph = graph
        for (x, y) in stack {
            graph[x][y] = 1
        }
        resarch(graph)
        return
    }
    
    // 이전 인덱스를 2차원으로 기억하고 그 이후부터 진행해야 할 때의 아이디어
    for i in startIndex..<N*M {
        let x = i / M
        let y = i % M
        
        guard graph[x][y] == 0 else { continue }
        guard visited[x][y] == false else { continue }
        guard !stack.contains (where: { $0 == (x, y) }) else { continue }
        visited[x][y] = true
        wallTracking(stack + [(x, y)], startIndex: i + 1)
        visited[x][y] = false
    }
}

var result = 0

func resarch(_ graph: [[Int]]) {
    var graph = graph
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    
    for x in 0..<N {
        for y in 0..<M {
            guard graph[x][y] == 2 else { continue }
            var queue: [(Int, Int)] = [(x, y)]
            
            while !queue.isEmpty {
                let (cx, cy) = queue.removeFirst()
                
                for i in 0..<4 {
                    let (nx, ny) = (cx + dx[i], cy + dy[i])
                    guard nx >= 0 && nx < N && ny >= 0 && ny < M else { continue }
                    guard graph[nx][ny] != 2 && graph[nx][ny] != 1 else { continue }
                    graph[nx][ny] = 2
                    queue += [(nx, ny)]
                }
            }
        }
    }
    
    let count = graph.flatMap { $0 }.filter { $0 == 0 }.count
    result = max(result, count)
}

wallTracking()
print(result)
