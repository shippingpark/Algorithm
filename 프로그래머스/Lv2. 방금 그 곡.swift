//
//  Lv2. 방금 그 곡.swift
//  Algorithm
//
//  Created by 박혜운 on 2023/06/26.
//

import Foundation

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var musicinfos = musicinfos
    var result = ""
    var maxPlayTime = Int.min
    
    var m = m.changeSharp()
    
    func realPlayMusic(playMinTime: Int, music: String) -> String {
        var str:String = ""
        if playMinTime % music.count == 0 {
            let start = music.startIndex
            let finish = music.index(start, offsetBy: playMinTime % music.count)
            return String(repeating: music, count: playMinTime / music.count)
        } else if playMinTime > (music.count * 2) {
            let start = music.startIndex
            let finish = music.index(start, offsetBy: playMinTime % music.count)
            return String(repeating: music, count: playMinTime / music.count) + String(music[start...finish])
        } else if playMinTime > (music.count) {
            let start = music.startIndex
            let finish = music.index(start, offsetBy: playMinTime - music.count - 1)
            return music + String(music[start...finish])
        } else {
            let start = music.startIndex
            let finish = music.index(start, offsetBy: playMinTime - 1)
            return String(music[start...finish])
        }
    }
    
    for i in 0..<musicinfos.count {
        let musicinfo = musicinfos[i].split(separator: ",").map{ String($0) }
        let startInfo = musicinfo[0].split(separator: ":").map{ Int($0)! }
        let finishInfo = musicinfo[1].split(separator: ":").map{ Int($0)! }
        let playTime = (finishInfo[0] - startInfo[0]) * 60 + (finishInfo[1] - startInfo[1])
        
        var compareMusic = realPlayMusic(playMinTime: playTime, music: musicinfo[3].changeSharp())
        guard playTime >= m.count else { continue }

        if maxPlayTime >= playTime {
            continue
        } else if compareMusic.contains(m) {
            result = musicinfo[2]
            maxPlayTime = playTime
        }
    }
    return result == "" ? "(None)" : result
}

extension String {
    func changeSharp() -> String {
        var string = self
        string = string.replacingOccurrences(of: "C#", with: "H")
        string = string.replacingOccurrences(of: "D#", with: "I")
        string = string.replacingOccurrences(of: "F#", with: "J")
        string = string.replacingOccurrences(of: "G#", with: "K")
        string = string.replacingOccurrences(of: "A#", with: "L")
        return string
    }
}
