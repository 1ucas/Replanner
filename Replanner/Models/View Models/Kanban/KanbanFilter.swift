//
//  ProjectFilter.swift
//  Replanner
//
//  Created by Lucas Maciel on 08/12/22.
//

import Foundation

struct KanbanFilter: Identifiable {
    
    var id: String {
        projectName
    }
    var projectName: String
    var isSelected: Bool = false
    
}
