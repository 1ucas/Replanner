//
//  ReminderError.swift
//  Replanner
//
//  Created by Lucas Maciel on 03/12/22.
//

import Foundation

enum ReminderAccessError: LocalizedError {
    
    case accessDenied
    case accessRestricted
    case failedReadingReminders
    case pendingAuthorization
    case unknownResult
        
        var errorDescription: String? {
            switch self {
            case .accessDenied:
                return NSLocalizedString("The app doesn't have permission to read reminders.", comment: "access denied error description")
            case .accessRestricted:
                return NSLocalizedString("This device doesn't allow access to reminders.", comment: "access restricted error description")
            case .failedReadingReminders:
                return NSLocalizedString("Failed to read reminders.", comment: "failed reading reminders error description")
            case .unknownResult:
                return NSLocalizedString("An unknown error occurred.", comment: "unknown error description")
            case .pendingAuthorization:
                return NSLocalizedString("You need to authorize reading the reminders.", comment: "pending authorization error description")
            }
        }
}

enum ReminderValidationError: LocalizedError {
    
    case reminderHasNoDueDate
        
        var errorDescription: String? {
            switch self {
            case .reminderHasNoDueDate:
                return NSLocalizedString("A reminder has no due date.", comment: "reminder has no due date error description")
            }
        }
}
