import Foundation

//Structure Band by country

struct Band {
    let bandName: String
    let country: String
    
    // Return band by country
    func bandByCountry() -> String {
        return "\(bandName) is from \(country)"
    }
    
    // Return band musicians
    func musiciansOfThisBand() -> Array <String> {
        var musiciansOfBand = [String]()
        for musician in musicianList {
            if bandName == musician.bandName {
                musiciansOfBand.append(musician.musicianName)
            }
        }
        
        return musiciansOfBand
    }
    
    // Return band albums
    func albumsOfThisBand() -> Array <String> {
        var albumsOfBand = [String]()
        for album in albumList {
            if bandName == album.bandName {
                albumsOfBand.append(album.albumName)
            }
        }
        
        return albumsOfBand
    }
}

let bandsList = [
    Band(bandName: "The Beatles", country: "United Kingdom"),
    Band(bandName: "Guns and Roses", country: "United States"),
    Band(bandName: "Scorpions", country: "Germany"),
]

//Structure Musician in the band

struct Musician <bandNameType> {
    let bandName: bandNameType
    let musicianName: String
    let roleInBand: String
    let fromYear: Int
    let toYear: Int
    func musicianByBand() -> String {
        return "\(musicianName) are \(roleInBand) in period from \(fromYear) to \(toYear)"
    }
}

let musicianList = [
    Musician(bandName: "The Beatles", musicianName: "John Lennon", roleInBand: "vocals, guitars, keyboards, harmonica, bass", fromYear: 1960, toYear: 1970),
    Musician(bandName: "The Beatles", musicianName: "Paul McCartney", roleInBand: "vocals, bass, guitars, keyboards, drums", fromYear: 1960, toYear: 1970),
    Musician(bandName: "The Beatles", musicianName: "George Harrison", roleInBand: "guitars, vocals, sitar, keyboards, bass", fromYear: 1960, toYear: 1970),
    Musician(bandName: "The Beatles", musicianName: "Ringo Starr", roleInBand: "drums, percussion, vocals",fromYear: 1962, toYear: 1970),
    Musician(bandName: "Guns and Roses", musicianName: "Axl Rose", roleInBand: "vocals,piano",fromYear: 1983, toYear: 2020),
    Musician(bandName: "Guns and Roses", musicianName: "Duff McKagane", roleInBand: "songwriterrecord producer",fromYear: 1979, toYear: 2020),
    Musician(bandName: "Guns and Roses", musicianName: "Slash", roleInBand: "guitar" ,fromYear: 1981, toYear: 2020),
    Musician(bandName: "Scorpions", musicianName: "Rudolf Schenker", roleInBand: "guitar",fromYear: 1964, toYear: 2020),
    Musician(bandName: "Scorpions", musicianName: "Klaus Meine", roleInBand: "vocals",fromYear: 1963, toYear: 2020),
    Musician(bandName: "Scorpions", musicianName: "Matthias Jabs", roleInBand: "guitar, vocals",fromYear: 1978, toYear: 2020),
]

//Structure band albums

struct Album <bandNameType> {
    let bandName: bandNameType
    var albumName: String
    let albumDate: Int
    func albumByDate() -> String {
        return "\(bandName) have \(albumName) was recording in \(albumDate)"
    }
}

let albumList = [
    Album(bandName: "The Beatles", albumName: "With the Beatles", albumDate: 1963),
    Album(bandName: "The Beatles", albumName: "Beatles 65", albumDate: 1964),
    Album(bandName: "The Beatles", albumName: "Help!", albumDate: 1965),
    Album(bandName: "The Beatles", albumName: "Magical Mystery Tour", albumDate: 1965),
    Album(bandName: "Guns and Roses", albumName: "Appetite for Destruction", albumDate: 1987),
    Album(bandName: "Guns and Roses", albumName: "G N' R Lies ", albumDate: 1988),
    Album(bandName: "Guns and Roses", albumName: "Use Your Illusion", albumDate: 1991),
    Album(bandName: "Guns and Roses", albumName: "The Spaghetti Incident?", albumDate: 1993),
    Album(bandName: "Scorpions", albumName: "Lonesome Crow", albumDate: 1972),
    Album(bandName: "Scorpions", albumName: "In Trance", albumDate: 1975),
    Album(bandName: "Scorpions", albumName: "Animal Magnetism", albumDate: 1980),
    Album(bandName: "Scorpionss", albumName: "Blackout", albumDate: 1982),
]

print(bandsList[0].bandByCountry())
print(bandsList[2].musiciansOfThisBand())
print(bandsList[1].albumsOfThisBand())
print(musicianList[0].musicianByBand())
print(albumList[0].albumByDate())

