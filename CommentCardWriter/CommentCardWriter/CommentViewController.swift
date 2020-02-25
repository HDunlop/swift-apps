//
//  CommentViewController.swift
//  CommentCardWriter
//
//  Created by Dunlop, Hugo (PEPW) on 25/02/2020.
//  Copyright © 2020 Dunlop, Hugo (PEPW). All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {
    
    @IBOutlet var teacher: UILabel!
    @IBOutlet var divisionLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    
    var enjoyment: Int
    var effort: Int
    var improvement: Int
    var division: Division
    
    init(_ enjoyment: Int, _ effort: Int, _ improvement: Int, _ division: Division) {
        self.enjoyment = enjoyment
        self.effort = effort
        self.improvement = improvement
        self.division = division
    }
    
    required init?(coder: NSCoder) {
        fatalError("you must have the NSCoder thingy")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teacher.text = division.teacher
        divisionLabel.text = division.code
        let comment = Comment(effort: effort, enjoyment: enjoyment, improvement: improvement)
        commentLabel.text = comment.writeComment()
    }
}
