//
//  ViewController.swift
//  TamagotchiApp
//
//  Created by Dunlop, Hugo (PEPW) on 14/01/2020.
//  Copyright © 2020 Dunlop, Hugo (PEPW). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var statsLabel: UILabel!
    @IBOutlet var timeRemainingLabel: UILabel!
    @IBOutlet var feedMealOutlet: UIButton!
    @IBOutlet var beatOutlet: UIButton!
    @IBOutlet var giveMedicineOutlet: UIButton!
    @IBOutlet var playOutlet: UIButton!
    @IBOutlet var vomitOutlet: UIButton!
    @IBOutlet var feedSnackOutlet: UIButton!
    
    
    let tamagotchi = Tamagotchi(name: "Sbeve")
    var timeRemaining = 300
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateDisplay()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        timeRemainingLabel.text = "Time Remaining: \(timeRemaining)"
    }
    
    func updateDisplay() {
        statsLabel.text = tamagotchi.displayStats()
    }
    
    func disableEverything() {
        feedMealOutlet.isEnabled = false
        feedSnackOutlet.isEnabled = false
        beatOutlet.isEnabled = false
        giveMedicineOutlet.isEnabled = false
        playOutlet.isEnabled = false
    }
    
    func getSick() {
        let sick = tamagotchi.isItSick()
        if sick == true {
            vomitOutlet.isHidden = false
        }
    }
    
//    func goToBathroom() {
//
//    }
    
    @IBAction func vomitButton(_ sender: Any) {
        vomitOutlet.isHidden = true
    }
    
    @IBAction func feedSnackButton(_ sender: Any) {
        tamagotchi.eatSnack()
        updateDisplay()
    }
    
    @IBAction func feedMealButton(_ sender: Any) {
        tamagotchi.eatMeal()
        updateDisplay()
    }
    
    @IBAction func beatButton(_ sender: Any) {
        tamagotchi.train()
        updateDisplay()
    }
    
    @IBAction func giveMedicineButton(_ sender: Any) {
        tamagotchi.giveMedicine()
        updateDisplay()
    }
    
    @IBAction func playGame(_ sender: Any) {
        tamagotchi.playGame()
        updateDisplay()
    }
    
//    func checkPlayerNotDead() {
//        let dead = tamagotchi.killedYou()
//        if dead == true {
//
//        }
//    }
    
    @objc func countdown() {
        if timeRemaining > 0 {
            timeRemaining -= 1
            if timeRemaining % 10 == 0 {
                tamagotchi.addAge()
            }
            
            timeRemainingLabel.text = "Time Remaining: \(timeRemaining)"
        } else {
            timer?.invalidate()
            disableEverything()
        }
    }
}

