//
//  BottomBarView.swift
//  TestTaskTranslator
//
//  Created by MaxK on 07.02.2025.
//

import SwiftUI

struct BottomBarView: View {
    @ObservedObject var viewModel: TranslatorViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 216, height: 82)
                .foregroundColor(Color.White)
                .shadow(color: Color.shadowColor.opacity(0.15), radius: 80, x: 0, y: 0)
            
            HStack(spacing: 60) {
                
                Button {
                    viewModel.switchScreen(to: .translator)
                } label: {
                    VStack(spacing: 4) {
                        Image("messages")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 24, height: 24)
                            .foregroundColor(viewModel.currentScreen == .translator ? Color.primaryText : Color.gray)
                        Text("Translator")
                            .font(.customfont(.regular, fontSize: 12))
                            .foregroundColor(viewModel.currentScreen == .translator ? Color.primaryText : Color.gray)
                    }
                }
                
                Button {
                    viewModel.switchScreen(to: .settings)
                } label: {
                    VStack(spacing: 4) {
                        Image("settings")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 24, height: 24)
                            .foregroundColor(viewModel.currentScreen == .translator ? Color.gray : Color.primaryText)
                        Text("Clicker")
                            .font(.customfont(.regular, fontSize: 12))
                            .foregroundColor(viewModel.currentScreen == .translator ? Color.gray : Color.primaryText)
                    }
                }
            }
        }
        
    }
}

#Preview {
    BottomBarView(viewModel: TranslatorViewModel())
}
