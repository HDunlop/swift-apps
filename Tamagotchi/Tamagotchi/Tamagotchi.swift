//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by Dunlop, Hugo (PEPW) on 26/11/2019.
//  Copyright © 2019 Dunlop, Hugo (PEPW). All rights reserved.
//

import Foundation

class Tamagotchi {
    
    private var age: Int = 0
    private var weight: Int = 0
    private var discipline: Int = 0
    private var hunger: Int = 0
    private var happiness: Int = 100
    private var name: String = ""
    private var ill: Bool = false
    private var health: Int = 100
    private var needsAttention: Bool = false
    
    func setName(name: String) {
        self.name = name
    }
    
    func getName() {
        return self.name
    }
    
    func printStats() {
        print("""
            <*----------- STATS -----------*>
            name: \(name)
            age: \(age) years old
            weight: \(weight) kg
            health: \(health) %
            discipline: \(discipline) %
            hunger: \(hunger) %
            happiness: \(happiness) %
            sickness: \(ill)
            need attention: \(needsAttention)
            """)
    }
    
    
    
}
