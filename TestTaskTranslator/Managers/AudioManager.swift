//
//  AudioManager.swift
//  TestTaskTranslator
//
//  Created by MaxK on 07.02.2025.
//

import Foundation
import AVFAudio

class AudioManager: NSObject, ObservableObject {
    private var audioRecorder: AVAudioRecorder!
    private var timer: Timer?
    @Published var audioLevels: [Float] = Array(repeating: 0.5, count: 30)
    
    override init() {
        super.init()
        setupAudioRecorder()
    }
    
    private func setupAudioRecorder() {
        let audioSession = AVAudioSession.sharedInstance()
        try? audioSession.setCategory(.playAndRecord, mode: .default, options: [.defaultToSpeaker, .allowBluetooth])
        try? audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        
        let settings: [String: Any] = [
            AVFormatIDKey: kAudioFormatAppleLossless,
            AVSampleRateKey: 44100.0,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue
        ]
        
        let url = URL(fileURLWithPath: "/dev/null")
        try? audioRecorder = AVAudioRecorder(url: url, settings: settings)
        audioRecorder.isMeteringEnabled = true
    }
    
    func startMonitoring() {
        audioRecorder.record()
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
            self.audioRecorder.updateMeters()
            let power = self.audioRecorder.averagePower(forChannel: 0)
            let level = self.normalizedPowerLevel(from: power) * 2.5 // Increase sensitivity
            DispatchQueue.main.async {
                self.audioLevels.append(level)
                if self.audioLevels.count > 30 {
                    self.audioLevels.removeFirst()
                }
            }
        }
    }
    
    func stopMonitoring() {
        timer?.invalidate()
        audioRecorder.stop()
    }
    
    private func normalizedPowerLevel(from decibels: Float) -> Float {
        let minDb: Float = -80.0
        if decibels < minDb {
            return 0.0
        } else {
            return pow(10.0, (decibels / 20.0))
        }
    }
}
