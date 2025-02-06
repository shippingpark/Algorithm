//
//  main.swift
//  문자열 압축
//
//  Created by 박혜운 on 2/6/25.
//

import Foundation

func solution(_ s:String) -> Int {
  let arr = Array(s)
  var gap = 1
  var maxLength = s.count
  
  while gap <= s.count/2 {
    var repeatCount: Int = 1
    var length = s.count
    var (prevIndex, currentIndex) = (0, gap)
    var prevWord: ArraySlice<Character> = arr[prevIndex..<currentIndex]
    
    while currentIndex+gap <= s.count {
      let currentWord = arr[currentIndex..<currentIndex+gap]
      if prevWord == currentWord {
        length -= gap
        repeatCount += 1
      } else {
        prevWord = currentWord
        length += repeatCount == 1 ? 0 : String(repeatCount).count
        repeatCount = 1
      }
      prevIndex = currentIndex
      currentIndex += gap
    }
    
    length += repeatCount == 1 ? 0 : String(repeatCount).count
    maxLength = min(maxLength, length)
    gap += 1
  }
  
  return maxLength
}
