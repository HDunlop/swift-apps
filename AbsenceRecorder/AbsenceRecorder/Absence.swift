//
//  Absence.swift
//  AbsenceRecorder
//
//  Created by ManLikeMe on 05/02/2020.
//  Copyright © 2020 Hugo Dunlop. All rights reserved.
//

import Foundation

class Absence {
    var takenOn: Date
    var present: [Student] = []
    var selectedRows: [IndexPath]?
    
    init(date: Date) {
        takenOn = date
    }
}
