//
//  RemoveAllOccurrences.swift
//  
//
//  Created by 박혜운 on 1/13/25.
//

import Foundation

// MARK: - 제시된 요소와 일치하는 노드 제거
// 노드 해제 방법

/// 새로운 head를 만들고 우선 시작점을 지정한다 (제시된 요소와 같은 value라면 head = head?.next)
/// prev는 head로 초기화, current는 head?.next 로 초기화하고 current의 값이 요소의 값과 같다면
/// prev.next가 current?.next를 가르키고, current = current?.next 한 뒤 while 문 continue
/// 요소값과 같지 않다면 한 칸씩 이동하기 (prev = current; current = current?.next)
/// current 값이 존재할 때 까지 반복하는 while 문이 종료되면 tail 값을 prev로 업데이트 하고 종료
/// 한 개씩 훑으며 내려가므로 O(n)
//extension LinkedList<T> {
//  func removeAll(value: T) {
//    while let head = head, head.value == value {
//      head = head?.next
//    }
//    
//    var prev = head
//    var current = head?.next
//    while let currentNode = current {
//      guard currentNode.value != value else {
//        prev?.next = currentNode.next
//        current = prev?.next
//        continue
//      }
//      prev = current
//      current = current?.next
//    }
//    
//    tail = prev
//  }
//}

