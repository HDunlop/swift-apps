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
    
    
    let tamagotchi = Tamagotchi(name: "Sbeve")
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateDisplay()
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
    
    func checkNotDead() {
        
    }
}

