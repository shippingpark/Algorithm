//
//  지구 온난화.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/19.
//


typealias Position = (r: Int, c: Int)

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let R = input[0], C = input[1]

var positionX:[Position] = []
let map:[[String]] = {
    var array:[[String]] = []
    for r in 1...R {
        let read = readLine()!.map{ String($0) }
        array.append(read)
        if read.contains("X") {
            positionX.append(contentsOf: returnPosition(line: read, R: r-1))
        }
    }
    return array
}()

var resultMap:[[String]] = map
var leaveX:[Position] = []

while !positionX.isEmpty {
    let now = positionX.popLast()!
    if !canRemoveX(position: now) {
        leaveX.append(now)
    } else {
        resultMap[now.r][now.c] = "."
    }
}

let edgeR:Position = (leaveX.map{$0.r}.min()!, leaveX.map{$0.r}.max()!)
let edgeC:Position = (leaveX.map{$0.c}.min()!, leaveX.map{$0.c}.max()!)

printResult(resultMap: resultMap, edgeR: edgeR, edgeC: edgeC)

func canRemoveX(position: Position) -> Bool {
    let nr = [1, -1, 0, 0]
    let nc = [0, 0, 1, -1]
    var check = 0
    
    for i in 0..<4 {
        let nr = position.0 + nr[i]
        let nc = position.1 + nc[i]
        if nr < 0 || nc < 0 || nr >= R || nc >= C {
            check += 1
        }
        else if map[nr][nc] == "." {
            check += 1
        }
    }
    return check >= 3
}

func returnPosition(line: [String], R: Int) -> [(Int, Int)] {
    var index = 0
    var array:[(Int, Int)] = []
    for area in line {
        if area == "X" {
            array.append((R, index))
        }
        index += 1
    }
    return array
}

func printResult(resultMap: [[String]], edgeR: Position, edgeC: Position) {
    for line in resultMap[edgeR.0...edgeR.1] {
            print(line[edgeC.0...edgeC.1].joined())
    }
}
