//
//  main.swift
//  Algorithm
//
//  Greedy 체육복
//

import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var clothes:[Int] = Array(repeating: 1, count: n)
    var i = -1
    
    for lostStudent in lost {
        clothes[lostStudent-1] -= 1
    }
    
    for reserveStudent in reserve {
        clothes[reserveStudent-1] += 1
    }
    
    while i < n - 1 {
        i += 1
        
        guard clothes[i] == 0 else {continue}
        
        if i == 0 && clothes[1] > 1 {
            clothes[0] += 1
            clothes[1] -= 1
        }
        
        else if i == n - 1 && clothes[n - 2] > 1 {
            clothes[i] += 1
            clothes[n-2] -= 1
        }
        
        else if 1...(n - 2) ~= i {
            if clothes[i-1] > 1 {
                clothes[i] += 1
                clothes[i-1] -= 1
                
            } else if clothes[i+1] > 1 {
                clothes[i] += 1
                clothes[i+1] -= 1
            }
            
        }
    }
    
    
    return clothes.filter{$0 != 0}.count
}



print(solution(5, [2, 4], [1, 3, 5])) //[2, 0, 2, 0, 2]
