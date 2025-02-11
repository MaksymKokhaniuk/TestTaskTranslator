//
//  AudioVisualizerView.swift
//  TestTaskTranslator
//
//  Created by MaxK on 07.02.2025.
//

import SwiftUI

struct AudioVisualizerView: View {
    @ObservedObject var audioManager = AudioManager()
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 4) {
                ForEach(audioManager.audioLevels, id: \.self) { level in
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.blue)
                        .frame(width: (geometry.size.width / CGFloat(audioManager.audioLevels.count)) - 4,
                               height: max(min(CGFloat(level) * geometry.size.height, geometry.size.height * 0.7), 5))
                }
            }
            .frame(height: geometry.size.height)
        }
        .padding()
        .onAppear {
            audioManager.startMonitoring()
        }
        .onDisappear {
            audioManager.stopMonitoring()
        }
    }
}

#Preview {
    AudioVisualizerView()
}
