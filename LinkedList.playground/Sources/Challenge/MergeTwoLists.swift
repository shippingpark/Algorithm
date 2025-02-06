//
//  MergeTwoLists.swift
//  
//
//  Created by 박혜운 on 1/13/25.
//

import Foundation

// MARK: - 두 LinkedList 병합

/// **[MySolution]**
/// 정렬된 LinkedList라는 전제가 있기 때문에 혼자 생각한 솔루션은 각 head 값을 비교하고 작은 값을 pop해서 tempLinedList에 push 하는 것 이었음
/// 하지만 이전까지의 모든 챌린지가 새로운 공간 할당을 사용하지 않는 방법에 대해서 고민하기 때문에
/// 두 개의 LinkedList의 구조를 훼손하지 않고, 포인터 두 개를 활용해서 새로운 LinkedList를 반환하는 방법에 대해 고민하게 됨

//func mySolutionMergeTwoLists(list1: LinkedList<Int>, list2: LinkedList<Int>) -> LinkedList<Int> {
//  var newList = LinkedList<Int>()
//  var point1 = list1.head
//  var point2 = list2.head
//  
//  while point1 != nil || point2 != nil {
//    if point1 <= point2, let point1 { // 옵셔널 값일 때 비교 어떻게 하지? / 분기 처리 어떻게 하지 ?
//      newList.append(point1.value) // 벗기고 넣어야 하는데 어떻게 넣지?
//      point1 = point1?.next
//    } else let point2 {
//      newList.append(point2.value)
//      point2 = point2?.next
//    }
//  }
//  
//  return newList
//}
//
///// **[EfficientSolution]**
///// head를 최솟값으로 두고 tail을 일치시기킴
///// 비교 연산이 가능할 떄 까지 tail의 방향을 node로 바꾸고 tail이동
///// 비교 연산이 불가능 해지면 뒷쪽 공간이 남은 list의 현재노드로 tail.next 방향 설정
///// tail next가 없어질 떄 까지 tail 이동
///// head값과 tail 값으로 새로운 LinkedList 반환 
//func mergeSorted(left: LinkedList<Int>, right: LinkedList<Int>) -> LinkedList<Int> {
//  guard !left.isEmpty else { // 하나가 비어 있으면 다른 하나를 반환
//    return right
//  }
//
//  guard !right.isEmpty else {
//    return left
//  }
//
//  var newHead: Node<T>? // 정렬된 값을 보유하기 위한 새로운 헤드
//
//  // 1
//  var tail: Node<T>?
//  var currentLeft = left.head
//  var currentRight = right.head
//  // 2
//  if let leftNode = currentLeft, let rightNode = currentRight {
//    if leftNode.value < rightNode.value {
//      newHead = leftNode
//      currentLeft = leftNode.next
//    } else {
//      newHead = rightNode
//      currentRight = rightNode.next
//    }
//    tail = newHead
//  }
//
//  // 1
//  while let leftNode = currentLeft, let rightNode = currentRight {
//    // 2
//    if leftNode.value < rightNode.value {
//      tail?.next = leftNode
//      currentLeft = leftNode.next
//    } else {
//      tail?.next = rightNode
//      currentRight = rightNode.next
//    }
//    tail = tail?.next
//  }
//
//  /// 나머지 노드를 처리하기 위함
//  if let leftNodes = currentLeft {
//    tail?.next = leftNodes
//  }
//
//  if let rightNodes = currentRight {
//    tail?.next = rightNodes
//  }
//  
//  var list = LinkedList<T>()
//  list.head = newHead
//  list.tail = {
//    while let next = tail?.next {
//      tail = next
//    }
//    return tail
//  }()
//  return list
//
//}
