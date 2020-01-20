//
//  ViewController.swift
//  CarCustomiser
//
//  Created by ManLikeMe on 12/01/2020.
//  Copyright © 2020 Hugo Dunlop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var enginePackage: UISwitch!
    @IBOutlet var tiresPackage: UISwitch!
    @IBOutlet var ecoFriendlyPackage: UISwitch!
    @IBOutlet var fuelPackage: UISwitch!
    @IBOutlet var memePackage: UISwitch!
    @IBOutlet var crowdRespectLabel: UILabel!
    @IBOutlet var remainingFundsLabel: UILabel!
    @IBOutlet var CarStatistics: UILabel!
    @IBOutlet var timeRemainingLabel: UILabel!
    
//    button which stops timer and locks the screen before timer hits 0
//    or
//    displays final stats when timer hits 0
    
    var timeRemaining = 60
    var timer: Timer?
    var stop = false
    var remainingFunds = 1_000 {
        didSet {
            remainingFundsLabel.text = "Remaining Funds: \(remainingFunds)"
            disableUnaffordablePackages()
        }
    }
    var respect = 0 {
        didSet {
            crowdRespectLabel.text = "Crowd Respect: \(respect)"
        }
    }
    var cost = 0
    var starterCars = StarterCars()
    var currentCarIndex = 0
    var car: Car? {
        didSet {
            CarStatistics.text = car?.displayStats()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        car = starterCars.cars[currentCarIndex]
        remainingFundsLabel.text = "Remaining Funds: \(remainingFunds)"
        resetDisplay()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        timeRemainingLabel.text = "Remaining Time: \(timeRemaining)"
    }
    
    func resetDisplay() {
        remainingFunds = 1000
        enginePackage.setOn(false, animated: true)
        tiresPackage.setOn(false, animated: true)
        ecoFriendlyPackage.setOn(false, animated: true)
        fuelPackage.setOn(false, animated: true)
        memePackage.setOn(false, animated: true)
    }
    
    @IBAction func RandomCar(_ sender: Any) {
        car = starterCars.cars.randomElement()
        resetDisplay()
    }
    
    @IBAction func NextCar(_ sender: Any) {
        currentCarIndex += 1
        if currentCarIndex >= starterCars.cars.count {
            currentCarIndex = 0
        }
        car = starterCars.cars[currentCarIndex]
        resetDisplay()
    }
    
    @IBAction func StopTimer(_ sender: Any) {
        stop = true
        countdown()
        disableUnaffordablePackages()
    }
    
    func disableUnaffordablePackages() {
        enginePackage.isEnabled = shouldBeEnabled(enginePackage)
        tiresPackage.isEnabled = shouldBeEnabled(tiresPackage)
        ecoFriendlyPackage.isEnabled = shouldBeEnabled(ecoFriendlyPackage)
        fuelPackage.isEnabled = shouldBeEnabled(fuelPackage)
        memePackage.isEnabled = shouldBeEnabled(memePackage)
    }
    
    func shouldBeEnabled(_ package: UISwitch) -> Bool {
        if package.accessibilityIdentifier == "engine" {cost = 500}
        else if package.accessibilityIdentifier == "tires" {cost = 500}
        else if package.accessibilityIdentifier == "eco" {cost = 500}
        else if package.accessibilityIdentifier == "fuel" {cost = 250}
        else {cost = 1000}
        if (timeRemaining == 0) || (stop == true) {
            return false
        } else if (package.isOn) || (remainingFunds - cost >= 0) {
            return true
        } else {
            return false
        }
    }
    
    @IBAction func enginePackageToggle(_ sender: Any) {
        if enginePackage.isOn {
            car?.topSpeed += 5
            remainingFunds -= 500
        } else {
            car?.topSpeed -= 5
            remainingFunds += 500
        }
    }
    
    @IBAction func tiresPackageToggle(_ sender: Any) {
        if tiresPackage.isOn {
            car?.handling += 5
            remainingFunds -= 500
        } else {
            car?.handling -= 5
            remainingFunds += 500
        }
    }
    
    @IBAction func ecoFriendlyPackageToggle(_ sender: Any) {
        if ecoFriendlyPackage.isOn {
            car?.topSpeed -= 23
            car?.acceleration += 2
            remainingFunds -= 500
        } else {
            car?.topSpeed += 23
            car?.acceleration -= 2
            remainingFunds += 500
        }
    }
    
    @IBAction func fuelPackageToggle(_ sender: Any) {
        if fuelPackage.isOn {
            car?.topSpeed += 12
            car?.acceleration -= 4
            remainingFunds -= 250
        } else {
            car?.topSpeed -= 12
            car?.acceleration += 4
            remainingFunds += 250
        }
    }
    
    @IBAction func memePackageToggle(_ sender: Any) {
        if memePackage.isOn {
            respect = 420
            remainingFunds -= 1000
        } else {
            respect = 0
            remainingFunds += 1000
        }
    }
    
    @objc func countdown() {
        if (timeRemaining > 0) && (stop == false) {
            timeRemaining -= 1
            timeRemainingLabel.text = "Remaining Time: \(timeRemaining)"
        } else {
            timer?.invalidate()
            disableUnaffordablePackages()
        }
    }
}
