//
//  Project.swift
//  Replanner
//
//  Created by Lucas Maciel on 02/12/22.
//

import Foundation
import SwiftUI

struct Project: Identifiable, Equatable {
    
    private static let NoProjectTitle = "Unkown"
    
    let id: String = UUID().uuidString
    var name: String
    var color = Color(
        red: .random(in: 0...1),
        green: .random(in: 0...1),
        blue: .random(in: 0...1)
    )
    var reminders: [Reminder]
    
    static func from(reminders: [Reminder]) -> [Project] {
        let projectNames = Set(reminders.map { extractProject(from: $0) })
        let projects = projectNames.map { name in
            if name == NoProjectTitle {
                return Project(name: name, reminders: reminders.filter {
                    guard let notes = $0.notes else { return true }
                    return !notes.contains("Project:")
                })
            } else {
                return Project(name: name, reminders: reminders.filter {
                    guard let notes = $0.notes else { return false }
                    return notes.contains("Project:\(name)")
                })
            }
        }
        return projects
    }
    
    static private func extractProject(from reminder: Reminder) -> String {
        let projectPrefix = "Project:"
        
        if let notes = reminder.notes {
            let noteLines = notes.split(separator: "\n")
            for line in noteLines {
                if line.starts(with: projectPrefix), !line.replacingOccurrences(of: projectPrefix, with: "").isEmpty {
                    return line.replacingOccurrences(of: projectPrefix, with: "")
                }
            }
        }
        
        return NoProjectTitle
    }
}
