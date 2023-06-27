//
//  LV2. 마법의 엘레베이터.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/27.
//

import Foundation

func solution(_ storey:Int) -> Int {
    
    var storeySTR = [0] + String(storey).map{ Int(String($0))! }
    var result = 0
  
    for i in (0..<storeySTR.count).reversed() {
        let n = storeySTR[i]
        if n > 5 {
            result += (10 - n)
            if i - 1 >= 0 {
                storeySTR[i-1] += 1
            }
        } else if n == 5 && i - 1 >= 0 && storeySTR[i - 1] >= 5 {
             result += 10 - n
            storeySTR[i-1] += 1
        } else {
            result += n
        }
    }
    
    return result
}
