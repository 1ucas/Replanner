//
//  DashboardView.swift
//  Replanner
//
//  Created by Lucas Maciel on 12/12/22.
//

import SwiftUI

struct DashboardView: View {
    
    @StateObject var dashboard: Dashboard
    @State private var selectedReminders: [Reminder] = []
    @State private var isShowingTaskSheet = false
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        HStack {
            if sizeClass == .compact {
                ScrollView(.horizontal) {
                    bigNumbersView
                }
            } else {
                bigNumbersView
            }
            
            if sizeClass != .compact {
                TaskListView(selectedReminders: $selectedReminders)
            }
        }
        .sheet(isPresented: $isShowingTaskSheet) {
            TaskListView(selectedReminders: $selectedReminders)
        }
    }
    
    private var bigNumbersView: some View {
        VStack(spacing: 0) {
            if dashboard.totalCompletion != nil {
                TaskCompletionView(taskCompletion: dashboard.totalCompletion!,
                                   didSelectReminders: didSelectReminders)
                Divider()
            }
            ScrollView(.vertical) {
                ForEach(dashboard.projectCompletions, id:\.projectName) { taskCompletion in
                    TaskCompletionView(taskCompletion: taskCompletion,
                                       didSelectReminders: didSelectReminders)
                }
            }
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
    private func didSelectReminders(reminders: [Reminder]) {
        selectedReminders = reminders
        if selectedReminders.count != 0 && sizeClass == .compact {
            isShowingTaskSheet = true
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    
    @State static var dashboard = Dashboard(projects: ProjectMocks.stubProjects)
    
    static var previews: some View {
        DashboardView(dashboard: dashboard)
                    .previewInterfaceOrientation(.landscapeLeft)
    }
}
