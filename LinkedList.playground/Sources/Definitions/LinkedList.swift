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
    copyNodes()
    
    head = Node(value: value, next: head)
    if tail == nil {
      tail = head
    }
  }
  
  public mutating func append(_ value: Value) {
    copyNodes()
    
    // 1
    guard !isEmpty else {
      push(value)
      return
    }
    
    // 2
    tail!.next = Node(value: value) // 실제 연결 바꾸고
    
    // 3
    tail = tail!.next // LinkedList에 적용
  }
  
  public func node(at index: Int) -> Node<Value>? {
    // 1
    var currentNode = head
    var currentIndex = 0
    
    // 2
    while currentNode != nil && currentIndex < index {
      currentNode = currentNode!.next
      currentIndex += 1
    }
    
    return currentNode
  }
  
  // 1
  @discardableResult
  // @discardableResult을 사용하면 컴파일러가 경고를 표시하지 않고 호출자가 이 메소드의 반환 값을 무시할 수 있다
  public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
    copyNodes()
    // 2
    guard tail !== node else {
      append(value)
      return tail!
    }
    // 3
    node.next = Node(value: value, next: node.next)
    return node.next!
  }
  
  public var isEmpty: Bool {
    head == nil
  }
  
  @discardableResult
  public mutating func pop() -> Value? {
    copyNodes()
    defer {
      head = head?.next
      if isEmpty {
        tail = nil
      }
    }
    return head?.value
  }
  
  @discardableResult
  public mutating func removeLast() -> Value? {
    copyNodes()
    // 1
    guard let head = head else {
      return nil
    }
    // 2
    guard head.next != nil else {
      return pop()
    }
    // 3
    var prev = head
    var current = head
    
    while let next = current.next {
      prev = current
      current = next
    }
    // 4
    prev.next = nil
    tail = prev
    return current.value
  }
  
  @discardableResult
  public mutating func remove(after node: Node<Value>) -> Value? {
    guard let node = copyNodes(returningCopyOf: node) else { return nil }
    defer {
      if node.next === tail {
        tail = node
      }
      node.next = node.next?.next
    }
    return node.next?.value
  }
  
  private mutating func copyNodes() {
    // 소유자가 한 명 뿐인 복사 피함
    guard !isKnownUniquelyReferenced(&head) else {
      return
    }

    guard var oldNode = head else {
      return
    }
    
    head = Node(value: oldNode.value)
    var newNode = head
    
    while let nextOldNode = oldNode.next {
      newNode!.next = Node(value: nextOldNode.value)
      newNode = newNode!.next
      
      oldNode = nextOldNode
    }

    tail = newNode
  }

  private mutating func copyNodes(returningCopyOf node: Node<Value>?) -> Node<Value>? {
    guard !isKnownUniquelyReferenced(&head) else {
      return node
    }
    guard var oldNode = head else {
      return nil
    }
    
    head = Node(value: oldNode.value)
    var newNode = head
    var nodeCopy: Node<Value>?
    
    while let nextOldNode = oldNode.next {
      if oldNode === node {
        nodeCopy = newNode
      }
      newNode!.next = Node(value: nextOldNode.value)
      newNode = newNode!.next
      oldNode = nextOldNode
    }
    
    return nodeCopy
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

extension LinkedList: Collection {

  public struct Index: Comparable {

    public var node: Node<Value>?
    
    static public func ==(lhs: Index, rhs: Index) -> Bool {
      switch (lhs.node, rhs.node) {
      case let (left?, right?):
        return left.next === right.next
      case (nil, nil):
        return true
      default:
        return false
      }
    }
    
    static public func <(lhs: Index, rhs: Index) -> Bool {
      guard lhs != rhs else {
        return false
      }
      let nodes = sequence(first: lhs.node) { $0?.next }
      return nodes.contains { $0 === rhs.node }
    }
  }
  
  // 1
  public var startIndex: Index {
    Index(node: head)
  }
  // 2
  public var endIndex: Index {
    Index(node: tail?.next)
  }
  // 3
  public func index(after i: Index) -> Index {
    Index(node: i.node?.next)
  }
  // 4
  public subscript(position: Index) -> Value {
    position.node!.value
  }
}
