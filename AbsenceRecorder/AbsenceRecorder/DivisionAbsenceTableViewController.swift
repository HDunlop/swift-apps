//
//  DivisionAbsenceTableViewController.swift
//  AbsenceRecorder
//
//  Created by ManLikeMe on 03/02/2020.
//  Copyright © 2020 Hugo Dunlop. All rights reserved.
//

import UIKit

class DivisionAbsenceTableViewController: UITableViewController {

    var division: Division?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return division?.students.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Student", for: indexPath)
        cell.textLabel?.text = division?.students[indexPath.row].surname
        
        return cell
    }
}
