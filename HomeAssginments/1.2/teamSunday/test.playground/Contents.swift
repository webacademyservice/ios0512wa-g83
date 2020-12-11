// Структура Театров
struct Theatre <TheatresType> {
    var theatresType:TheatresType
    let city: String
    let stockTickets: Int
  }
  //Театры
  let firstTheatre = Theatre(theatresType: "Lvivskii Theatre", city: "Lviv", stockTickets: 349)
  let secondTheatre = Theatre(theatresType: "Thetre on Podil", city: "Kiev", stockTickets: 400)
  struct Afisha<AfishaType>{
    let theatres: AfishaType
    let actorName: String
    let titleInSpectacle: String
    let dateInSpectacle: String
    func showAfisha() {
      print("Сейчас Aктуально: \nТеатр: \(theatres) \nАктер: \(actorName) \nШоу: \(titleInSpectacle) \nДата: \(dateInSpectacle)")
    }
  }
let firstAfisha = Afisha(
      theatres: ("\(firstTheatre.theatresType), \(firstTheatre.city) \nКоличество Билетов: \(firstTheatre.stockTickets)"),
      actorName: "Nurlan Saburov",
      titleInSpectacle: "StendUp Show",
      dateInSpectacle: "20.12.2020")
    firstAfisha.showAfisha()
    let secondAfisha = Afisha (
      theatres: ("\(secondTheatre.theatresType), \(secondTheatre.city) \nКоличество Билетов: \(secondTheatre.stockTickets)"),
      actorName: "Philip Kirkorov",
      titleInSpectacle: "Best of the Best",
      dateInSpectacle: "30.12.2020")
    secondAfisha.showAfisha()
