import UIKit
import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let person1 = [1, 2, 3, 4, 5]
    let person2 = [2, 1, 2, 3, 2, 4, 2, 5]
    let person3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    let people = [person1, person2, person3]
    
    var countCorrect:[Int] = []
    var result:[Int] = Array(repeating: 0, count: 3) //[0, 0, 0]
    
    for person in people {
        (0...answers.count-1).map { answers[$0] == person[($0%person.count)-1] ? 1 : 0}.reduce{$0 + $1}
    }

    return result
}
