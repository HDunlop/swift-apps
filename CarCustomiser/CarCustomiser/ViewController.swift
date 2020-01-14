//
//  ViewController.swift
//  CarCustomiser
//
//  Created by ManLikeMe on 12/01/2020.
//  Copyright © 2020 Hugo Dunlop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var enginePackage: UISwitch!
    @IBOutlet weak var tiresPackage: UISwitch!
    @IBOutlet weak var remainingFundsLabel: UILabel!
    @IBOutlet weak var CarStatistics: UILabel!
    
    var remainingFunds = 1_000 {
        didSet {
            remainingFundsLabel.text = "Remaining Funds: \(remainingFunds)"
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
    
    func checkFunds() {
        if remainingFunds == 0 {
            tiresPackage.isEnabled = false
            enginePackage.isEnabled = false
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
    
    
}

