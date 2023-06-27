import Foundation

var genres = ["classic", "pop", "classic", "classic", "pop"]
var plays = [500, 600, 150, 800, 2500]

var dic: [Int:(String, Int)] = Dictionary(uniqueKeysWithValues: zip((0..<genres.count), zip(genres, plays)))

var genrePlaysDictionary = Dictionary(zip(genres, plays), uniquingKeysWith: { $0 + $1 })

//print(genrePlaysDictionary)



var songList:[Int : (String, Int)] = Dictionary(uniqueKeysWithValues: zip((0..<genres.count), zip(genres, plays)))
print(songList)
    
    var genresSum: [String: Int] = Dictionary(zip(genres, plays), uniquingKeysWith: { $0 + $1 })
    print(genresSum)
    
for genre in genresSum.sorted(by: { $0.value > $1.value }) {
  let genre = genre.key
  let musicList = songList.filter{ $0.value.0 == String(genre) }.sorted(by: { $0.value.1 > $1.value.1 })
}


