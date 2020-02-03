//
//  DivisionFactory.swift
//  AbsenceRecorder
//
//  Created by ManLikeMe on 29/01/2020.
//  Copyright © 2020 Hugo Dunlop. All rights reserved.
//

import Foundation

class DivisionFactory {
    
    static func createDivision(code: String, of size: Int) -> Division {
        let division = Division(code: code, size: size)
        for i in 0...(size - 1) {
            division.addStudent(forename: "Sbeve\(i)", surname: "Boomer")
        }
        return division
    }
}
