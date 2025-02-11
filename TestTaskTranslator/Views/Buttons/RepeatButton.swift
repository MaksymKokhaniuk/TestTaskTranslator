//
//  RepeatButton.swift
//  TestTaskTranslator
//
//  Created by MaxK on 10.02.2025.
//

import SwiftUI

struct RepeatButton: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 292, height: 54)
                .foregroundColor(Color.settingButton)
                .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 4)
            HStack {
                Image("repeat")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 16, height: 16)
                
                Text("Repeat")
                    .font(.customfont(.regular, fontSize: 12))
                    .foregroundColor(.primaryText)
            }
        }
        .frame(width: 292, height: 508)
    }
}

#Preview {
    RepeatButton()
}
