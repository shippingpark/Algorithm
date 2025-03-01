//
//  main.swift
//  숨바꼭질3
//
//  Created by 박혜운 on 2/28/25.
//

import Foundation

// 다익스트라로 풀 수 있을 것 같다
// 최단거리를 갱신하며 진행
// dp로 풀 고민도 해봤는데 경로의 수를 정확히 알 수 없으므로 X (누적합할 누적치를 정확히 모름)
// 오답상황
// (1) N이 K보다 큰 상황
// (2) 시간초과

let input = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
let (N, K) = (input[0], input[1])

func bfs() {
  var visited = Array(repeating: false, count: 100001)
  visited[N] = true
  var queue = [(N, 0)]
  
  
  while !queue.isEmpty {
    let (current, weight) = queue.removeFirst()
    
    if current == K {
      print(weight)
      return
    }
    
    if current*2 < 100001 && !visited[current*2] {
      visited[current*2] = true
      queue.append((current*2, weight))
    }
    
    if current-1 >= 0 && !visited[current-1] {
      visited[current-1] = true
      queue.append((current-1, weight+1))
    }
    
    if current+1 < 100001 && !visited[current+1] {
      visited[current+1] = true
      queue.append((current+1, weight+1))
    }
  }
}

bfs()

//struct Heap<T> {
//  var array = [T]()
//  var sort: (T, T) -> Bool
//  
//  init(array: [T], sort: @escaping (T, T) -> Bool) {
//    self.array = array
//    self.sort = sort
//    
//    for i in stride(from: count/2-1, through: 0, by: -1) {
//      siftDown(at: i)
//    }
//  }
//  
//  var count: Int { return array.count }
//  var isEmpty: Bool { return array.isEmpty }
//  
//  func leftChildIndex(from index: Int) -> Int {
//    return 2 * index + 1
//  }
//  
//  func rightChildIndex(from index: Int) -> Int {
//    return 2 * index + 2
//  }
//  
//  func parentIndex(from index: Int) -> Int {
//    return (index-1) / 2
//  }
//  
//  mutating func append(_ value: T) {
//    array.append(value)
//    siftUp(at: count-1)
//  }
//  
//  mutating func remove() -> T {
//    array.swapAt(0, count-1)
//    defer {
//      siftDown(at: 0)
//    }
//    return array.removeLast()
//  }
//  
//  mutating func siftDown(at index: Int) {
//    var parent = index
//    
//    while true {
//      let left = leftChildIndex(from: index)
//      let right = rightChildIndex(from: index)
//      
//      var candidate = index
//      if count > left && sort(array[left], array[candidate]) {
//        candidate = left
//      }
//      
//      if count > right && sort(array[right], array[candidate]) {
//        candidate = right
//      }
//      
//      if candidate == index { return }
//      
//      array.swapAt(parent, candidate)
//      parent = candidate
//    }
//  }
//  
//  
//  mutating func siftUp(at index: Int) {
//    var child = index
//    var parent = parentIndex(from: child)
//    
//    while child > 0 && sort(array[child], array[parent]) {
//      array.swapAt(parent, child)
//      child = parent
//      parent = parentIndex(from: child)
//    }
//  }
//}
//
//func solution_숨바꼭질() {
//  guard N < K else { print(N-K); return }
//  var dist = Array(repeating: 1000000, count: K*2) // 목적지의 두 배까지 도달할 일은 없으므로
//  dist[N] = 0
//  var pq = Heap(array: [(N, 0)], sort: { $0.1 < $1.1 })
//  // [(N, 0)] // (index, weight)
//  
//  while !pq.isEmpty {
////    let index = pq.indices.min { pq[$0].1 < pq[$1].1 }! // 시간이 적은 것 부터
//    let (current, currentWeight) = pq.remove()
//    
//    if current == K {
//      print(currentWeight)
//      return
//    }
//    
//    guard dist[current] <= currentWeight else { continue }
//    
//    if current > 0 && dist[current-1] > dist[current]+1 {
//      dist[current-1] = dist[current]+1
//      pq.append((current-1, currentWeight+1))
//    }
//    if current < K*2-1 && dist[current+1] > dist[current]+1 {
//      dist[current+1] = dist[current]+1
//      pq.append((current+1, currentWeight+1))
//    }
//    if current*2 < K*2-1 && dist[current*2] > dist[current] {
//      dist[current*2] = dist[current]
//      pq.append((current*2, currentWeight))
//    }
//  }
//}
//
//solution_숨바꼭질()
