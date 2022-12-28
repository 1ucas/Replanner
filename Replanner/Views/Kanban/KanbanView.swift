//
//  KabanView.swift
//  Replanner
//
//  Created by Lucas Maciel on 01/12/22.
//

import SwiftUI

struct KanbanView: View {
        
    @StateObject var kanban: Kanban
    
    var body: some View {
        VStack {
            filterView
            Divider()
            boardView
        }
    }
    
    private var filterView: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .center, spacing: 15) {
                Text("Projects:")
                ForEach($kanban.kanbanFilters) { filter in
                    CheckboxView(checked: filter.isSelected, title: filter.projectName)
                }
            }
        }
        .frame(height: 50)
        .padding([.horizontal, .top])
    }
    
    private var boardView: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top, spacing: 24) {
                KanbanListView(kanbanList: $kanban.backlogList)
                KanbanListView(kanbanList: $kanban.nextMonthList)
                KanbanListView(kanbanList: $kanban.nextWeekList)
                KanbanListView(kanbanList: $kanban.tomorrowList)
                KanbanListView(kanbanList: $kanban.todayList)
                KanbanListView(kanbanList: $kanban.doneList)
                    .id(kanban.doneList.id)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct KanbanView_Previews: PreviewProvider {
    
    @State static var kanban = Kanban.stub
    
    static var previews: some View {
        NavigationStack {
            KanbanView(kanban: kanban)
        }
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
