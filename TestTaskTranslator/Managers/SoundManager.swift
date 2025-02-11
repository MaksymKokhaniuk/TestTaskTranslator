//
//  SoundManager.swift
//  TestTaskTranslator
//
//  Created by MaxK on 09.02.2025.
//

import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    private var player: AVAudioPlayer?
    
    func playSound(named fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: nil) else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
