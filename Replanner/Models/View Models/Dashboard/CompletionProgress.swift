//
//  CompletionProgress.swift
//  Replanner
//
//  Created by Lucas Maciel on 12/12/22.
//

import Foundation
import SwiftUI

struct CompletionProgress {
    
    var projectName: String
    var projectColor: Color
    var totalTasks: Int
    var openTasks: [Reminder]
    var overdueTasks: [Reminder]
    var completedTasks: [Reminder]
    
}
