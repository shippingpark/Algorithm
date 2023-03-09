//
//  LV2.[1차] 캐시 .swift
//  Algorithm
//
//  Created by 박혜운 on 2023/03/09.
//

import Foundation


func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    guard cacheSize != 0 else {return cities.count * 5}
    var result:Int = 0
    var array:[String] = [] //소문자 명으로만 구성
    
    for city in cities {
        let search = city.lowercased() //비교군: 반드시 소문자
        
        if array.contains(search){ //있는 도시일 때
            array.remove(at: array.firstIndex(of: search)!) //최신화
            array.append(search)
            result += 1
        } else { //없는 도시일 때
            result += 5
            array.append(search)
            guard array.count <= cacheSize else {array.removeFirst(); continue} //캐시 사이즈 확인
        }
    }
    return result
}

print(solution(5,  ["a", "b", "c", "a"]))
