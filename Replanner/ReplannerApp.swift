//
//  ReplannerApp.swift
//  Replanner
//
//  Created by Lucas Maciel on 01/12/22.
//

import SwiftUI

@main
struct ReplannerApp: App {
    
    @AppStorage("isDarkMode") private var isDarkMode:Bool?
        
    init() {
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().preferredBehavioralStyle = .pad
        }
    }
    
    var body: some Scene {
        WindowGroup {
            PanelView()
                .preferredColorScheme(isDarkMode == nil ? nil :
                                        isDarkMode == true ? .dark : .light)
                .environmentObject(ReminderStore.shared)
        }
        #if os(macOS)
        .windowStyle(.hiddenTitleBar)
        #endif
    }
}
