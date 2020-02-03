//
//  ViewController.swift
//  AbsenceRecorder
//
//  Created by ManLikeMe on 29/01/2020.
//  Copyright © 2020 Hugo Dunlop. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var divisions: [Division] = []
    var currentDate: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDivisions()
        for division in divisions {
            print("This division is called \(division.code)")
            print("The max number of students in this division is \(division.students.count)")
            for student in division.students {
                print("     \(student.forename) \(student.surname)")
//                born on \(student.birthDate)
            }
        }
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
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "DivisionAbsenceViewController")
            as? DivisionAbsenceTableViewController else {
                fatalError("Failed to load DivisionAbecneTableViewController from Storyboard")
        }
        
        vc.division = divisions[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        
        cell.textLabel?.text = divisions[indexPath.row].code
        
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
