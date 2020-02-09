//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by ManLikeMe on 29/01/2020.
//  Copyright © 2020 Hugo Dunlop. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    var divisions: [Division] = []
    var currentDate : Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDivisions()
        updateDateDisplay()
    }
    
    @IBAction func previousDayButton(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? Date()
        updateDateDisplay()
        
    }
    
    @IBAction func nextDayButton(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let selectedDivision = divisions[indexPath.row]
        
        var absence = Absence(date: currentDate)
        if let existingAbsence = selectedDivision.getAbsence(for: currentDate) {
            absence = existingAbsence
        } else {
            selectedDivision.absences.append(absence)
        }
        
        guard let vc = storyboard?.instantiateViewController(identifier: "DivisionAbsenceViewController", creator: { coder in
            return DivisionAbsenceTableViewController(coder: coder, division: selectedDivision, absence: absence)
        }) else {
            fatalError("Failed to load DivisionAbsenceTableViewController from Storyboard")
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        
        let  selectedDivision = divisions[indexPath.row]
        cell.textLabel?.text = selectedDivision.code
        
        return cell
    }
    
    func setDivisions() {
        divisions.append(DivisionFactory.createDivision(code: "vCW-1", of: 9))
        divisions.append(DivisionFactory.createDivision(code: "pCX-1", of: 10))
        divisions.append(DivisionFactory.createDivision(code: "MCV3-3 Pure", of: 8))
    }
    
    func updateDateDisplay() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        navigationItem.title = formatter.string(from: currentDate)
    }
}
