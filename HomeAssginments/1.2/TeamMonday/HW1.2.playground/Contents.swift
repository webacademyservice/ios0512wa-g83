import UIKit
//// массив студентов 2 группы в строку
////тип студента Generic

protocol SomeProtocol {
    var nameOfCourse: String {get set}
    var teacher: String {get set}
}

struct Course<StudentType:Equatable>: SomeProtocol {
    var nameOfCourse: String
    var teacher: String
    let students: Array<StudentType>

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

let firstGroup = ["Elena Temerova","Vitya Mandryk","Ilya Shubovich","Vasya Pupkin","Vlad Yama"]
let secondGroup = ["Karina Petlyura","Katya Shapoval","Vlad Yama","Vasya Pupkin","Brad Pitt"]

let lesson = Course<String>(nameOfCourse: "Science", teacher: "O. V. Petrova", students: firstGroup)
lesson.findCommonStudents(studentsGroup: secondGroup)



