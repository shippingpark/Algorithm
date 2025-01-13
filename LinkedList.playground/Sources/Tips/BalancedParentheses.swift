//
//  DataStructures.swift
//  DataStructures
//
//  Created by 박혜운 on 1/2/25.
//

struct Balanced_Parentheses {
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
1) 균형이 맞으면 stack에서 열린 괄호(stack의 top)를 삭제한다
2) '균형이 맞으면' func 실행은 닫힌 괄호 c의 if의 첫번째 조건인 isEmpty 검사 이후 진행한다면 
'균형이 맞으면' func 파라미터 작성 시 .removeLast()를 통해 stack의 c를 넣어줄 수 있다 
3) 즉 '균형이 맞으면' func 실행은 반드시 stack의 삭제를 수행하므로 
4) 분기가 끝난 뒤 stack에 남은 요소값이 있는 지를 통해 답을 확인할 수 있다
  (분기 내부에 문제의 답을 위한 처리가 필요하지 않다)         
5) return stack.isEmpty() solution의 최종 답이 되는 것이다  
"""
}
