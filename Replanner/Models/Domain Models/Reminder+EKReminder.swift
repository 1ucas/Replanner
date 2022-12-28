//
//  Reminder+EKReminder.swift
//  Replanner
//
//  Created by Lucas Maciel on 03/12/22.
//

import Foundation
import EventKit

extension Reminder {
    
    init(with ekReminder: EKReminder) {
        id = ekReminder.calendarItemIdentifier
        title = ekReminder.title
        dueDate = ekReminder.dueDateComponents?.date
        isAlertSet = ekReminder.alarms?.first != nil
        notes = ekReminder.notes
        isComplete = ekReminder.isCompleted
        isOverdue = dueDate != nil && dueDate! < .now
    }
}

