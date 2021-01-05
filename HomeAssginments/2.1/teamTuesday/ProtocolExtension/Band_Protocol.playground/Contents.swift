import Foundation

//Protocol for Group
protocol GroupProtocol{
    var allpeople: String { get }
    func showAllPeople() -> String
}

//Extention for GroupProtocol
extension String: GroupProtocol {
    var allpeople: String {
        return self
    }
    
    func showAllPeople() -> String {
        return "string: \(self)"
    }
}

//Structure Band by country
struct Band <MusiciansType: GroupProtocol, AlbumsType> {
    let bandName: String
    let country: String
    var musicians: Array <MusiciansType>
    var allBandAlbums: Array <AlbumsType>
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
    Band(bandName: "The Beatles", country: "United Kingdom",musicians: ["John Lennon", "Paul McCartney", "George Harrison","Ringo Starr"], allBandAlbums: ["With the Beatles", "Beatles 65", "Help!","Magical Mystery Tour"]),
    Band(bandName: "Guns and Roses", country: "United States", musicians:["Axl Rose", "Duff McKagane", "Slash" ] , allBandAlbums:["Appetite for Destruction", "G N' R Lies", "Use Your Illusion", "The Spaghetti Incident?"]),
    Band(bandName: "Scorpions", country: "Germany", musicians:["Rudolf Schenker", "Klaus Meine", "Matthias Jabs"] , allBandAlbums:["Lonesome Crow", "In Trance", "Animal Magnetism","Blackout"]),
]


//Structure Musician in the band
struct Musician <roleType> {
    let bandName: String
    let musicianName: String
    let roleInBand: roleType
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
struct Album <albumType> {
    let bandName: String
    var albumName: String
    let albumType: albumType
    let albumDate: Int
    func albumByDate() -> String {
        return "\(bandName) have \(albumName) was recording in \(albumDate)"
    }
}

let albumList = [
    Album(bandName: "The Beatles", albumName: "With the Beatles", albumType:"rock", albumDate: 1963),
    Album(bandName: "The Beatles", albumName: "Beatles 65", albumType: "rock", albumDate: 1964),
    Album(bandName: "The Beatles", albumName: "Help!", albumType: "rock", albumDate: 1965),
    Album(bandName: "The Beatles", albumName: "Magical Mystery Tour", albumType: "rock", albumDate: 1965),
    Album(bandName: "Guns and Roses", albumName: "Appetite for Destruction", albumType: "hard rock", albumDate: 1987),
    Album(bandName: "Guns and Roses", albumName: "G N' R Lies", albumType: "hard rock", albumDate: 1988),
    Album(bandName: "Guns and Roses", albumName: "Use Your Illusion", albumType: "hard rock", albumDate: 1991),
    Album(bandName: "Guns and Roses", albumName: "The Spaghetti Incident?", albumType: "hard rock", albumDate: 1993),
    Album(bandName: "Scorpions", albumName: "Lonesome Crow", albumType: "heavy metal", albumDate: 1972),
    Album(bandName: "Scorpions", albumName: "In Trance", albumType: "heavy metal", albumDate: 1975),
    Album(bandName: "Scorpions", albumName: "Animal Magnetism", albumType: "heavy metal", albumDate: 1980),
    Album(bandName: "Scorpionss", albumName: "Blackout", albumType: "heavy metal", albumDate: 1982),
]

print(bandsList[0].bandByCountry())
print(bandsList[2].musiciansOfThisBand())
print(bandsList[1].albumsOfThisBand())
print(musicianList[0].musicianByBand())
print(albumList[0].albumByDate())
