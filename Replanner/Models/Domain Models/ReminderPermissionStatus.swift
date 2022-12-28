//
//  ReminderPermissionStatus.swift
//  Replanner
//
//  Created by Lucas Maciel on 19/12/22.
//

import SwiftUI

enum ReminderPermissionStatus: Equatable {
    case progress
    case connected
    case failed(ReminderAccessError)
    
    var description: String {
        switch self {
        case .progress:
            return "In Progress"
        case .connected:
            return "Connected"
        default:
            return "Failed to Connect"
        }
    }
    
    var color: Color {
        switch self {
        case .progress:
            return .gray
        case .connected:
            return .green
        default:
            return .red
        }
    }
}
