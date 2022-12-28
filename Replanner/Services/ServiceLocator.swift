//
//  ServiceLocator.swift
//  Replanner
//
//  Created by Lucas Maciel on 12/12/22.
//

import Foundation

struct ServiceLocator {
    
    #if DEBUG
    static var toggleMock = false
    #endif
    
    static func getReminderService() -> ReminderServiceProtocol {
        #if DEBUG
        if toggleMock {
            return ReminderServiceMock()
        } else {
            return ReminderService()
        }
        #else
            return ReminderService()
        #endif
    }
}
