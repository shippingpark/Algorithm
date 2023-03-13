//
//  LV2. 튜플 .swift
//  Algorithm
//
//  Created by 박혜운 on 2023/03/14.
//

import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    s.removeFirst()
    s.removeLast()
    s = s.replacingOccurrences(of: "{", with: "")
    s = s.replacingOccurrences(of: "}", with: "")
    let array = s.components(separatedBy: ",")
    var dict:[String:Int] = [:]
    
    for i in array {
        dict[i] = (dict[i] ?? 0) + 1
    }
    
    return dict.sorted(by: { $0.value > $1.value }).map{Int($0.key)!}
}
