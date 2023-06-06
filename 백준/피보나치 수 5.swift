//
//  피보나치 수 5.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/06.
//

let input: Int = Int(readLine()!)! //10

if input < 2 {
    print(input)
} else {
    var array: [Int] = Array(repeating: 0, count: input+1) //index 0~10까지
    array[1] = 1 //[0, 1, 0, 0,....]
    
    for i in 2...input {
        array[i] = array[i-2] + array[i-1]
    }
    
    print(array[input])
}
