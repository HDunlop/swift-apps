//
//  RealTamagotchiTests.swift
//  RealTamagotchiTests
//
//  Created by Dunlop, Hugo (PEPW) on 26/11/2019.
//  Copyright © 2019 Dunlop, Hugo (PEPW). All rights reserved.
//

import XCTest

class TamagotchiTests: XCTestCase {
    
    func testDefaultValuesOfStats() {
        let tamagotchi = Tamagotchi()
        XCTAssertEqual(tamagotchi.age, 0)
        XCTAssertEqual(tamagotchi.weight, 0)
        XCTAssertEqual(tamagotchi.discipline, 0)
        XCTAssertEqual(tamagotchi.hunger, 0)
        XCTAssertEqual(tamagotchi.happiness, 100)
        XCTAssertEqual(tamagotchi.ill, false)
        XCTAssertEqual(tamagotchi.health, 100)
        XCTAssertEqual(tamagotchi.needsAttention, false)
    }
    
    func testSetNameSetsNameToParameter() {
        let tamagotchi = Tamagotchi()
        tamagotchi.setName(name: "Sbeve")
        XCTAssertEqual(tamagotchi.getName(), "Sbeve")
    }
    
    
    

}
