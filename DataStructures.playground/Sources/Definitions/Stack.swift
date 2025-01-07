//
//  Stack.swift
//  DataStructures
//
//  Created by 박혜운 on 1/6/25.
//

import Foundation

// MARK: - 스택의 목적 - 데이터에 접근하는 방법의 수를 제한
// Collection과 같은 프로토콜을 채택하면 반복자와 아래첨자를 통해 요소가 노출되므로 목표에서 벗어남
public struct Stack<Element> {

  private var storage: [Element] = []

  public init() { }

  
  public mutating func push(_ element: Element) {
    storage.append(element) // O(1)
  }

  @discardableResult
  public mutating func pop() -> Element? {
    storage.popLast() // O(1)
  }

  public init(_ elements: [Element]) {
    storage = elements
  }
  
  // MARK: - 유용한 몇 가지 고려사항
  // 내용을 변경하지 않고 스택의 최상위 요소를 보는 peek()
  public func peek() -> Element? {
   storage.last
  }

  public var isEmpty: Bool {
    peek() == nil
  }

}

// MARK: - CustomStringConvertible 활용방안
// 1) String으로 맵핑한 배열
// 2) reversed()를 사용하여 이전 배열을 뒤집은 배열
// 3) joined(separator: )을 사용하여 배열을 문자열로 평면화하는 것 같은
extension Stack: CustomStringConvertible {
  public var description: String {
    """
    ----top----
    \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
    -----------
    """
  }
}

// MARK: - ExpressibleByArrayLiteral를 통해 배열 리터럴 형태로 초기화 하도록 돕는 방법
extension Stack: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: Element...) {
    storage = elements
  }
}


// MARK: - 중요도
// 트리와 그래프 검색에서 가능한 모든 결정을 스택에 푸시하고 돌아가기 위해 팝하는 데 적극 활용

