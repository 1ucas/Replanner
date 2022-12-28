//
//  File.swift
//  Replanner
//
//  Created by Lucas Maciel on 02/12/22.
//

import Foundation

struct Card: Identifiable, Equatable {
    
    var id: String
    let project: Project
    let reminder: Reminder
    
    init(project: Project, reminder: Reminder) {
        self.id = reminder.id
        self.project = project
        self.reminder = reminder
    }
}
