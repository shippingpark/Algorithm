

//  LV1. 문자열 내림차순으로 배치하기

import Foundation

func solution(_ s:String) -> String {
    return s.sorted(by: >).reduce(""){String($0) + String($1)}
}

print(solution("Zbcdefg"))

