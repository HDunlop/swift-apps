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
    
    init(code: String) {
        self.code = code
    }
    
    func addStudent(forename: String, surname: String) {
        students.append(Student(forename: forename, surname: surname))
    }
}
