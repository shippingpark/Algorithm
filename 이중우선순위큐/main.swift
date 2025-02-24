//
//  main.swift
//  이중우선순위큐
//
//  Created by 박혜운 on 2/24/25.
//

import Foundation

func solution_이중우선순위큐_기본(_ operations:[String]) -> [Int] {
    var array: [Int] = []
    
    for operation in operations {
        let input = operation.split(separator: " ").map { String($0) }
        if input[0] == "I", let num = Int(input[1]) {
            array.append(num)
        } else if input[1] == "1", let max = array.max() { // 최댓값 삭제
            guard let index = array.firstIndex(of: max) else { continue }
            array.remove(at: index)
        } else if input[1] == "-1", let min = array.min() { // 최솟값 삭제
            guard let index = array.firstIndex(of: min) else { continue }
            array.remove(at: index)
        }
    }
    return array.isEmpty ? [0, 0] : [array.max()!, array.min()!]
}

struct Heap<T: Equatable> {
    var elements: [T]
    let sort: (T, T) -> Bool
    
    init(elements: [T], sort: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.sort = sort
        guard !elements.isEmpty else { return }
        
        for i in stride(from: elements.count/2-1 , through: 0, by: -1) {
            siftDown(from: i)
        }
    }
    
    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 2
    }
    
    func parentIndex(ofChildAt index: Int) -> Int {
        (index - 1) / 2
    }
    
    mutating func remove() -> T? {
        guard !isEmpty else {
            return nil
        }
        elements.swapAt(0, count-1)
        defer {
            siftDown(from: 0)
        }
        return elements.removeLast()
    }
    
    mutating func remove(at index: Int) -> T? {
        guard index >= 0 && index < count else { return nil }
        elements.swapAt(index, 0)
        defer {
            siftDown(from: index)
            siftUp(from: index)
        }
        return elements.removeLast()
    }
    
    func index(of element: T, startingAt i: Int) -> Int? {
        guard i < count else { return nil }
        guard sort(element, elements[i]) else { return nil }
        
        if element == elements[i] {
            return i
        }
        
        if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
            return j
        }
        
        if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
            return j
        }
        
        return nil
    }
    
    mutating func insert(_ element: T) {
        elements.append(element)
        siftUp(from: count-1)
    }
    
    mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    
    mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let leftChild = leftChildIndex(ofParentAt: parent)
            let rightChild = rightChildIndex(ofParentAt: parent)
            
            var candidate = parent

            if leftChild < count && sort(elements[leftChild], elements[candidate]) {
                candidate = leftChild
            }
            
            if rightChild < count && sort(elements[rightChild], elements[candidate]) {
                candidate = rightChild
            }
            
            if parent == candidate { return }
            
            elements.swapAt(candidate, parent)
            parent = candidate
        }
    }
}

func solution_이중우선순위큐_힙(_ operations:[String]) -> [Int] {
    var minHeap = Heap<Int>(elements: [], sort: { (left, right) in
        return left <= right
    })
    var maxHeap = Heap<Int>(elements: [], sort: { (left, right) in
        return left >= right
    })
    var validNum: [Int: Int] = [:]
    
    
    
    for operation in operations {
        let input = operation.split(separator: " ").map { String($0) }
        if input[0] == "I", let num = Int(input[1]) {
            minHeap.insert(num)
            maxHeap.insert(num)
            validNum[num, default: 0] += 1
        } else if input[1] == "1" { // 최댓값 삭제
            while let max = maxHeap.remove() {
                guard validNum[max, default: 0] > 0 else { continue } // 애초에 가능한 숫자가 아니면 튕겨
                validNum[max, default: 0] -= 1
                break
            }
        } else if input[1] == "-1" { // 최솟값 삭제
            while let min = minHeap.remove() {
                guard validNum[min, default: 0] > 0 else { continue }
                validNum[min, default: 0] -= 1
                break
            }
        }
    }

    var (maxResult, minResult) = (0, 0)
    
    while let max = maxHeap.remove() {
        guard validNum[max]! > 0 else { continue }
        maxResult = max
        break
    }
    
    while let min = minHeap.remove() {
        guard validNum[min]! > 0 else { continue }
        minResult = min
        break
    }
    
    return [maxResult, minResult]
}

print(solution_이중우선순위큐_힙(["I 10", "I 20", "D 1", "I 30", "I 40", "D -1", "D -1"])) // 최소 최대 최대 최소
// 10 20
// 10
// 10 30 40
// 40

