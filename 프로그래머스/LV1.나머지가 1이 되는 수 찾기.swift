

//  LV1.나머지가 1이 되는 수 찾기

import Foundation

func solution(_ n:Int) -> Int {
    for i in 2...n-1 {
        if (n-1)%i == 0 {
            return i
        }
    }
    return n-1
}

