//
//  KanbanList.swift
//  Replanner
//
//  Created by Lucas Maciel on 08/12/22.
//

import Foundation

struct KanbanList: Identifiable {
    
    private(set) var id = UUID().uuidString
    
    var name: String
    var cards: [Card]
    
    init(name: String, cards: [Card] = []) {
        self.name = name
        self.cards = cards
    }
}
