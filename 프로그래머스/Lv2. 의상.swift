//
//  Lv2. 의상.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/16.
//

func solution(_ clothes:[[String]]) -> Int {
    var types: [String] = clothes.map { $0.last! }
    var typeSet: Set<String> = Set( types )
    var category: [String] = Array(typeSet)
    
    let count: [Int] = category.map{ type in
        return (clothes.filter{ $0.last! == type }.count + 1)
    }
    
    return count.reduce(1) { $0 * $1 } - 1
}

