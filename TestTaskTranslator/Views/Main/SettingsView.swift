//
//  SettingsView.swift
//  TestTaskTranslator
//
//  Created by MaxK on 09.02.2025.
//

import SwiftUI

struct SettingsView: View {
    private let settingsOptions: [SettingOption] = [
        SettingOption(title: "Rate Us", action: {}),
        SettingOption(title: "Share App", action: {}),
        SettingOption(title: "Contact Us", action: {}),
        SettingOption(title: "Restore Purchases", action: {}),
        SettingOption(title: "Privacy Policy", action: {}),
        SettingOption(title: "Terms of Use", action: {})
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Settings")
                .font(.customfont(.regular, fontSize: 32))
            
            ForEach(settingsOptions) { option in
                Button(action: option.action) {
                    SettingButton(title: option.title)
                }
            }
            
            Spacer()
        }
    }
}

struct SettingOption: Identifiable {
    let id = UUID()
    let title: String
    let action: () -> Void
}

#Preview {
    SettingsView()
}
