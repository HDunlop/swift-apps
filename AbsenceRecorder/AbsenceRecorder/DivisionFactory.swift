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
        let division = Division(code: code)
        for i in 0 ..< size {
            division.addStudent(forename: "Sbeve\(i)", surname: "Boomer\(i)")
        }
        return division
    }
}
