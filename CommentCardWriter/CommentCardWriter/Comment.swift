//
//  Comment.swift
//  CommentCardWriter
//
//  Created by Dunlop, Hugo (PEPW) on 11/02/2020.
//  Copyright © 2020 Dunlop, Hugo (PEPW). All rights reserved.
//

import Foundation

class Comment {
    
    var comment: String = ""
    var effort: Int
    var happiness: Int
    var strength: String
    var weakness: String
    
    init(effort: Int, happiness: Int, strength: String, weakness: String) {
        self.effort = effort
        self.happiness = happiness
        self.strength = strength
        self.weakness = weakness
    }
}
