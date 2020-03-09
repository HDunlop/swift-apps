//
//  DivisionTests.swift
//  AbsenceRecorderTests
//
//  Created by ManLikeMe on 09/03/2020.
//  Copyright © 2020 Hugo Dunlop. All rights reserved.
//

import XCTest

class DivisionTests: XCTestCase {
    
    func testGetAbsenceWithCurrentDateRetrievesExistingAbsenceOnSameDay() {
        //arrange
        let division = Division(code: "TestDiv", teacher: "TestTeacher")
        let absence = Absence(date: Date())
        division.absences.append(absence)
        let dateLaterToday = Date(timeIntervalSinceNow: 100)
        //act
        let actual = division.getAbsence(for: dateLaterToday)
        //assert
        XCTAssertNotNil(actual)
    }
}
