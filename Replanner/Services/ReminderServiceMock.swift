//
//  ReminderServiceMock.swift
//  Replanner
//
//  Created by Lucas Maciel on 12/12/22.
//

import Foundation

class ReminderServiceMock: ReminderServiceProtocol {
    
    var errorOnPermission = false
    
    func requestAccess() async throws {
        if errorOnPermission {
            throw ReminderAccessError.accessDenied
        }
    }
    
    func readAll() async throws -> [Reminder] {
        return ProjectMocks.stubProjects.flatMap { $0.reminders }
    }
}
