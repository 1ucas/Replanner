//
//  ReminderService.swift
//  Replanner
//
//  Created by Lucas Maciel on 03/12/22.
//

import Foundation
import EventKit

protocol ReminderServiceProtocol {
    func requestAccess() async throws
    func readAll() async throws -> [Reminder]
}

class ReminderService: ReminderServiceProtocol {
    
    private let ekStore = EKEventStore()
    
    private var isAvailable: Bool {
        EKEventStore.authorizationStatus(for: .reminder) == .authorized ||
        EKEventStore.authorizationStatus(for: .reminder) == .notDetermined
    }
    
    private var isAuthorized: Bool {
        EKEventStore.authorizationStatus(for: .reminder) == .authorized
    }
    
    func requestAccess() async throws {
        let status = EKEventStore.authorizationStatus(for: .reminder)
        switch status {
        case .authorized:
            return
        case .restricted:
            throw ReminderAccessError.accessRestricted
        case .notDetermined:
            let accessGranted = try await ekStore.requestAccess(to: .reminder)
            guard accessGranted else {
                throw ReminderAccessError.accessDenied
            }
        case .denied:
            throw ReminderAccessError.accessDenied
        @unknown default:
            throw ReminderAccessError.unknownResult
        }
    }
    
    func readAll() async throws -> [Reminder] {
        guard isAvailable else {
            throw ReminderAccessError.accessDenied
        }
        
        guard isAuthorized else {
            throw ReminderAccessError.pendingAuthorization
        }
        
        let predicate = ekStore.predicateForReminders(in: nil)
        let ekReminders = try await ekStore.fetchReminders(matching: predicate)
        let reminders = ekReminders.map { Reminder(with: $0) }
        return reminders
    }
}
