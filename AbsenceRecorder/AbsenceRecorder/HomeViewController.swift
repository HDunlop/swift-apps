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
        updateDateDisplay()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @IBAction func previousDayButton(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    @IBAction func nextDayButton(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? Date()
        updateDateDisplay()
    }
    
    func configureUI() {
        navigationController?.navigationBar.barTintColor = .cyan
        navigationController?.navigationBar.barStyle = .black
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
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let allPresent = UIContextualAction(style: .normal, title: "All Present") { action, view, completionHandler in
            let division = self.divisions[indexPath.row]
            let absence = Absence(date: self.currentDate, present: division.students)
            division.absences.append(absence)
            tableView.reloadData()
            completionHandler(true)
        }
        let clearAbsence = UIContextualAction(style: .normal, title: "Clear Absence") { action, view, completionHandler in
            let division = self.divisions[indexPath.row]
            division.absences.removeAll {$0.takenOn == self.currentDate}
            tableView.reloadData()
            completionHandler(true)
        }
        
        allPresent.backgroundColor = .cyan
        clearAbsence.backgroundColor = .systemGray
        return UISwipeActionsConfiguration(actions: [allPresent, clearAbsence])
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        
        let  selectedDivision = divisions[indexPath.row]
        cell.textLabel?.text = selectedDivision.code
        cell.detailTextLabel?.text = selectedDivision.teacher
        
        if let _ = selectedDivision.getAbsence(for: self.currentDate) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func setDivisions() {
        divisions.append(DivisionFactory.createDivision(code: "vCW-1", teacher: "Mr. Coormell", of: 9))
        divisions.append(DivisionFactory.createDivision(code: "pCX-1", teacher: "Mr. Mann", of: 10))
        divisions.append(DivisionFactory.createDivision(code: "MCV3-3 Pure", teacher: "Mrs. Squires-Parkin", of: 8))
        divisions.append(DivisionFactory.createDivision(code: "MCV3-3 Applied", teacher: "Dr. Moston", of: 8))
    }
    
    func updateDateDisplay() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        navigationItem.title = formatter.string(from: currentDate)
        tableView.reloadData()
        configureUI()
    }
    
    func convertDivisionsToJson() -> String? {
        let encoder = JSONEncoder()
        guard let encoded = try? encoder.encode(divisions) else {
            print("Unable to encode divisions into JSON")
            return nil
        }
        guard let json = String(data: encoded, encoding: .utf8) else {
            print("Unable to turn encoded divisions into a string")
            return nil
        }
        return json
    }
    
    func convertJsonToDivisions(json: Data) -> [Division]? {
        let decoder = JSONDecoder()
        
        guard let decoded = try? decoder.decode([Division].self, from: json) else {
            return nil
        }
        return decoded
    }
    
    func saveDataToFile() {
        guard let divisionsjson = convertDivisionsToJson() else {
            return
        }
        let filePath = UserDocumentManager.getDocumentsDirectory().appendingPathComponent("divisions.txt")
        
        do {
            try divisionsjson.write(to: filePath, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Unable to save by writing to a file")
        }
    }
    
    func loadDataFromFile() {
        let filePath = UserDocumentManager.getDocumentsDirectory().appendingPathComponent("divisions.txt")
        do {
            let json = try Data(contentsOf: filePath)
            divisions = convertJsonToDivisions(json: json) ?? []
        } catch {
            print("Failed to read from file")
            setDivisions()
        }
    }
    
}
