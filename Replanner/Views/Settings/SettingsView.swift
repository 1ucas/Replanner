//
//  SettingsView.swift
//  Replanner
//
//  Created by Lucas Maciel on 19/12/22.
//

import SwiftUI

struct SettingsView: View {
        
    @AppStorage("isDarkMode") private var isDarkMode:Bool?
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Form {
            Toggle("Dark Mode", isOn: Binding.init(get: {
                if let isDarkMode {
                    return isDarkMode
                } else {
                    return colorScheme == .dark
                }
            }, set: { newValue in
                isDarkMode = newValue
            }))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    
    @State static var checked: Bool = false
    
    static var previews: some View {
        SettingsView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
