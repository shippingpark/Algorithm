//
//  예제문제.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/17.
//

import Foundation

// MARK: - 부스트캠프 8기 예제 1번

func solve1(array: [Int]) -> [Int] {
    var result:[Int] = Array(repeating: 0, count: 101)
    array.forEach{result[$0] += 1}
    return result.filter{$0>1} != [] ? result.filter{$0>1} : [-1]
}

//print(solve1(array: [1, 2, 3, 3, 3, 3, 4, 4]))
//print(solve1(array: [3, 2, 4, 4, 2, 5, 2, 5, 5]))
//print(solve1(array: [3, 5, 7, 9, 1]))


// MARK: - 부스트캠프 8기 예제 2번

func solve2(input: [String]) -> String {
    let arrayPerLine = divideOneLine(array: input)
    guard !arrayPerLine.isEmpty else {return "HALT"}
    
    return madeVisualMemory(arrayPerLine).joined(separator:",")
}

func madeVisualMemory(_ array: [[String]]) -> [String] {
    var result:[String] = []
    var lineArray = Array(repeating: ".", count: 8)
    let fullLine = Array(repeating: "#", count: 8).joined()
    
    line: for line in array {
        guard !line.isEmpty else {continue}
        var beforeBool:Bool = false
        var beforeShort:Bool = false
        var index = 0
        for type in line {
            guard type != "LONG" && type != "INT" else {
                switch type {
                case "INT": result.append(fullLine)
                case "LONG": result.append(fullLine); result.append(fullLine)
                default: break
                }
                continue line
            }
            if beforeBool {
                var dotCount = 0
                switch type {
                case "SHORT": index += 1
                case "FLOAT": index += 3
                default: break
                }
            }
            
            if beforeShort && type == "FLOAT" {
                index += 2
            }
            
            let sharpLen = memorySize(of: type)
            lineArray.replaceSubrange(index...index+sharpLen-1, with: Array(repeating: "#", count: sharpLen))
            index += sharpLen
            beforeBool = type == "BOOL"
            beforeShort = type == "SHORT"
        }
        result.append(lineArray.joined())
        lineArray = Array(repeating: ".", count: 8)
    }
    return result
}

func divideOneLine(array: [String]) -> [[String]] {
    var result:[[String]] = []
    var line:[String] = []
    var fullMemory: Int = 0
    var memory:Int = 0
    var beforeBool:Bool = false
    
    for type in array {
        guard type != "LONG" && type != "INT" else {
            if memory != 0 {
                result.append(line)
                fullMemory += 8
                line = []
                memory = 0
            }
            result.append([type])
            fullMemory += memorySize(of: type)
            if fullMemory > 128 {return []}
            continue
        }
        
        var addMemory = 0
        addMemory += memorySize(of: type)
        
        if type != "BOOL" && beforeBool {
            switch type {
            case "SHORT": addMemory += 1
            case "FLOAT": addMemory += 3
            default: break
            }
        }
        
        if memory + addMemory >= 8 {
            result.append(line)
            fullMemory += 8
            if memory + addMemory == 8 {
                memory = 0
                line.append(type)
            } else {
                memory = addMemory
            }
            
            line = []
        } else {
            memory += addMemory
            line.append(type)
        }

        beforeBool = type == "BOOL"
        if fullMemory > 128 {return []}
    }
    result.append(line)
    return result
}

func memorySize(of type: String) -> Int {
    switch type {
    case "BOOL": return 1
    case "SHORT": return 2
    case "FLOAT": return 4
    case "INT": return 8
    case "LONG": return 16
    default: return 0
    }
}
//print(solve2(input: ["INT", "INT", "BOOL", "SHORT", "LONG"]))
//print(solve2(input: ["INT", "SHORT", "FLOAT", "INT", "BOOL"]))
//print(solve2(input: ["FLOAT", "SHORT", "BOOL", "BOOL", "BOOL", "INT"]))
//print(solve2(input: ["BOOL", "LONG", "SHORT", "LONG", "BOOL", "LONG", "BOOL", "LONG", "SHORT", "LONG", "LONG"]))
