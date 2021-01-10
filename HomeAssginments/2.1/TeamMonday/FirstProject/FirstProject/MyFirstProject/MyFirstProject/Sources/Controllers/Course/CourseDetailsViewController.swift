//
//  CourseDetailsViewController.swift
//  MyFirstProject
//
//  Created by Elena on 02.01.2021.
//

import UIKit

class CourseDetailsViewController: UIViewController {
   
   //MARK: Outlets
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var nextCourseButton: UIButton!
    @IBOutlet weak var previousCourseButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var teacherValueLabel: UILabel!
    @IBOutlet weak var groupValueLabel: UILabel!
    @IBOutlet weak var descriptionLessonLabel: UILabel!
    
    // опциональная, иначе будет требовать инит, при lazy тоже нужен инит
    var courseService: StringStudentStorageServiceProtocol!

    
   //MARK: Overrides
    override func viewDidLoad() {
       
        let firstGroup = ["Elena Temerova","Vitya Mandryk","Piter Perker","Vasya Pupkin","Vlad Yama"]
        let secondGroup = ["Karina Petlyura","Katya Shapoval","Vlad Yama","Vasya Pupkin","Brad Pitt"]
        courseService = StorageService(courses: [
            Course<String>(nameOfCourse: "Philosophy", teacher: "Olha Petrova", nameOfGroup: "First Group", students: firstGroup, description: "Philosophy is the study of general and fundamental questions, such as those about reason, existence, knowledge, values, mind, and language. Such questions are often posed as problems to be studied or resolved. The term was probably coined by Pythagoras. Philosophical methods include questioning, critical discussion, rational argument, and systematic presentation."),
            Course<String>(nameOfCourse: "Mathematics", teacher: "David Hilbert", nameOfGroup: "Second Group", students: secondGroup, description: "Mathematics includes the study of such topics as quantity (number theory), structure (algebra), space (geometry), and change (mathematical analysis). It has no generally accepted definition."),
            Course<String>(nameOfCourse: "Sociology", teacher: "Karl Marx", nameOfGroup: "First Group", students: secondGroup, description: "Sociology is the study of human behavior. Sociology refers to social behavior, society, patterns of social relationships, social interaction, and culture that surrounds everyday life. It is a social science that uses various methods of empirical investigation and critical analysis to develop a body of knowledge about social order and social change. Sociology can also be defined as the general science of society. While some sociologists conduct research that may be applied directly to social policy and welfare, others focus primarily on refining the theoretical understanding of social processes. Subject matter can range from micro-level analyses of society (i.e., of individual interaction and agency) to macro-level analyses (i.e., of systems and the social structure).")
        ])
        
        super.viewDidLoad()
        iconView.image = UIImage(named: "icon")
        //добавить смену картинки при нажатии кнопки
    }
   //MARK: Actions
    // кнопка вперед
    @IBAction func nextCourseButtonTapped(_ sender: Any) {
        
        let courseNext = courseService.nextCourse()
        titleLabel.text = courseNext.nameOfCourse
        teacherValueLabel.text = courseNext.teacher
        groupValueLabel.text = courseNext.nameOfGroup
        descriptionLessonLabel.text = courseNext.description
    }
    // кнопка назад
    @IBAction func previousCourseButtonTapped(_ sender: Any) {
        
        let courseBack = courseService.previousCourse()
        titleLabel.text = courseBack.nameOfCourse
        teacherValueLabel.text = courseBack.teacher
        groupValueLabel.text = courseBack.nameOfGroup
        descriptionLessonLabel.text = courseBack.description
        
        }
    
    
    //MARK: Custom private func
    

}
