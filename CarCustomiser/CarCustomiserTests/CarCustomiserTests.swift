//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by ManLikeMe on 12/01/2020.
//  Copyright © 2020 Hugo Dunlop. All rights reserved.
//

import XCTest
@testable import CarCustomiser
 
class CarCustomiserTests: XCTestCase {

    func TestFunctionDisplayStatsReturnsCorrectValues() {
        let car = Car(make: "Nokia", model: "11 Pro Max", topSpeed: 150, acceleration: 12.4, handling: 69)
        let expected = """
            Make: Nokia
            Model: 11 Pro Max
            Top Speed: 150 mph
            Acceleration (0-60 in): 12.4s
            Handling: 69
        """
        let actual = car.displayStats()
        XCTAssertEqual(actual, expected)
    }

}
