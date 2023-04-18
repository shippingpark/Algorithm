//
//  다리를 지나는 트럭 .swift
//  Algorithm
//
//  Created by 박혜운 on 2023/04/18.
//

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var wait:[Int] = truck_weights.reversed() //stack
    var bridge = Array(repeating: 0, count: bridge_length)
    var bridgeWeight = 0
    var time = 0
    
    while !wait.isEmpty {
        
        if bridgeWeight - bridge.first! + wait.last! <= weight {
            let new = wait.popLast()!
            bridgeWeight -= bridge.remove(at: 0)
            bridgeWeight += new
            bridge.append(new)
        } else {
            bridgeWeight -= bridge.remove(at: 0)
            bridge.append(0)
        }
        time += 1
    }
    
    return time + bridge_length
}

//print(solution(2, 10, [7,4,5,6])) //8
//print(solution(100, 100, [10,10,10,10,10,10,10,10,10,10])) //110
