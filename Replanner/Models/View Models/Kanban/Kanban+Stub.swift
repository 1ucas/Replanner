//
//  Kanban+Stub.swift
//  Replanner
//
//  Created by Lucas Maciel on 02/12/22.
//

import Foundation

#if DEBUG
extension Kanban {

    static var stub: Kanban {
        return Kanban(projects: ProjectMocks.stubProjects)
    }
}
#endif
