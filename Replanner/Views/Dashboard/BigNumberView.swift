//
//  BigNumberView.swift
//  Replanner
//
//  Created by Lucas Maciel on 12/12/22.
//

import SwiftUI

struct BigNumberView: View {
    
    var number: Int
    var title: String
    var color: Color 
    
    var body: some View {
        VStack {
            Text("\(number)")
                .font(.system(size: 22, weight: .heavy))
                .padding(2)
            .foregroundColor(.white)
            Text(title)
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(Color.black.opacity(0.6))
        }
        .frame(width: 80)
        .padding()
        .background(color)
        .cornerRadius(10)
    }
}

struct BigNumberView_Previews: PreviewProvider {
    static var previews: some View {
        BigNumberView(number: 3, title: "Completed", color: .purple)
    }
}
