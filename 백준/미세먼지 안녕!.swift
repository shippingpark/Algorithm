//
//  공기 청정기.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/19.
//

// MARK: - Properties

let input = readLine()!.split(separator: " ").map{ Int($0)! }

let R = input[0]
let C = input[1]
let T = input[2]
var roadMap: [[Int]] = []
var airHeadR = 0
var totalDust = 0 // 결과값

for r in 0..<R {
  let line: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }
  totalDust += line.reduce(0, +)
  if line.first == -1 {
    airHeadR = r
    totalDust += 1
  }
  roadMap.append(line)
}
airHeadR -= 1 // 바텀 위치에서 헤더 위치로

func diffusion(roadMap: [[Int]]) -> [[Int]] { //1초 경과 후 확산된 미세먼지 분포 반환
  var diffusionMap: [[Int]] = roadMap
  let directionR:[Int] = [-1, 1, 0, 0]
  let directionC:[Int] = [0, 0, -1, 1]
  for r in 0..<R {
    for c in 0..<C {
      guard roadMap[r][c] != -1 else { continue } //공기 청정기는 확산 당하지 않음
      diffusionMap[r][c] -= (roadMap[r][c] / 5) * canMoveDirectionCount(roadMap: roadMap, r: r, c: c)
      for i in 0..<4 { //영향을 미칠 수 있는 공간
        let nr = r + directionR[i]
        let nc = c + directionC[i]
        
        guard nr >= 0 && nr < R && nc >= 0 && nc < C else { continue }
        guard roadMap[nr][nc] != 0 else { continue }
        
        diffusionMap[r][c] += roadMap[nr][nc] / 5 //확산된 미세먼지
      }
    }
  }
  
  return diffusionMap
}




func canMoveDirectionCount(roadMap: [[Int]], r: Int, c: Int) -> Int {
  var count = 0 //최대 4
  let directionR:[Int] = [-1, 1, 0, 0]
  let directionC:[Int] = [0, 0, -1, 1]
  
  for i in 0..<4 {
    let nr = r + directionR[i]
    let nc = c + directionC[i]
    guard nr >= 0 && nr < R && nc >= 0 && nc < C else { continue }
    guard roadMap[nr][nc] != -1 else { continue }
    count += 1
  }
  return count
}

func airCleaner(diffusionMap: [[Int]]) -> [[Int]] {
  var airMap: [[Int]] = diffusionMap
  totalDust -= diffusionMap[airHeadR-1][0]
  totalDust -= diffusionMap[airHeadR+2][0]
  
  //반시계방향
  
  for nc in ((0+1)...C).reversed() {
    airMap[airHeadR][nc] = diffusionMap[airHeadR][nc-1]
  }
  
  for nr in ((0+1)...airHeadR).reversed() {
    airMap[nr][C-1] = diffusionMap[nr+1][C-1]
  }
  
  for nc in (0..<C-1) {
    airMap[0][nc] = diffusionMap[0][nc+1]
  }
  
  for nr in (1..<airHeadR).reversed() {
    airMap[nr][0] = diffusionMap[nr-1][0]
  }
  
  airMap[airHeadR][1] = 0
  
  //시계방향
  
  for nc in ((0+1)...C).reversed() {
    airMap[airHeadR][nc] = diffusionMap[airHeadR][nc-1]
  }
  
  for nr in (airHeadR+1...(R-1)).reversed() {
    airMap[nr][C-1] = diffusionMap[nr+1][C-1]
  }
  
  for nc in (0..<C-1) {
    airMap[R-1][nc] = diffusionMap[R-1][nc+1]
  }
  
  for nr in (airHeadR+2...(R-1)) {
    airMap[nr][0] = diffusionMap[nr-1][0]
  }
  
  airMap[airHeadR+1][1] = 0
  
  return airMap
}

for _ in 0..<T {
  let diffusionMap = diffusion(roadMap: roadMap)
  roadMap = airCleaner(diffusionMap: diffusionMap)
}
  
print(totalDust)


