//
//  ReverseALinkedList.swift
//  
//
//  Created by 박혜운 on 1/13/25.
//

import Foundation

// MARK: - 노드 방향을 반대로 만들기

/// **[My Solution]**
/// 내가 생각한 solution 재귀방식
/// Stack으로 Node를 하나씩 쌓아 올렸다고 생각하면, 함수가 종료되기 시작할 때 당장의 함수가 뒤편의 값을 알려면, 뒤편의 함수가 값을 넘겨줬어야 한다
/// 재귀함수는 단방향 데이터의 역순 호출을 가능하게 하지만, 현재의 값이 이전의 값을 알게 할 수 있긴 하다
//func reverseLinkedList(before: Node<T>, node: Node<T>?) {
//  guard let node else { return }
//  reverseLinkedList(before: node, node: node.next)
//  node.next = before
//}
//
///// **[Easy Solution]**
///// Collection 프로토콜을 채택한 덕에 자동으로 Squence 자격을 갖추었으니 순회 가능
///// 이렇게 만들면 좋지만, O(n)의 공간을 필요로 한다는 단점이 존재
///// 코드는 좀 더 복잡해질지언정 next의 포인터만을 옮겨서 값을 움직이는 솔루션이 효율적
//extension LinkedList {
//
//  mutating func reverseEasy() {
//
//    // 1
//    let tmpList = LinkedList<Value>()
//    for value in self { // Sequnces
//      tmpList.push(value)
//    }
//
//    // 2
//    head = tmpList.head
//  }
//}
//
///// **[Efficient Solution]**
///// next 포인터를 움직여서 완성하는 해답
///// 그림을 그려 이해하면 쉽다
///// current의 next를 prev로 바꿀 때, 가지고 있던 next 값의 손실이 일어나므로 이를 보존할 포인터가 필요하다
///// 하나씩 훑기 때문에 시간복잡도는 여전히 O(n)이다.
///// 하지만 Node 객체를 새로 할당할 필요가 없어졌기 때문에 성능상으로 많이 개선되었다
///// (push 작업이 늘 새로운 Node를 할당하는 일임에 유의)
//extension LinkedList {
//
//  mutating func reverseEfficient() {
//    tail = head // head를 tail에 할당하는 것 부터 시작
//    var prev = head
//    var current = head?.next
//    prev?.next = nil
//    
//    while current != nil {
//      let next = current?.next // 보존할 포인터
//      current?.next = prev
//      prev = current
//      current = next
//    }
//
//    head = prev
//  }
//}
//
