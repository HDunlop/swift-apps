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
    
    var remainingFunds = 1_000 {
        didSet {
            remainingFundsLabel.text = "Remaining Funds: \(remainingFunds)"
//            disableUnaffordablePackages
        }
    }
    var respect = 0 {
        didSet {
            crowdRespectLabel.text = "Crowd Respect: \(respect)"
        }
    }
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
    }
    
    @IBAction func RandomCar(_ sender: Any) {
        car = starterCars.cars.randomElement()
    }
    
    @IBAction func NextCar(_ sender: Any) {
        currentCarIndex += 1
        if currentCarIndex >= starterCars.cars.count {
            currentCarIndex = 0
        }
        car = starterCars.cars[currentCarIndex]
    }
    
//    func checkFunds() {
//        if remainingFunds == 0 {
//            tiresPackage.isEnabled = false
//            enginePackage.isEnabled = false
//        }
//    }
    
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
            car?.acceleration += 2.4
            remainingFunds -= 500
        } else {
            car?.topSpeed += 23
            car?.acceleration -= 2.4
            remainingFunds += 500
        }
    }
    
    @IBAction func fuelPackageToggle(_ sender: Any) {
        if fuelPackage.isOn {
            car?.topSpeed += 12
            car?.acceleration -= 4.3
            remainingFunds -= 250
        } else {
            car?.topSpeed -= 12
            car?.acceleration += 4.3
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
}
