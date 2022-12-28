//
//  Kanban.swift
//  Replanner
//
//  Created by Lucas Maciel on 08/12/22.
//

import Foundation
import Combine

class Kanban: ObservableObject {
            
    @Published var kanbanFilters: [KanbanFilter] = [] {
        didSet {
            setupLists()
        }
    }
    
    @Published var backlogList: KanbanList = .init(name: "Backlog")
    @Published var nextMonthList: KanbanList = .init(name: "Next Month")
    @Published var nextWeekList: KanbanList = .init(name: "Next Week")
    @Published var tomorrowList: KanbanList = .init(name: "Tomorrow")
    @Published var todayList: KanbanList = .init(name: "Today")
    @Published var doneList: KanbanList = .init(name: "Done")
    
    private var projects: [Project]
    
    init(projects: [Project]) {
        self.projects = projects
        setupFilters()
        setupLists()
    }
    
    private func setupFilters() {
        kanbanFilters = projects.map { KanbanFilter(projectName: $0.name) }
    }
    
    private func setupLists() {
        
        let selectedFilters = kanbanFilters.filter({ $0.isSelected })
        
        let selectedProjects = projects.filter { project in
            return selectedFilters.isEmpty || selectedFilters.contains { $0.projectName == project.name }
        }
        
        let allCards: [Card] = selectedProjects.map { project in
            project.reminders.map { Card(project: project, reminder: $0) }
        }.flatMap { $0 }
        
        doneList.cards = allCards.filter { $0.reminder.isComplete == true }
        
        let wipCards = allCards.filter { $0.reminder.isComplete == false }
        
        todayList.cards = wipCards.filter {
            $0.reminder.dueDate != nil &&
            (Calendar.current.isDateInToday($0.reminder.dueDate!) || $0.reminder.isOverdue)
        }
        
        tomorrowList.cards = wipCards.filter {
            $0.reminder.dueDate != nil &&
            Calendar.current.isDateInTomorrow($0.reminder.dueDate!)
        }
        
        nextWeekList.cards = wipCards.filter {
            let endWeekDate = Calendar.current.date(byAdding: .day, value: 7, to: .now)!
            let range = .now...endWeekDate
            
            return $0.reminder.dueDate != nil &&
            !todayList.cards.contains($0) &&
            !tomorrowList.cards.contains($0) &&
            range.contains($0.reminder.dueDate!)
        }
        
        nextMonthList.cards = wipCards.filter {
            let endMonthDate = Calendar.current.date(byAdding: .day, value: 30, to: .now)!
            let range = .now...endMonthDate
            
            return $0.reminder.dueDate != nil &&
            !todayList.cards.contains($0) &&
            !tomorrowList.cards.contains($0) &&
            !nextWeekList.cards.contains($0) &&
            range.contains($0.reminder.dueDate!)
        }
        
        backlogList.cards = wipCards.filter {
            $0.reminder.dueDate == nil ||
            $0.reminder.dueDate! > Calendar.current.date(byAdding: .month, value: 1, to: .now )!
        }

    }
    

    
}
