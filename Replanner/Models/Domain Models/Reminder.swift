//
//  Reminder.swift
//  Replanner
//
//  Created by Lucas Maciel on 03/12/22.
//

import Foundation

struct Reminder: Identifiable, Equatable {
    var id: String
    var title: String
    var dueDate: Date?
    var isAlertSet: Bool = false
    var notes: String? = nil
    var isComplete: Bool = false
    var isOverdue: Bool = false
}

