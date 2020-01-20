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
    var name: String
    var ill: Bool = false
    var health: Int = 100
    var needsAttention: Bool = false
    var isAsleep: Bool = false

    init(name: String) {
        self.name = name
    }

    func displayStats() -> String {
        return ("""
        Name: \(name)
        Age: \(age) years old
        Happiness: \(happiness)%
        Weight: \(weight)kg
        Hunger: \(hunger)%
        Health: \(health)%
        Discipline: \(discipline)%
            
        """)
    }
    
    func eat() {
        self.weight += 5
        self.hunger -= 20
        self.happiness += 20
        self.needsAttention = false
        self.health -= 10
    }

    func train() {
        self.discipline += 20
        self.happiness -= 15
    }

    func giveMedicine() {
        self.health += 20
        self.happiness -= 15
    }
    
    func playGame() {
        self.happiness += 30
        self.hunger += 20
        self.weight -= 2
        self.health += 15
    }
    
    func setAge(age: Int) {
        self.age = age
    }
    
    func notDead() -> Bool {
        if happiness == 0 {
            return true
        } else if weight == 100 {
            return true
        } else if health == 0 {
            return true
        } else {
            return false
        }
    }
    
    func killedYou() -> Bool {
}
