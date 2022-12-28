//
//  ReminderMocks.swift
//  Replanner
//
//  Created by Lucas Maciel on 08/12/22.
//

import Foundation

struct ReminderMocks {

    static var noDueDateReminders: [Reminder] {
        let reminderTitles = [
            "Backlog 1",
            "Backlog 2",
            "Backlog 3"
        ]
        return reminderTitles.map { Reminder(id: UUID().uuidString, title: $0, dueDate: nil) }
    }
    
    static var monthReminders: [Reminder] {
        let reminderTitles = [
            "Month 1",
            "Month 2"
        ]
        
        let monthDate = Calendar.current.date(byAdding: .day, value: 25, to: .now)
        return reminderTitles.map { Reminder(id: UUID().uuidString, title: $0, dueDate: monthDate) }
    }
    
    static var weekReminders: [Reminder] {
        let reminderTitles = [
            "Week 1"
        ]
        
        let weekDate = Calendar.current.date(byAdding: .day, value: 4, to: .now)
        return reminderTitles.map { Reminder(id: UUID().uuidString, title: $0, dueDate: weekDate) }
    }
    
    static var tomorrowReminders: [Reminder] {
        let reminderTitles = [
            "Tomorrow 1",
            "Tomorrow 2",
            "Tomorrow 3"
        ]
        
        let tomorrowDate = Calendar.current.date(byAdding: .day, value: 1, to: .now)
        return reminderTitles.map { Reminder(id: UUID().uuidString, title: $0, dueDate: tomorrowDate) }
    }
    
    static var todayReminders: [Reminder] {
        let reminderTitles = [
            "Today 1"
        ]
        
        let todayDate = Calendar.current.date(byAdding: .hour, value: -1, to: .now)
        return reminderTitles.map { Reminder(id: UUID().uuidString, title: $0, dueDate: todayDate) }
    }
}
