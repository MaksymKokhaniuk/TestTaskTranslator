//
//  MicrophoneButton.swift
//  TestTaskTranslator
//
//  Created by MaxK on 07.02.2025.
//

import SwiftUI

struct MicrophoneButton: View {
    @ObservedObject var viewModel: TranslatorViewModel
    
    var body: some View {
        Button {
            viewModel.toggleSpeaking()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 178, height: 176)
                    .foregroundColor(Color.White)
                    .shadow(color: Color.black.opacity(0.25), radius: 14.3, x: 0, y: 4)
                
                VStack(spacing: -6) {
                    if viewModel.isSpeaking {
                        AudioVisualizerView()
                            .frame(width: 178, height: 120)
                        Text("Stop Recording")
                    } else if viewModel.isTranslating {
                        ProgressView()
                            .frame(width: 178, height: 120)
                    } else {
                        Image("microphone")
                            .frame(width: 178, height: 120)
                        Text("Start Speak")
                    }
                }
                .font(.customfont(.regular, fontSize: 16))
                .foregroundColor(Color.primaryText)
                .animation(.easeInOut(duration: 0.3), value: viewModel.isSpeaking || viewModel.isTranslating)
            }
        }
    }
}

#Preview {
    MicrophoneButton(viewModel: TranslatorViewModel())
}
