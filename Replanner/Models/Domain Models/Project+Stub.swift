//
//  Project+Stub.swift
//  Replanner
//
//  Created by Lucas Maciel on 09/12/22.
//

import Foundation

struct ProjectMocks {
    
    private static var personalProject: Project {
        var project = Project(name: "Personal Project", reminders: [])
        
        let reminders = ReminderMocks.monthReminders + ReminderMocks.todayReminders
        project.reminders = reminders.map {
            Reminder(id: $0.id, title: $0.title, dueDate: $0.dueDate, isAlertSet: $0.isAlertSet, notes: "Project:Personal Project", isComplete: $0.isComplete, isOverdue: $0.isOverdue)
        }
        
        return project
    }
    
    private static var healthProject: Project {
        var project = Project(name: "Health Project", reminders: [])
        
        let reminders = ReminderMocks.noDueDateReminders + ReminderMocks.tomorrowReminders
        project.reminders = reminders.map {
            Reminder(id: $0.id, title: $0.title, dueDate: $0.dueDate, isAlertSet: $0.isAlertSet, notes: "Project:Health Project", isComplete: $0.isComplete, isOverdue: $0.isOverdue)
        }
        
        return project
    }
    
    private static var singleTaskProject: Project {
        var project = Project(name: "Single Task Project", reminders: [])
        
        let reminders = ReminderMocks.weekReminders
        project.reminders = reminders.map {
            Reminder(id: $0.id, title: $0.title, dueDate: $0.dueDate, isAlertSet: $0.isAlertSet, notes: "Project:Single Task Project", isComplete: $0.isComplete, isOverdue: $0.isOverdue)
        }
        
        return project
    }
    
    static var stubProjects: [Project] {
        return [personalProject, healthProject, singleTaskProject]
    }
}
