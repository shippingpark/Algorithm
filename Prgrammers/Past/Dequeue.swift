//
//  Dequeue.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/06.
//

import Foundation

// MARK: - 배열로 바꾸어 풀려고 했으나 이게 더 느림


struct Dequeue<T> {
    private var frontStack: [T] = []
    private var rearStack: [T] = []

    mutating func addFirst(_ element: T) {
        frontStack.append(element)
    }

    mutating func addLast(_ element: T) {
        rearStack.append(element)
    }

    mutating func popFirst() -> T? {
        if frontStack.isEmpty {
            while !rearStack.isEmpty {
                frontStack.append(rearStack.removeLast())
            }
        }
        return frontStack.popLast()
    }

    mutating func popLast() -> T? {
        if rearStack.isEmpty {
            while !frontStack.isEmpty {
                rearStack.append(frontStack.removeLast())
            }
        }
        return rearStack.popLast()
    }

    var isEmpty: Bool {
        return frontStack.isEmpty && rearStack.isEmpty
    }
    
//    func toArray() -> [T] {
//            return frontStack.reversed() + rearStack
//        }
    
    func toArray() -> [Any] {
            let flattenedFrontStack = frontStack.reversed().map { element -> Any in
                if let dequeue = element as? Dequeue<Int> {
                    return dequeue.toArray()
                } else {
                    return element
                }
            }
            
            let flattenedRearStack = rearStack.map { element -> Any in
                if let dequeue = element as? Dequeue<Int> {
                    return dequeue.toArray()
                } else {
                    return element
                }
            }

            return flattenedFrontStack + flattenedRearStack
        }
}
