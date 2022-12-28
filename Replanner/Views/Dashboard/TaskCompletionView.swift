//
//  TaskCompletionView.swift
//  Replanner
//
//  Created by Lucas Maciel on 12/12/22.
//

import SwiftUI

struct TaskCompletionView: View {
    
    var taskCompletion: CompletionProgress
    
    var didSelectReminders: ([Reminder]) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(taskCompletion.projectName)
                .font(.system(size: 20))
                .padding([.horizontal, .top])
            HStack(spacing: 40) {
                BigNumberView(number: taskCompletion.totalTasks,
                              title: "Total",
                              color: taskCompletion.projectColor)
                .onTapGesture {
                    let allReminders = [taskCompletion.completedTasks, taskCompletion.openTasks].flatMap { $0 }
                    didSelectReminders(allReminders)
                }
                
                BigNumberView(number: taskCompletion.completedTasks.count,
                              title: "Completed",
                              color: taskCompletion.projectColor)
                .onTapGesture {
                    didSelectReminders(taskCompletion.completedTasks)
                }
                
                BigNumberView(number: taskCompletion.openTasks.count,
                              title: "Open",
                              color: taskCompletion.projectColor)
                .onTapGesture {
                    didSelectReminders(taskCompletion.openTasks)
                }
                
                
                BigNumberView(number: taskCompletion.overdueTasks.count,
                              title: "Overdue",
                              color: taskCompletion.projectColor)
                .onTapGesture {
                    didSelectReminders(taskCompletion.overdueTasks)
                }
            }
            .padding()
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TaskCompletionView_Previews: PreviewProvider {
    
    static var taskCompletion = Dashboard(projects: ProjectMocks.stubProjects).projectCompletions[0]
    
    static var previews: some View {
        TaskCompletionView(taskCompletion: taskCompletion) {_ in }
            .previewLayout(.sizeThatFits)
    }
}