//let input = readLine()!.split(separator: " ").map{ Int($0)! }
//
//let R = input[0]
//let C = input[1]
//let T = input[2]
//var roadMap: [[Int]] = []
//var airHeadR = 0
//var totalDust = 0 // 결과값
//
//for r in 0..<R {
//  let line: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }
//  totalDust += line.reduce(0, +)
//  if line.first == -1 {
//    airHeadR = r
//    totalDust += 1
//  }
//  roadMap.append(line)
//}
//airHeadR -= 1 // 바텀 위치에서 헤더 위치로
//
//func diffusion(roadMap: [[Int]]) -> [[Int]] { //1초 경과 후 확산된 미세먼지 분포 반환
//  var diffusionMap: [[Int]] = roadMap
//  let directionR:[Int] = [-1, 1, 0, 0]
//  let directionC:[Int] = [0, 0, -1, 1]
//  for r in 0..<R {
//    for c in 0..<C {
//      guard roadMap[r][c] != -1 else { continue } //공기 청정기는 확산 당하지 않음
//      diffusionMap[r][c] -= (roadMap[r][c] / 5) * canMoveDirectionCount(roadMap: roadMap, r: r, c: c)
//      for i in 0..<4 { //영향을 미칠 수 있는 공간
//        let nr = r + directionR[i]
//        let nc = c + directionC[i]
//        
//        guard nr >= 0 && nr < R && nc >= 0 && nc < C else { continue }
//        guard roadMap[nr][nc] != 0 else { continue }
//        
//        diffusionMap[r][c] += roadMap[nr][nc] / 5 //확산된 미세먼지
//      }
//    }
//  }
//  
//  return diffusionMap
//}
//
//
//
//
//func canMoveDirectionCount(roadMap: [[Int]], r: Int, c: Int) -> Int {
//  var count = 0 //최대 4
//  let directionR:[Int] = [-1, 1, 0, 0]
//  let directionC:[Int] = [0, 0, -1, 1]
//  
//  for i in 0..<4 {
//    let nr = r + directionR[i]
//    let nc = c + directionC[i]
//    guard nr >= 0 && nr < R && nc >= 0 && nc < C else { continue }
//    guard roadMap[nr][nc] != -1 else { continue }
//    count += 1
//  }
//  return count
//}
//
//func airCleaner(diffusionMap: [[Int]]) -> [[Int]] {
//  var airMap: [[Int]] = diffusionMap
//  totalDust -= diffusionMap[airHeadR-1][0]
//  totalDust -= diffusionMap[airHeadR+2][0]
//  
//  let R = R-1
//  let C = C-1
//  let bottom = airHeadR + 1
//  
//  //반시계방향
//  for nc in (2...C).reversed() {
//    airMap[airHeadR][nc] = diffusionMap[airHeadR][nc-1]
//  }
//  
//  for nr in (0..<airHeadR) {
//    airMap[nr][C] = diffusionMap[nr+1][C]
//  }
//  
//  for nc in (0..<C) {
//    airMap[0][nc] = diffusionMap[0][nc+1]
//  }
//  
//  for nr in (1..<airHeadR).reversed() {
//    airMap[nr][0] = diffusionMap[nr-1][0]
//  }
//  
//  airMap[airHeadR][1] = 0
//  
//  //시계방향
//  
//  for nc in (2...C).reversed() {
//    airMap[airHeadR][nc] = diffusionMap[airHeadR][nc-1]
//  }
//  
//  for nr in ((bottom+1)...R).reversed() {
//    airMap[nr][C] = diffusionMap[nr-1][C]
//  }
//  
//  for nc in (0..<C) {
//    airMap[R][nc] = diffusionMap[R][nc+1]
//  }
//  
//  for nr in (bottom+1...R-1) {
//    airMap[nr][0] = diffusionMap[nr+1][0]
//  }
//  
//  airMap[bottom][1] = 0
//  print("-------")
//  for line in airMap {
//    print(line)
//  }
//  
//  return airMap
//}
//
//for _ in 0..<T {
//  let diffusionMap = diffusion(roadMap: roadMap)
//  roadMap = airCleaner(diffusionMap: diffusionMap)
//}
//  
//print(totalDust)
