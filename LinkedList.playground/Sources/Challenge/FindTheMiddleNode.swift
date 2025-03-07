//
//  FindTheMiddleNode.swift
//  
//
//  Created by 박혜운 on 1/13/25.
//

import Foundation

// MARK: 두 개의 참조 활용, 한 칸씩 이동하는 참조와 두 칸씩 이동하는 참조 : Runner 기법 

/// LinkedList라는 게 head에서부터 시작할 때 모든 값을 훑을 수 있음을 유념해야 할 듯
/// 두 개의 참조를 활용하라 할떄, 하나는 두 배씩 증가하고 하나는 느리게 증가하는 값을 쓰라는 풀이를 봤을 때
/// 애초에 tail을 fast로 보고 접으면서 쓰면 되는 거 아닌가 했다
/// 하지만 index 개념이 없는 LinkedList에서는 쉽지 않은 일이었다
/// 애초에 tail과 그 중앙 값을 잡아보기에 '중앙 값' 을 찾을 단서가 없다.
/// 모든 Node는 자기 자신과 그 다음 값만 알고 있기 때문이다

func getMiddle<T>(_ list: LinkedList<T>) -> Node<T>? {
  var slow = list.head
  var fast = list.head

  while let nextFast = fast?.next { // fast 기준 다음 값이 있다면? 진행한다.
    fast = nextFast.next // 두 칸을 띄우지 못해도 괜찮다. 한 칸을 움직여도 nil 값까지 고려하여 slow가 반드시 진출하기 떄문
    slow = slow?.next
  }

  return slow
}

/// 답을 보지 않고 생각했던 Solution은 find(at: list.count/2) 였다
/// 이런 find 함수는 i 만큼, 정확히는 n/2의 시간이 걸린다
/// 위의 solution도 n/2만큼의 시간이 걸린다. 왜냐하면 두 칸씩 이동하기 떄문이다 (주의, 두 배씩이 아님)
/// 즉 어떤 방식이건 O(n/2)의 시간복잡도가 걸린다

