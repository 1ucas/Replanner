//
//  KanbanListView.swift
//  Replanner
//
//  Created by Lucas Maciel on 02/12/22.
//

import SwiftUI

struct KanbanListView: View {
    
    @Binding var kanbanList: KanbanList
    @State var listContentSize: CGFloat = .zero

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            headerView
            listView
        }
        .padding(.vertical)
        .background(Colors.boardListBackground)
        .frame(width: 300)
        .cornerRadius(8.0)
    }
    
    private var headerView: some View {
        HStack(alignment: .top) {
            Text(kanbanList.name)
                .font(.headline)
                .lineLimit(2)
            Spacer()
        }
        .padding(.horizontal)
    }
    
    private var listView: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(kanbanList.cards) { card in
                    CardView(card: card)
                }
                .listRowSeparator(.hidden)
                .listRowInsets(.init(top: 4, leading: 8, bottom: 4, trailing: 8))
                .listRowBackground(Color.clear)
            }
            .padding([.horizontal], 8)
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .overlay(
                GeometryReader { geo in
                    Color.clear
                    .onAppear {
                        listContentSize = geo.size.height + 20.0
                    }
                    .onChange(of: kanbanList.cards) { _ in
                        listContentSize = geo.size.height + 20.0
                    }
                }
            )
        }
        .frame(maxHeight: listContentSize)
    }
}

struct KanbanListView_Previews: PreviewProvider {
        
    @State static var kanban = Kanban.stub
    
    static var previews: some View {
        KanbanListView(kanbanList: $kanban.nextWeekList)
            .previewLayout(.sizeThatFits)
            .frame(width: 300, height: 500)
    }
}
