//
//  Queue.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/06.
//

import Foundation

struct Queue<T> {
    private var inputStack: [T] = []
    private var outputStack: [T] = []

    mutating func add(_ element: T) {
        inputStack.append(element)
    }

    mutating func remove() -> T? {
        if outputStack.isEmpty {
            while !inputStack.isEmpty {
                outputStack.append(inputStack.removeLast())
            }
        }
        return outputStack.popLast()
    }

    var isEmpty: Bool {
        return inputStack.isEmpty && outputStack.isEmpty
    }
}
