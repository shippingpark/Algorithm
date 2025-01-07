//
//  LinkedList.swift
//  
//
//  Created by 박혜운 on 1/7/25.
//

import Foundation

public struct LinkedList<Value> {

  public var head: Node<Value>?
  public var tail: Node<Value>?
  
  public init() {}
  
  // MARK: - 빈 목록에 푸시하는 경우 새 노드는 목록의 head 및 tail
  public mutating func push(_ value: Value) {
    head = Node(value: value, next: head)
    if tail == nil {
      tail = head
    }
  }

  public mutating func append(_ value: Value) {

    // 1
    guard !isEmpty else {
      push(value)
      return
    }
    
    // 2
    tail!.next = Node(value: value)
    
    // 3
    tail = tail!.next
  }


  public var isEmpty: Bool {
    head == nil
  }
}

extension LinkedList: CustomStringConvertible {

  public var description: String {
    guard let head = head else {
      return "Empty list"
    }
    return String(describing: head)
  }
}
