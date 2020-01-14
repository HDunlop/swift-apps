//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by Dunlop, Hugo (PEPW) on 26/11/2019.
//  Copyright © 2019 Dunlop, Hugo (PEPW). All rights reserved.
//

import Foundation

class Tamagotchi {
    
    var age: Int = 0
    var weight: Int = 0
    var discipline: Int = 0
    var hunger: Int = 0
    var happiness: Int = 100
    var name: String = ""
    var ill: Bool = false
    var health: Int = 100
    var needsAttention: Bool = false
    var isAsleep: Bool = false
    
    func setName(name: String) {
        self.name = name
    }
    
    func getName() -> String {
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
            asleep: \(isAsleep)
            """)
    }
    
    func eat() {
        weight += 5
        hunger -= 20
        happiness += 20
        needsAttention = false
        health -= 10
        print("The new values are weight, hunger, happiness and attention")
        printStats()
    }
    
    func train() {
        discipline += 20
        happiness -= 15
        print("The new stats are discipline and happiness")
        printStats()
    }
    
    func giveMedicine() {
        health += 20
        happiness -= 15
        print("The new stats are health and happiness")
        printStats()
    }
    
    func playGame() {
        for _ in 0..<5 {
            let _ = Int.random(in: 0...1)
            print("""
            Which way will the tamagotchi turn?
            1. Right
            2. Left
""")
        }
    }
    
}
