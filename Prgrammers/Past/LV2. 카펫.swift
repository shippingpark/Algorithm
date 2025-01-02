//
//  File.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/02/27.
//

import Foundation

//세로 길이가 기준 (반드시 세로가 더 짧다)
//노란 색 타일 갯수 = 가로 길이 * 세로 길이
//노란 색의 세로 길이 = 1부터...
//노란 색의 가로 길이 = 전체 갯수 / 세로 길이
//노란 색의 (가로 길이 + 1) * 2 +  (세로 길이 + 1) * 2 + 4 = 갈색의 갯수
//노란 색 타일의 갯수는 1부터 시작해서 천천히 늘어나면 된다.

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    var width:Int = yellow
    var height:Int = 1
    
    while width * 2 + height * 2 + 4 != brown {
        repeat {
            height += 1
        } while yellow % height != 0
        
        width = yellow / height
    }
    return [width + 2, height + 2]
}
