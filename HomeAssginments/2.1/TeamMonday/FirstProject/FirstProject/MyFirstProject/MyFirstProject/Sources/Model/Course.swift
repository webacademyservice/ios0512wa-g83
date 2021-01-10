//
//  Course.swift
//  MyFirstProject
//
//  Created by Elena on 03.01.2021.
//

import Foundation


protocol SomeProtocol {
    var nameOfCourse: String {get set}
    var teacher: String {get set}
}

struct Course<StudentType:Equatable>: SomeProtocol {
    var nameOfCourse: String
    var teacher: String
    var nameOfGroup: String
    let students: Array<StudentType>
    var description: String

}
// ввела функцию как расширение структуры Курса
extension Course {
    func findCommonStudents(studentsGroup:Array<StudentType>) -> Array<StudentType> {
        var  compareStud = Array<StudentType>()
        for i in 0...studentsGroup.count - 1 {
            for n in 0...students.count - 1 {
                if studentsGroup[i] == students[n] {
                    compareStud.append(students[n])
                }
            }
        }
        print(compareStud)
        return compareStud
    }
}


