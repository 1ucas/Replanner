//
//  TaskListView.swift
//  Replanner
//
//  Created by Lucas Maciel on 27/12/22.
//

import SwiftUI

struct TaskListView: View {
    
    @Binding var selectedReminders: [Reminder]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Tasks")
                .font(.system(size: 20, weight: .bold))
                .padding()
            List(selectedReminders) { reminder in
                Text(reminder.title)
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
    
}

struct TaskListView_Previews: PreviewProvider {
    
    @State private static var selectedReminders: [Reminder] = []
    
    static var previews: some View {
        TaskListView(selectedReminders: $selectedReminders)
    }
}
