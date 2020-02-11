//
//  ViewController.swift
//  CommentCardWriter
//
//  Created by Dunlop, Hugo (PEPW) on 11/02/2020.
//  Copyright © 2020 Dunlop, Hugo (PEPW). All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var divisions = [Division]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDivisions()
    }
    
    func setDivisions() {
        divisions.append(Division(code: "vCW-1", teacher: "Mr. Cormell"))
        divisions.append(Division(code: "pCX-1", teacher: "Mr. Mann"))
        divisions.append(Division(code: "MCV3-3 Pure", teacher: "Mrs. Squires-Parkin"))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        
        let selectedDivision = divisions[indexPath.row]
        cell.textLabel?.text = selectedDivision.code
        cell.detailTextLabel?.text = selectedDivision.teacher
        
        return cell
    }

}

