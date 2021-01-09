//
//  StorageService.swift
//  MyFirstProject
//
//  Created by Elena on 03.01.2021.
//

import Foundation

protocol StorageServiceProtocol {
    associatedtype StudentType:Equatable
    func nextCourse() -> Course<StudentType>
    func previousCourse() -> Course<StudentType>
}

protocol StringStudentStorageServiceProtocol {
    func nextCourse() -> Course<String>
    func previousCourse() -> Course<String>
}



class StorageService<StudentType:Equatable>: StorageServiceProtocol {
   
    
    private var courses: [Course<StudentType>]
    
    init(courses:[Course<StudentType>]) {
        self.courses = courses
    }
    
    var coursesIndex = 0
    func nextCourse() -> Course<StudentType> {
        if coursesIndex < courses.count - 1 {
            coursesIndex += 1
        } else {
                coursesIndex = courses.startIndex
            }
        
        return courses [coursesIndex]
    }
    
    func previousCourse() -> Course<StudentType> {
        if coursesIndex != 0 {
            coursesIndex -= 1
        } else {
                coursesIndex = courses.endIndex - 1
            }
        
        return courses [coursesIndex]
    }
}
    extension StorageService: StringStudentStorageServiceProtocol where StudentType == String {}



//Тест Андрея
//
//class TestClass {
//
//    private var hiddenProperty: String;
//    public var publicProperty: String;
//
//
//    init()
//    {
//        hiddenProperty = "";
//        publicProperty = "";
//    }
//
//    init(hiddenProperty: String)
//    {
//        self.hiddenProperty = hiddenProperty;
//        publicProperty = "";
//    }
//
//    func SetHiddenProperty(value: String)
//    {
//        hiddenProperty = value + " ololo";
//    }
//
//}
// Черновик Андрея
//class Ololo {
//
//
//    func A()
//    {
//        var test = TestClass()
//
//
//        test.publicProperty = "1"
//        test.SetHiddenProperty(value: "123")
//
//
//
//
////        storageService.
//
//
//    }
//
//}

//Черновик Андрея
//protocol GenericProtocol
//{
//    associatedtype T
//    func get() -> Array<T>
//}
//
//protocol SP : GenericProtocol
//{
//    func get() -> Array<String>
//}
//
//
//class GenericService<T>: SP
//{
//    private var arr: [T]
//
//    init(arr: [T])
//    {
//        self.arr = arr;
//    }
//
//    func get() -> Array<T> {
//        return arr
//    }
//}
