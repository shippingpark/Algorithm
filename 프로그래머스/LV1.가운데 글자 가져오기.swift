

//  LV1.가운데 글자 가져오기

import Foundation

func solution(_ s:String) -> String {
    let sArray:[String] = s.map{String($0)}
    let middleIndex = s.count/2 - 1 
    
    //짝수라면
    if s.count%2 == 0 {
        return sArray[middleIndex...middleIndex+1].reduce(""){$0+$1}
    }
    
    else {
        return sArray[middleIndex+1]
    }
}


print(solution("abcde")) //"c"
print(solution("qwer")) //"we"
