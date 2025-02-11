//
//  TranslatorViewModel.swift
//  TestTaskTranslator
//
//  Created by MaxK on 07.02.2025.
//

import SwiftUI

class TranslatorViewModel: ObservableObject {
    @Published var isSpeaking = false
    @Published var isTranslating = false
    @Published var isTranslationCompleted = false
    @Published var translationDirection: TranslationDirection = .humanToPet
    @Published var selectedPet: PetType = .dog
    @Published var currentScreen: Screen = .translator
    @Published var translationResult: String? = nil
    @Published var lastPlayedSound: String? = nil
    
    
    func toggleSpeaking() {
        if isSpeaking {
            isSpeaking = false
            startTranslation()
        } else {
            isSpeaking = true
            translationResult = nil
            isTranslationCompleted = false
        }
    }
    
    private func startTranslation() {
        isTranslating = true
        translationResult = nil
        isTranslationCompleted = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.isTranslating = false
            if self.translationDirection == .petToHuman {
                self.translationResult = self.selectRandomTranslation()
            } else {
                self.playAnimalSound()
                self.isTranslationCompleted = true
            }
        }
    }
    
    func resetToTranslator() {
        isTranslating = false
        translationResult = nil
        isTranslationCompleted = false
    }
    
    func playAnimalSound() {
        translationResult = selectedPet == .dog ? selectRandomDogSound() : selectRandomCatSound()
        SoundManager.shared.playSound(named: translationResult ?? "")
    }
    
    func repeatAnimalSound() {
        SoundManager.shared.playSound(named: translationResult ?? "")
    }
    
    func selectRandomTranslation() -> String {
        let translations = [
            "I’m hungry, feed me!",
            "What are you doing, human?",
            "I'm happy, pet me some more!",
            "Move away, this is my territory!",
            "I'm glad to see you!",
            "Let's go for a walk!"
        ]
        return translations.randomElement() ?? "I’m hungry, feed me!"
    }
    
    func selectRandomCatSound() -> String {
        let translationsCat = [
            "meow1.mp3",
            "meow2.mp3",
            "meow3.mp3",
            "meow4.mp3"
        ]
        
        return translationsCat.randomElement() ?? "meow1.mp3"
    }
    
    func selectRandomDogSound() -> String {
        let translationsDog = [
            "barking1.mp3",
            "barking2.mp3",
            "barking3.mp3",
            "barking4.mp3"
        ]
        
        return translationsDog.randomElement() ?? "barking1.mp3"
    }
    
    func switchTranslationDirection() {
        translationDirection = (translationDirection == .humanToPet) ? .petToHuman : .humanToPet
    }
    
    func switchPet() {
        selectedPet = (selectedPet == .dog) ? .cat : .dog
    }
    
    func switchScreen(to screen: Screen) {
        currentScreen = screen
    }
    
}

enum TranslationDirection {
    case humanToPet, petToHuman
}

enum PetType: String {
    case cat = "cat"
    case dog = "dog"
}

enum Screen {
    case translator, settings
}
