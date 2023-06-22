import Foundation


func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var courseSetCount: [String: Int] = [:]
    for i in 0..<orders.count {
        for j in 0..<orders.count {
            guard i != j else { continue }
          let a = Set(orders[i])
          let b = Set(orders[j])
          let course: Set = a.intersection(b)
                if course.count >= 2 {
                    let courseString: String = course.map{ String($0) }.joined()
                    courseSetCount[courseString, default: 0] += 1
                }
        }
    }
    return []
}
