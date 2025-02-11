//
//  TranslationResultView.swift
//  TestTaskTranslator
//
//  Created by MaxK on 09.02.2025.
//

import SwiftUI

struct TranslationResultView: View {
    @ObservedObject var viewModel: TranslatorViewModel
    let translationResult: String?
    
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                
                HStack {
                    Button {
                        viewModel.resetToTranslator()
                    } label: {
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundColor(.white)
                            .overlay {
                                Image("close")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 28, height: 28)
                            }
                    }
                    
                    Spacer()
                    
                    Text("Result")
                        .font(.customfont(.regular, fontSize: 32))
                        .padding(.leading, -48)
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.top, 20)
            
            VStack(spacing: -60) {
                
                if viewModel.translationDirection == .petToHuman {
                    if let translationResult = translationResult {
                        SpeechBubbleView(text: translationResult)
                    }
                } else if viewModel.translationDirection == .humanToPet {
                    VStack {
                        Button {
                            viewModel.repeatAnimalSound()
                        } label: {
                            RepeatButton()
                        }
                    }
                }
                
                Image(viewModel.selectedPet.rawValue)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 184, height: 184)
                    .padding(.bottom, 122)
            }
            .onAppear {
                if viewModel.translationDirection == .humanToPet {
                    viewModel.playAnimalSound()
                }
            }
        }
    }
}

#Preview {
    TranslationResultView(viewModel: TranslatorViewModel(), translationResult: "I'm Hungry")
}
