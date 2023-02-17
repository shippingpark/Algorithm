//
//  ㅇㅇ.swift
//  Algorithm
//
//
//LV2. 최댓값과 최솟값
//

import Foundation


// MARK: - LV2. 최댓값과 최솟값

func solution(_ s:String) -> String {
    let array:[Int] = s.components(separatedBy: " ").map{Int($0)!}
    return "\(array.min()!) \(array.max()!)"
}



