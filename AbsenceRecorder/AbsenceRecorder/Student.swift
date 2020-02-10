//
//  Student.swift
//  AbsenceRecorder
//
//  Created by ManLikeMe on 29/01/2020.
//  Copyright © 2020 Hugo Dunlop. All rights reserved.
//

import Foundation

class Student: Equatable {
    
    let forename: String
    let surname: String
    
    init(forename: String, surname: String) {
        self.forename = forename
        self.surname = surname
    }
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.forename == rhs.forename && lhs.surname == rhs.surname
    }
}
