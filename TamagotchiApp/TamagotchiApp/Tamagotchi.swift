//
//  Tamagotchi.swift
//  TamagotchiApp
//
//  Created by Dunlop, Hugo (PEPW) on 14/01/2020.
//  Copyright © 2020 Dunlop, Hugo (PEPW). All rights reserved.
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

    func displayStats() -> String {
        return """
        Name: \(name)
        Age: \(age) years old
        Happiness: \(happiness)
        Weight: \(weight)
        
        """
    }

    func eat() {
        weight += 5
        hunger -= 20
        happiness += 20
        needsAttention = false
        health -= 10
        print("The new values are weight, hunger, happiness and attention")
    }

    func train() {
        discipline += 20
        happiness -= 15
        print("The new stats are discipline and happiness")
    }

    func giveMedicine() {
        health += 20
        happiness -= 15
        print("The new stats are health and happiness")
    }
}
