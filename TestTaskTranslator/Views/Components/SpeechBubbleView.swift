//
//  SpeechBubbleView.swift
//  TestTaskTranslator
//
//  Created by MaxK on 09.02.2025.
//

import SwiftUI

struct SpeechBubbleView: View {
    var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 292, height: 140)
                .foregroundColor(Color.settingButton)
                .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 4)
            
            Text(text)
                .font(.customfont(.regular, fontSize: 12))
                .foregroundColor(.primaryText)
            
            Image("tailForMessage")
                .frame(width: 170, height: 476)
                .offset(x: 100, y: 115)
                .shadow(color: Color.black.opacity(0.15), radius: 4, x: 0, y: 4)
        }
        .frame(width: 292, height: 508)
    }
}




#Preview {
    SpeechBubbleView(text: "I'm hungry, feed me!")
}
