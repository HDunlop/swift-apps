//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by ManLikeMe on 29/01/2020.
//  Copyright © 2020 Hugo Dunlop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var divisions: [Division] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for division in divisions {
            print("This division is called \(division.code)")
            print("The max number of students in this division is \(division.size)")
            for student in division.students {
                print("\(student.forename) \(student.surname)")
//                born on \(student.birthDate)
            }
        }
        // iterate over every division
        // for each division, output its name and the number of students in it to the console
        // for each division, output each of its students' names
    }

    func setDivisions() {
        divisions.append(DivisionFactory.createDivision(code: "vCW-1", of: 9))
        divisions.append(DivisionFactory.createDivision(code: "pCX-1", of: 10))
    }
}
