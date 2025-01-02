//
//  LV2. 메뉴 리뉴얼.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/22.
//

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var result: [String] = []
    var keyCourse: Set<String> = []
    for i in 0..<(orders.count-1) {
        for j in (i+1)..<orders.count {
            guard i != j else { continue }
          let a = Set(orders[i].sorted())
          let b = Set(orders[j].sorted())
          let course: Set = a.intersection(b)
                if course.count >= 2 {
                    let courseString: String = course.map{ String($0) }.sorted().joined()
                    keyCourse.insert(courseString)
                }
        }
    }
    
    func combination(word: String, pick count: Int) {
        func generateCombination(index: Int, combination: String) {
            if combination.count == count {
                keyCourse.insert(combination)
                return
            }
            
            for i in index..<word.count {
                let add = word[word.index(word.startIndex, offsetBy: i)]
                generateCombination(index: i + 1, combination: combination + String(add))
            }
        }
        generateCombination(index: 0, combination: "")
    }
    
    for key in keyCourse {
        guard key.count > 2 else { continue }
        for i in 2..<key.count {
            combination(word: key, pick: i)
        }
    }

    var courseSetCount: [String: Int] = [:]
    
    for checkCourse in keyCourse {
        other: for otherCourse in orders {
            for char in checkCourse {
                if !otherCourse.contains(char) {
                    continue other
                }
            }
            courseSetCount[checkCourse, default: 0] += 1
        }
    }
    
    for n in course {
        var checkCourse = courseSetCount.filter{ $0.key.count == n }
        guard let maxCount = checkCourse.values.max() else { continue }

        result.append(contentsOf: checkCourse.filter{ $0.value == maxCount }.keys)
    }
    return result.sorted()
}
