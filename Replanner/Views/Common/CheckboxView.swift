//
//  CheckboxView.swift
//  Replanner
//
//  Created by Lucas Maciel on 12/12/22.
//

import SwiftUI

struct CheckboxView: View {
    
    @Binding var checked: Bool
    @Binding var title: String
        
    var selectionColor: Color {
        checked ? Color.green : Color.secondary
    }
    
    var body: some View {
        HStack {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .foregroundColor(selectionColor)
            Text(title)
        }
        .onTapGesture {
            self.checked.toggle()
        }
        .padding(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(selectionColor, lineWidth: 4)
            
        )
        .padding(.leading, 5)
    }
}

struct CheckboxView_Previews: PreviewProvider {
    
    struct CheckboxViewContainer: View {
        @State var checked = false
        @State var title = "Title"

        var body: some View {
            CheckboxView(checked: $checked, title: $title)
        }
    }
    
    static var previews: some View {
        CheckboxViewContainer()
    }
}
