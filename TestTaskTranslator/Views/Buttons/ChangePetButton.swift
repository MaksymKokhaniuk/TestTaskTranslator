//
//  ChangePetButton.swift
//  TestTaskTranslator
//
//  Created by MaxK on 07.02.2025.
//

import SwiftUI

struct ChangePetButton: View {
    @ObservedObject var viewModel: TranslatorViewModel
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 107, height: 176)
                .foregroundColor(Color.White)
                .shadow(color: Color.black.opacity(0.25), radius: 14.3, x: 0, y: 4)
            VStack(spacing: 16) {
                Button {
                    viewModel.selectedPet = .cat
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color.catSelected)
                        Image("cat")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                    .opacity(viewModel.selectedPet == .cat ? 1 : 0.6)
                    .shadow(color: Color.shadowColor.opacity(0.1), radius: 40, x: 0, y: 20)
                }
                
                Button {
                    viewModel.selectedPet = .dog
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 70, height: 70)
                            .foregroundColor(Color.dogSelected)
                        Image("dog")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                    }
                    .opacity(viewModel.selectedPet == .dog ? 1 : 0.6)
                }
            }
        }
    }
}

#Preview {
    ChangePetButton(viewModel: TranslatorViewModel())
}
