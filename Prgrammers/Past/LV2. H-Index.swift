//
//  LV2. H-Index.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/03/07.
//

import Foundation

func solution(_ citations:[Int]) -> Int {
    for i in citations.sorted() { //정렬
        guard i != 0 else {continue} //0번 이용에 대한 논문 수는 전체 갯수와 같으므로 신경쓰지 않음 + 0만 존재할 경우 반복문 없이 바로 return 0
        let dic = Dictionary(grouping: citations, by: {$0 >= i}) //i가 3일 때 [true: 3, 4, 5, false: 1, 2]
        if dic[true]?.count ?? 0 == i && dic[false]?.count ?? 0 <= i{ //h번 인용된 논문 수 == h번 일 때 바로 h 반환
            return i
        } else if dic[true]?.count ?? 0 < i { //h번 인용된 인용된 논문 수 < h로 역전될 때, 인용 수 보다는 개수에 초점을 맞추어 반환
            return dic[true]?.count ?? 0
        }
    }
    return 0
}


//0번 이상 인용된 논문은 다섯개 , 1번 이상 인용된 논문은 네 개, 4번 이상 인용된 논문은 세 개, i번 이상 인용된 논문이 i개
//h번 이상 인용된 논문이 h편
