/*
Обычные протоколы могут использоваться как тип для приведения переменных.

Дженерик протоколы не могут использоваться как тип для приведения переменных. Более того мы НЕ можем явно конеретизировать дженерик протокол - те мы НЕ можем написать что что-то будет типа GenericProtocol<String>.

 Для того, что бы использовать протокол для объявления переменной, нам надо объявить конкретный протокол где описать интерфейс с кокретными типами данных.
 */

import Foundation

protocol GenericIdetifiable {
    associatedtype IdentifierType

    var identifier: IdentifierType { get }
}

struct GenericStruct<IdentifierType>: GenericIdetifiable {
    let identifier: IdentifierType
}

protocol UUIDIdentifiable {
    var identifier: UUID { get }
}

extension GenericStruct: UUIDIdentifiable  where IdentifierType == UUID {}

// Error: GenericType cannot be ideitified
//var someString0: GenericStruct
//var someString0 = GenericStruct(identifier: "hello")

// Ok: Genric type sepcifed explicitly
let someString2: GenericStruct<String> = GenericStruct(identifier: "hello")

// Ok: GenericType will be determined implicitly by initialiser
let someString1: GenericStruct = GenericStruct(identifier: "hello")


// Error: Can't use generic protocol as a Type
//let some: GenericIdetifiable = GenericStruct(identifier: UUID())

// Error: Can't use generic protocol as a Type
// let some: GenericIdetifiable<UUID> = GenericStruct(identifier: UUID())

// Ok: UUIDIdentifiable - non-generic protocl can be used as a Type
let some: UUIDIdentifiable = GenericStruct(identifier: UUID())
