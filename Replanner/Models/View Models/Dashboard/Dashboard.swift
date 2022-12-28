//
//  Dashboard.swift
//  Replanner
//
//  Created by Lucas Maciel on 12/12/22.
//

import Foundation

class Dashboard: ObservableObject {
        
    @Published var totalCompletion: CompletionProgress? = nil
    @Published var projectCompletions: [CompletionProgress] = []
        
    init(projects: [Project]) {
        guard !projects.isEmpty else {
            totalCompletion = nil
            projectCompletions = []
            return
        }
        
        let allReminders = projects.flatMap { $0.reminders }
        
        totalCompletion = CompletionProgress(
            projectName: "TOTAL",
            projectColor: .gray,
            totalTasks: allReminders.count,
            openTasks: allReminders.filter { !$0.isComplete },
            overdueTasks: allReminders.filter { $0.isOverdue },
            completedTasks: allReminders.filter { $0.isComplete }
        )
                
        projectCompletions = projects.map {
            CompletionProgress(
                projectName: $0.name,
                projectColor: $0.color,
                totalTasks: $0.reminders.count,
                openTasks: $0.reminders.filter { !$0.isComplete },
                overdueTasks: $0.reminders.filter { $0.isOverdue },
                completedTasks: $0.reminders.filter { $0.isComplete }
            )
        }
    }
    
    
}
