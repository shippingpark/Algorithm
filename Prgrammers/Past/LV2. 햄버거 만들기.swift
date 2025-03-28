//
//  main.swift
//  Algorithm
//
//  Lv1. 햄버거 만들기
//

import Foundation

func solution(_ ingredient:[Int]) -> Int {
    var stacks: [Int] = []
    var count: Int = 0
    for ingredient in ingredient {
        stacks.append(ingredient)
        let suffix = stacks.suffix(4)
        if suffix == [1,2,3,1] {
            count += 1
            stacks.removeLast(4)
        }
    }
    return count
}


func solution(_ ingredient:[Int]) -> Int {
    var stack: [Int] = []
    var result: Int = 0
    
    for 재료 in ingredient {
        stack.append(재료)
        let pattern = stack.suffix(4)
        if pattern == [1, 2, 3, 4] {
            result += 1
            stack.removeLast(4)
        }
    }
    
    return result
    
}

//func solution(_ ingredient:[Int]) -> Int {
//    var string:String = ingredient.map{String($0)}.joined()
//    var beforeCount:Int = -1
//    var afterCount:Int = -2
//
//    while beforeCount != afterCount {
//        beforeCount = string.count
//        string = string.components(separatedBy: "1231").joined()
//        afterCount = string.count
//    }
//
//    return (ingredient.count - string.count) / 4
//}
//
//print(solution([2, 1, 1, 2, 3, 1, 2, 3, 1]))
//
//
//func solution(_ ingredient:[Int]) -> Int {
//    var ingredient:[Int] = ingredient
//    var checkNum:Int = 0
//    var checkLastIndex:Int = -1
//    var result:Int = 0
//    var beforeIngredient:[Int] = []
//
//    while beforeIngredient != ingredient {
//        beforeIngredient = ingredient
//        if ingredient
//        for (index, ingred) in ingredient.enumerated() {
//            if ingred == checkNum + 1 {
//                checkNum += 1
//                guard checkNum != 3 else {checkLastIndex = index - 3 ; result += 1 ; break}
//            } else {
//                checkNum = 0
//            }
//        }
//        if checkLastIndex != -1 {
//            ingredient[checkLastIndex-3...checkLastIndex] = []
//            checkLastIndex = -1
//        }
//    }
//
//    return result
//}




//print(solution([2, 1, 1, 2, 3, 1, 2, 3, 1]))//2
//print(solution([1, 3, 2, 1, 2, 1, 3, 1, 2]))//0
print(solution([1, 1, 1, 2, 3, 1, 2, 3, 1, 2, 3, 1]))
