//
//  Division.swift
//  AbsenceRecorder
//
//  Created by ManLikeMe on 29/01/2020.
//  Copyright © 2020 Hugo Dunlop. All rights reserved.
//

import Foundation

class Division: Codable {
    
    let code: String
    var students: [Student] = []
    var absences: [Absence] = []
    var teacher: String
    
    init(code: String, teacher: String) {
        self.code = code
        self.teacher = teacher
    }
    
    func addStudent(forename: String, surname: String) {
        students.append(Student(forename: forename, surname: surname))
    }
    
    func getAbsence(for date: Date) -> Absence? {
        absences.first {
            let comparison = Calendar.current.compare($0.takenOn, to: date, toGranularity: .day)
            return comparison == .orderedSame
        }
    }
}
