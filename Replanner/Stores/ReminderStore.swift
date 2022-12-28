//
//  ReminderStore.swift
//  Replanner
//
//  Created by Lucas Maciel on 03/12/22.
//

import Foundation
import SwiftUI

struct ReminderState {
    var permissionStatus: ReminderPermissionStatus = .progress
    var loadError: Error?
    var projects: [Project] = []
}

@MainActor
class ReminderStore: ObservableObject {
    
    static let shared = ReminderStore()
    
    @Published var state = ReminderState()
    
    private let service: ReminderServiceProtocol = ServiceLocator.getReminderService()
        
    func requestAccess() async {
        do {
            try await service.requestAccess()
            state.permissionStatus = .connected
        } catch let error as ReminderAccessError {
            state.permissionStatus = .failed(error)
        } catch {
            state.loadError = error
        }
    }
    
    func readAll() async {
        do {
            let reminders = try await service.readAll()
            state.projects = Project.from(reminders: reminders)
        } catch let error as ReminderAccessError {
            state.permissionStatus = .failed(error)
        } catch {
            state.loadError = error
        }
    }
}
