//
//  Division.swift
//  AbsenceRecorder
//
//  Created by ManLikeMe on 29/01/2020.
//  Copyright © 2020 Hugo Dunlop. All rights reserved.
//

import Foundation

class Division {
    
    let code: String
    var students: [Student] = []
    var absences: [Absence] = []
    
    init(code: String) {
        self.code = code
    }
    
    func addStudent(forename: String, surname: String) {
        students.append(Student(forename: forename, surname: surname))
    }
    
    func getAbsence(for date: Date) -> Absence? {
        absences.first {$0.takenOn == date}
        //the above line is equivalent to those below. Jesus Christ
//        for absence in absences {
//            if absence.takenOn == date {
//                return absence
//            }
//        }
//        return nil
    }
}
