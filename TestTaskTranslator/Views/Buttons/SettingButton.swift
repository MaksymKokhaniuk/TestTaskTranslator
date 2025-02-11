//
//  SettingButton.swift
//  TestTaskTranslator
//
//  Created by MaxK on 08.02.2025.
//

import SwiftUI

struct SettingButton: View {
    let title: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 50)
                .foregroundColor(.settingButton)
            
            HStack {
                Text(title)
                    .font(.customfont(.regular, fontSize: 16))
                    .foregroundColor(.primaryText)
                
                Spacer()
                
                Image("arrow-right")
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SettingButton(title: "Rate Us")
}
