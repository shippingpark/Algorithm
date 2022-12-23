

//  Lv0. 2차원으로 만들기

import Foundation

func solution(_ num_list:[Int], _ n:Int) -> [[Int]] {
    var innerList:[Int] = []
    var result:[[Int]] = []
    
    for (index, i) in num_list.enumerated() {
        innerList.append(i)
        if index % n == (n-1) {
            result.append(innerList)
            innerList = []
        }
    }
    return result
}

