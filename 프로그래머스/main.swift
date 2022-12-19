

//콜라문제

import Foundation


//콜라 a 개 당 b 개 받을 수 있음. 현재 n 개 소유중
func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    var cola = n //현재 콜라 병 수
    var cellBottles = a //판매한 병 수
    var restBottles = 0 //남는 병 수
    var result = 0 //얻은 콜라 수
    
    while cola >= a {
        cellBottles = cola/a
        restBottles = cola%a
        result += b * cellBottles //받아 본 꽉찬 콜라
        cola = b * cellBottles + restBottles //빈 병 수
    }
    
    return result
}



print(solution(2, 1, 20))//19
print(solution(3, 1, 20))//9

