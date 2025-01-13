//
//  PrintInReverse.swift
//  
//
//  Created by 박혜운 on 1/13/25.
//

import Foundation

// MARK: 재귀함수

/// 재귀함수는 LinkedList와 같이 현재 나의 값(value)와 다음 노드 (next)만을 아는 단방향 값일 때 사용이 유용하다
/// 재귀함수를 사용한다는 것은 곧 스택 메모리 구조를 사용하겠다는 뜻
/// LinkedList는 본래 내 이전의 값을 알 수 없지만, 스택 구조를 사용하면 이를 알 수 있다
/// 스택 구조가 인터넷 브라우저 뒤로가기 기능으로 활용되는 것 처럼 말이다 (이전 화면으로 이동)
/// 즉, 뒤집어서 호출해야 하는 지금의 상황에도 굉장히 유용히 활용될 수 있다
///
/// [Solution1]
/// **list.head부터 시작한 노드에 대하여**
/// guard let node else { return } // 노드가 없을 때 까지 쭉 진행
/// reverseFunction(node.next)
/// print(node.value)
///
/// [Solution2] (처음 생각했던 Solution)
/// head 값을 pop 해서 하나씩 읽는다
/// 다만 이런 방식은 LinkedList의 구조를 깨뜨리므로 주의가 필요하다
/// Solution1처럼 LinkedList를 훼손하지 않으면서도 사용할 수 있다 


