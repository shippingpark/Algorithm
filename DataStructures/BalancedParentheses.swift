//
//  DataStructures.swift
//  DataStructures
//
//  Created by 박혜운 on 1/2/25.
//

struct Balanced_Parentheses: DataStructures {
  static let main: String = """
  다양한 괄호로 이루어진 문자열이 균형 잡혀 있는지 확인하는 방법은 ⭐️스택⭐️
"""
  
  static let solution: String = """
{[()]}와 같이 밸런스가 완벽한, 잘 닫힌 문자열이 제공되었는 지 확인하려면 스택을 활용하면 좋다
문제가 담긴 배열을 하나씩(c) 읽어나가며 (for)
[분기처리]
열린 괄호일 때, 닫힌 괄호 일때 다른 케이스 처리를 수행한다 (if, else)
[분기처리(1): 열린 괄호일 때]
c를 스택에 넣는다    
[분기처리(2): 닫힌 괄호일 때]
if 스택의 top이 없다 || top != c {
  return false 
}

[키 포인트]
stack을 비우고  


"""
}
