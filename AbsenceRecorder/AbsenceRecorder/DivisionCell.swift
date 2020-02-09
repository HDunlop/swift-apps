//
//  DivisionCell.swift
//  AbsenceRecorder
//
//  Created by ManLikeMe on 09/02/2020.
//  Copyright © 2020 Hugo Dunlop. All rights reserved.
//

import UIKit

class DivisionCell: UITableViewCell {
    func hasAbsence() {
        self.accessoryType = .checkmark
        self.selectionStyle = .none
    }
}
