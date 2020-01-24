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
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var shit1Outlet: UIButton!
    @IBOutlet var shit2Outlet: UIButton!
    @IBOutlet var vomitOutlet: UIButton!
    
    
    let tamagotchi = Tamagotchi(name: "Sbeve")
    var timer: Timer?
    var dead = false
    var time = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateDisplay()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
    }
    
    func updateDisplay() {
        statsLabel.text = tamagotchi.displayStats()
    }
    
    
    
    @IBAction func feedButton(_ sender: Any) {
        tamagotchi.eat()
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
    
//    func checkNotDead() {
//
//    }
    
    @objc func countdown() {
        dead = tamagotchi.notDead()
        if dead == false {
            time += 1
            if time % 30 == 0 {
                tamagotchi.incrementAge()
            }
            if time % 5 == 0 {
                tamagotchi.decrementHappiness()
            }
            if time % 3 == 0 {
                tamagotchi.decrementHunger()
            }
            updateDisplay()
        } else {
            timer?.invalidate()
            
        }
    }
}

