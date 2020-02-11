//
//  QuizViewController.swift
//  CommentCardWriter
//
//  Created by Dunlop, Hugo (PEPW) on 11/02/2020.
//  Copyright © 2020 Dunlop, Hugo (PEPW). All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var division: Division
    
    init?(coder: NSCoder, division: Division) {
        self.division = division
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("you must create this controller with a division")
    }
    
    
    
}
