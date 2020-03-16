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
    var comment: Comment?
    
    init(_ coder: NSCoder, _ enjoyment: Int, _ effort: Int, _ improvement: Int, _ division: Division) {
        self.enjoyment = enjoyment
        self.effort = effort
        self.improvement = improvement
        self.division = division
        super.init(coder: coder)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("you must have the NSCoder thingy")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teacher.text = division.teacher
        divisionLabel.text = division.code
        comment = Comment(effort: effort, enjoyment: enjoyment, improvement: improvement)
        commentLabel.text = comment?.writeComment()
    }
    
    @IBAction func edit(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(identifier: "CommentEditViewController", creator: { coder in
            return CommentEditViewController(coder, self.comment, self.enjoyment, self.effort, self.improvement, self.division)
            }) else {
                fatalError("Failure to load edit view controller from storyboard")
            }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
