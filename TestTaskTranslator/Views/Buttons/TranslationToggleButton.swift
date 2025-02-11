//
//  TranslationToggleButton.swift
//  TestTaskTranslator
//
//  Created by MaxK on 07.02.2025.
//

import SwiftUI

struct TranslationToggleButton: View {
    @ObservedObject var viewModel: TranslatorViewModel
    
    var body: some View {
        HStack {
            HStack {
                Text(viewModel.translationDirection == .humanToPet ? "HUMAN" : "PET")
                    .font(.customfont(.regular, fontSize: 16))
                    .frame(width: 135)
                Button {
                    viewModel.switchTranslationDirection()
                } label: {
                    Image("arrow-swap-horizontal")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 24, height: 24)
                }
                
                Text(viewModel.translationDirection == .humanToPet ? "PET" : "HUMAN")
                    .font(.customfont(.regular, fontSize: 16))
                    .frame(width: 135)
            }
        }
    }
}

#Preview {
    TranslationToggleButton(viewModel: TranslatorViewModel())
}
