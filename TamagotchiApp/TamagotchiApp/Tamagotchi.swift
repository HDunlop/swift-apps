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
    var weight: Int = 5
    var discipline: Int = 50
    var hunger: Int = 0
    var happiness: Int = 100
    var name: String
    var health: Int = 100

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
        self.health = doMaths(control: self.health, operand: "-", value: 5)
    }
    
    func eatSnack() {
        self.weight += 1
        self.hunger = doMaths(control: self.hunger, operand: "-", value: 5)
        self.happiness = doMaths(control: self.happiness, operand: "+", value: 6)
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
        self.health = doMaths(control: self.health, operand: "+", value: 15)
        self.discipline = doMaths(control: self.discipline, operand: "-", value: 15)
    }
    
    func incrementAge() {
        self.age += 1
    }
    
    func decrementHappiness() {
        self.happiness = doMaths(control: self.happiness, operand: "-", value: 5)
        self.health = doMaths(control: self.health, operand: "+", value: 15)
        self.discipline = doMaths(control: self.discipline, operand: "-", value: 15)
    }
    
    func addAge() {
        self.age += 1
    }
    
    func decrementHunger() {
        self.hunger = doMaths(control: self.hunger, operand: "+", value: 10)
    }
    
    func decrementWeight() {
        if self.weight - 6 < 0 {
            self.weight = 0
        } else {
            self.weight -= 6
        }
    }
    
    func notDead() -> [String] {
        if happiness == 0 {
            return ["y", "Happiness", "Your alien orphan killed itself because it was so sad"]
        } else if weight == 0 {
            return ["y", "Weight", "You starved your off-planet scum"]
        } else if weight >= 50 {
            return ["y", "Weight", "The pitiful child was overfed to the point of death"]
        } else if health == 0 {
            return ["y", "Health", "Died of health reasons as a result of neglect"]
        } else {
            return ["n"]
        }
    }
    
    func isItSick() -> Bool {
        if health == 15 {
            return true
        } else {
            return false
        }
    }
    
    func pooValue() -> Int {
        if discipline <= 20 {
            return 2
        } else if discipline <= 40 {
            return 1
        } else {
            return 0
        }
    }
    
}
