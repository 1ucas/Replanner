//
//  CardView.swift
//  Replanner
//
//  Created by Lucas Maciel on 02/12/22.
//

import SwiftUI

struct CardView: View {
    
    var card: Card
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(card.project.name)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundColor(.white)
                    .padding(5)
                    .background(RoundedRectangle(cornerRadius: 8)
                        .foregroundColor(card.project.color)
                    )
                Text(card.reminder.title)
                    .lineLimit(3)
                    .foregroundColor(.black)
            }
            Spacer()
        }
        .padding()
        .background(.white)
        .cornerRadius(4)
        .shadow(radius: 1, y: 1)
    }
}

struct CardView_Previews: PreviewProvider {
    
    @State static var kanban = Kanban.stub
        
    static var previews: some View {
        List(kanban.backlogList.cards) { card in
            CardView(card: card)
        }
        .previewLayout(.sizeThatFits)
        .frame(width: 300)
    }
}
