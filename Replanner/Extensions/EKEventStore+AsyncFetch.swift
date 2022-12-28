//
//  EKEventStore+AsyncFetch.swift
//  Replanner
//
//  Created by Lucas Maciel on 03/12/22.
//

import Foundation
import EventKit

extension EKEventStore {
    
    func fetchReminders(matching predicate: NSPredicate) async throws -> [EKReminder] {
        
        try await withCheckedThrowingContinuation { continuation in
            fetchReminders(matching: predicate) { reminders in
                if let reminders {
                    continuation.resume(returning: reminders)
                } else {
                    continuation.resume(throwing: ReminderAccessError.failedReadingReminders)
                }
            }
        }
        
    }
    
}
