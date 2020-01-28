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
    @IBOutlet var mealOutlet: UIButton!
    @IBOutlet var snackOutlet: UIButton!
    @IBOutlet var beatOutlet: UIButton!
    @IBOutlet var medicineOutlet: UIButton!
    @IBOutlet var gameOutlet: UIButton!
    
    var tamagotchi : Tamagotchi? = Tamagotchi(name: "Sbeve")
    var timer: Timer?
    var dead: [String] = []
    var time = 0
    var sick = false
    var bathroom = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateDisplay()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        timeLabel.text = "Time survived: \(time)"
        shit1Outlet.isHidden = true
        shit2Outlet.isHidden = true
        vomitOutlet.isHidden = true
    }
    
    func updateDisplay() {
        statsLabel.text = tamagotchi?.displayStats()
        timeLabel.text = "Time survived: \(time)"
    }
    
    func deathMessage(dead: [String]) {
        let alertController = UIAlertController(title: "\(dead[1])", message: "\(dead[2])", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
            NSLog("OK Pressed")
            self.mealOutlet.isEnabled = false
            self.snackOutlet.isEnabled = false
            self.beatOutlet.isEnabled = false
            self.medicineOutlet.isEnabled = false
            self.gameOutlet.isEnabled = false
        }
        let cancelAction = UIAlertAction(title: "Reset", style: UIAlertAction.Style.cancel) {
            UIAlertAction in
            NSLog("Reset Pressed")
            self.time = 0
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.countdown), userInfo: nil, repeats: true)
            self.tamagotchi = Tamagotchi(name: "Sbeve")
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func feedButton(_ sender: Any) {
        tamagotchi?.eatMeal()
        updateDisplay()
    }
    
    @IBAction func feedSnackButton(_ sender: Any) {
        tamagotchi?.eatSnack()
        updateDisplay()
    }
    
    @IBAction func beatButton(_ sender: Any) {
        tamagotchi?.train()
        updateDisplay()
    }
    
    @IBAction func giveMedicineButton(_ sender: Any) {
        tamagotchi?.giveMedicine()
        updateDisplay()
    }
    
    @IBAction func playGame(_ sender: Any) {
        tamagotchi?.playGame()
        updateDisplay()
    }
    
    @IBAction func shit1Button(_ sender: Any) {
        shit1Outlet.isHidden = true
    }
    
    @IBAction func shit2Button(_ sender: Any) {
        shit2Outlet.isHidden = true
    }
    
    @IBAction func vomitButton(_ sender: Any) {
        vomitOutlet.isHidden = true
    }
    
    @objc func countdown() {
        dead = (tamagotchi?.notDead())!
        if dead[0] == "n" {
            time += 1
            if time % 30 == 0 {
                tamagotchi?.incrementAge()
            }
            if time % 7 == 0 {
                tamagotchi?.decrementWeight()
            }
            if time % 5 == 0 {
                tamagotchi?.decrementHappiness()
            }
            if time % 3 == 0 {
                tamagotchi?.decrementHunger()
            }
            sick = (tamagotchi?.isItSick())!
            if sick == true {
                vomitOutlet.isHidden = false
            }
            bathroom = (tamagotchi?.pooValue())!
            if bathroom == 2 {
                shit1Outlet.isHidden = false
                shit2Outlet.isHidden = false
            } else if bathroom == 1 {
                shit1Outlet.isHidden = false
            }
            updateDisplay()
        } else {
            timer?.invalidate()
            deathMessage(dead: dead)
        }
    }
}

