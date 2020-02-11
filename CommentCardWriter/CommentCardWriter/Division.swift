//
//  Division.swift
//  CommentCardWriter
//
//  Created by Dunlop, Hugo (PEPW) on 11/02/2020.
//  Copyright © 2020 Dunlop, Hugo (PEPW). All rights reserved.
//

import Foundation

class Division {
    
    var code: String
    var teacher: String
    var comment: Comment?
    
    init(code: String, teacher: String) {
        self.code = code
        self.teacher = teacher
    }
}
