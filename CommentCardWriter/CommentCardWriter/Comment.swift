//
//  Comment.swift
//  CommentCardWriter
//
//  Created by Dunlop, Hugo (PEPW) on 27/02/2020.
//  Copyright © 2020 Dunlop, Hugo (PEPW). All rights reserved.
//

import UIKit

class Comment {
    
    var comment: String = ""
    var effort: Int
    var enjoyment: Int
    var improvement: Int
    
    init(effort: Int, enjoyment: Int, improvement: Int) {
        self.effort = effort
        self.enjoyment = enjoyment
        self.improvement = improvement
    }
    
    func writeComment() -> String {
        if self.enjoyment < 2 {
            comment = "I despise the lesson."
        } else if self.enjoyment == 4 {
            comment = "I absolutely love all the lessons."
        } else {
            comment = "I tolerate this."
        }
        if self.effort < 2 {
            comment = "\(comment) I put zero effort in."
        } else if self.effort == 4 {
            comment = "\(comment) I do not sleep because I am working."
        } else {
            comment = "\(comment) It's ayt."
        }
        if self.improvement == 0 {
            comment = "\(comment) I need to spend more time working."
        } else if self.improvement == 1 {
            comment = "\(comment) I need to focus more in class."
        } else {
            comment = "\(comment) I need to make better notes."
        }
        return comment
    }
}
