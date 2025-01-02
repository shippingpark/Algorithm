//
//  D-Day.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/08/16.
//

import Foundation

let input = (0..<2).map{ _ in readLine()!.split(separator: " ").compactMap{ Int($0) } },
today = input[0],
campDay = input[1]

let normalYear = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
var leapYear = normalYear
leapYear[1] = 29
var result = 0

var countYearList = Array(today[0]..<campDay[0])

while !countYearList.isEmpty {
  let year = countYearList.removeLast()
  result += (isNormalYear(year: year) ? 365 : 366)
}

result -= days(date: today)
result += days(date: campDay)

result >= 365243 ? print("gg") : print("D-\(result)")

func days(date: [Int]) -> Int {
  var afterDays = 0
  for month in date[1]...12 {
    afterDays += isNormalYear(year: date[0]) ? normalYear[month-1] : leapYear[month-1]
  }
  afterDays -= date[2]
  return isNormalYear(year: date[0]) ? 365 - afterDays : 366 - afterDays
}

func isNormalYear(year: Int) -> Bool {
  if year % 400 == 0 || (year % 100 != 0 && year % 4 == 0) {
    return false
  } else {
    return true
  }
}

