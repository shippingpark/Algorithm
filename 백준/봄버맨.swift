//
//  봄버맨.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/05/08.
//

import Foundation

// MARK: - 통과

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let R = input[0]
let C = input[1]
let N = input[2]

let full = Array(repeating: Array(repeating: "O", count: C), count: R)
let empty = Array(repeating: Array(repeating: ".", count: C), count: R)
var map = empty

for r in 0..<R {
    let line = readLine()!.map{String($0)}
    map[r] = line
} //문제에서 준 폭탄 설치

let nx = [-1, 1, 0, 0]
let ny = [0, 0, -1, 1]

func exploreBoom(폭탄상황:[[String]]) -> [[String]] { //현재 폭탄 터트리기
    var array = full
    
    for r in 0..<R {
        for c in 0..<C {
            if 폭탄상황[r][c] == "O" {
                array[r][c] = "."
                for i in 0..<4 {
                    let nr = r + nx[i]
                    let nc = c + ny[i]
                    guard nr >= 0 && nc >= 0 && nr < R && nc < C else {continue}
                    array[nr][nc] = "."
                }
            }
        }
    }
    return array
}

func printResult(map: [[String]]) {
    for line in map {
        print(line.joined())
    }
}

func solution(){
    guard N != 0 && N != 1 else {return printResult(map: map)}
    
    let firstMap = exploreBoom(폭탄상황: map)
    let secondMap = exploreBoom(폭탄상황: firstMap)
    let num = N % 4

    switch num {
    case 1: printResult(map: secondMap)
    case 3: printResult(map: firstMap)
    default: printResult(map: full)
    }
}

solution()
