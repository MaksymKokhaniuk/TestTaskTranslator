//
//  ContentView.swift
//  TestTaskTranslator
//
//  Created by MaxK on 07.02.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TranslatorViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.mainBG]),
                           startPoint: .top,
                           endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                if viewModel.currentScreen == .translator {
                    if !viewModel.isTranslating && viewModel.translationResult == nil && !viewModel.isTranslationCompleted {
                        VStack(spacing: 16) {
                            Text("Translator")
                                .font(.customfont(.regular, fontSize: 32))
                            HStack {
                                TranslationToggleButton(viewModel: viewModel)
                            }
                            Spacer()
                        }
                        .padding(.top, 20)
                    }
                    
                    Spacer()
                    
                    if viewModel.isTranslating {
                        VStack(spacing: 48) {
                            ProcessingView(viewModel: viewModel)
                            BottomBarView(viewModel: viewModel)
                        }
                        .transition(.opacity)
                    } else if let translationResult = viewModel.translationResult {
                        TranslationResultView(viewModel: viewModel, translationResult: translationResult)
                    } else if viewModel.isTranslationCompleted {
                        TranslationResultView(viewModel: viewModel, translationResult: nil)
                    } else {
                        VStack(spacing: 48) {
                            HStack(spacing: 32) {
                                MicrophoneButton(viewModel: viewModel)
                                ChangePetButton(viewModel: viewModel)
                            }
                            
                            Image(viewModel.selectedPet.rawValue)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 184, height: 184)
                            
                            BottomBarView(viewModel: viewModel)
                        }
                    }
                } else {
                    SettingsView()
                    
                    BottomBarView(viewModel: viewModel)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
