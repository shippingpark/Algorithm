//
//  옹알이 (!).swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/12.
//

func solution(_ babbling:[String]) -> Int {
    var count = babbling.count
    
    for word in babbling {
        var word = word
        while word != "" {
            if word.prefix(2) == "ye" || word.prefix(2) == "ma" {
                word.removeFirst(2)
            } else if word.prefix(3) == "aya" || word.prefix(3) == "woo" {
                word.removeFirst(3)
            } else {
                print(word)
                count -= 1
                break
            }
        }
    }
    return count
}
