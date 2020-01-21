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
    var discipline: Int = 50
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
    
    func doMaths(control: Int, operand: String, value: Int) -> Int {
        if operand == "+" {
            if control + value > 100 {
                return 100
            } else {
                return (control + value)
            }
        } else {
            if control - value < 0 {
                return 0
            } else {
                return (control - value)
            }
        }
    }
    
    func eatMeal() {
        self.weight += 3
        self.hunger = doMaths(control: self.hunger, operand: "-", value: 10)
        self.happiness = doMaths(control: self.happiness, operand: "+", value: 10)
        self.needsAttention = false
        self.health = doMaths(control: self.health, operand: "-", value: 5)
    }
    
    func eatSnack() {
        self.weight += 1
        self.hunger = doMaths(control: self.hunger, operand: "-", value: 5)
        self.happiness = doMaths(control: self.happiness, operand: "+", value: 6)
        self.needsAttention = false
        self.health = doMaths(control: self.health, operand: "-", value: 5)
    }
    
    func train() {
        self.discipline = doMaths(control: self.discipline, operand: "+", value: 20)
        self.happiness = doMaths(control: self.happiness, operand: "-", value: 15)
    }
    
    func giveMedicine() {
        self.health = doMaths(control: self.health, operand: "+", value: 20)
        self.happiness = doMaths(control: self.happiness, operand: "-", value: 15)
    }
    
    func playGame() {
        self.happiness = doMaths(control: self.happiness, operand: "+", value: 30)
        self.hunger = doMaths(control: self.hunger, operand: "+", value: 20)
        if self.weight - 2 < 0 {
            self.weight = 0
        } else {
            self.weight -= 2
        }
        self.needsAttention = false
        self.health = doMaths(control: self.health, operand: "+", value: 15)
        self.discipline = doMaths(control: self.discipline, operand: "-", value: 15)
    }
    
    func addAge() {
        self.age += 1
    }
    
    func notDead() -> Bool {
        if happiness == 0 {
            return true
        } else if (weight == 100) || (weight == 0) {
            return true
        } else if health == 0 {
            return true
        } else {
            return false
        }
    }
    
    func killedYou() -> Bool {
        if discipline == 0 {
            return true
        } else {
            return false
        }
    }
    
    func isItSick() -> Bool {
        if health == 30 {
            return true
        } else {
            return false
        }
    }
}
