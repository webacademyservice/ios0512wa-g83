import UIKit

// Тип автора книги - Generic
struct Book<AuthorType> {

    // Название книги не меняется
    let title: String
    // Автор книги не меняется
    let author: AuthorType

    func description() -> String {
        return "\"\(title)\" by \(author)"
    }

}

let lotr = Book(title: "Lord Of The Rings", author: " J. R. R. Tolkien")

print(lotr.description())

let martin = "George R. R. Martin"

let soifSeries = [
    Book(title: "Game of Thrones", author: martin),
    Book(title: "A Clash of Kings", author: martin),
    Book(title: "A Storm of Swords", author: martin),
    Book(title: "A Feast for Crows", author: martin),
    Book(title: "A Dance with Dragons", author: martin)
]

let bookWithAuthorReferenceNumber = Book(title: "Swifts and Us: The Life of the Bird that Sleeps in the Sky", author: 921172725259)

// Тип книги - Genric, может быть что угодно
struct Library<BookType> {

    // Книги в библиотеке могут меняться - var
    var books: [BookType]

    func description() -> String {
        var finalDescription = ""

        for eachBook in books {
            finalDescription += "\n"
            if let theBook = eachBook as? Book<String> {
                finalDescription += theBook.description()
            } else {
                finalDescription += String(describing: eachBook)
            }
        }
        return finalDescription
    }

}

var stringLibrary = Library<String>(books: [])

stringLibrary.books.append("Game of Thrones")
stringLibrary.books.append("A Clash of Kings")

print(stringLibrary)

// Все вместе

var fantasyLibrary = Library(books: soifSeries)
fantasyLibrary.books.append(lotr)


func booksByAuthor(_ search: String,  at library: Library<Book<String>>) -> [Book<String>] {

    // Closure для проверки подходит ли книга
    let filterClosure: (Book<String>) -> (Bool) = { (book) -> Bool in
        return book.author.contains(search)
    }

    // Фильтрую книги передавая
    let books = library.books.filter(filterClosure)

    return books
}

"A Clash of Kings".contains("Kings")

let martinBooks = booksByAuthor("Mar", at: fantasyLibrary)

