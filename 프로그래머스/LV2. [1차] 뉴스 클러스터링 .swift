//
//  LV2. [1차] 뉴스 클러스터링.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/03/22.
//

import Foundation


func solution(_ str1:String, _ str2:String) -> Int {
    let arr1 = Array(str1)
    let arr2 = Array(str2)
    
    let arr11: [String] = {
        var set:[String] = []
        for i in 0..<(arr1.count-1) {
            guard arr1[i].isLetter else {continue}
            guard arr1[i+1].isLetter else {continue}
            set.append(arr1[i...(i+1)].map{$0.uppercased()}.joined())
        }
        return set
    }()
    
    let arr22: [String] = {
        var set:[String] = []
        for i in 0..<(arr2.count-1) {
            guard arr2[i].isLetter else {continue}
            guard arr2[i+1].isLetter else {continue}
            set.append(arr2[i...(i+1)].map{$0.uppercased()}.joined())
        }
        return set
    }()
    
    let 교:Int = {
        var same:Int = 0
        var arr:[String] = []
        
        if arr11.count <= arr22.count {
            arr = arr11
            for word in arr22 {
                if arr.contains(word) {
                    same += 1
                    arr.remove(at: arr.firstIndex(of: word)!)
                }
            }
        } else {
            arr = arr22
            for word in arr11 {
                if arr.contains(word) {
                    same += 1
                    arr.remove(at: arr.firstIndex(of: word)!)
                }
            }
        }
       return same
    }()
    
    let 합:Int = arr11.count + arr22.count - 교
    
    return 합 > 0 ? Int(Double(교) / Double(합) * 65536.0) : 65536
}

//print(solution("E=M*C^2", "e=m*c^2")) //65536

