//
//  ProcessingView.swift
//  TestTaskTranslator
//
//  Created by MaxK on 09.02.2025.
//

import SwiftUI

struct ProcessingView: View {
    @ObservedObject var viewModel: TranslatorViewModel
    
    var body: some View {
        VStack(spacing: 48) {
            Text("Process of translation...")
                .font(.customfont(.regular, fontSize: 18))
                .padding(.bottom, 20)

            Image(viewModel.selectedPet.rawValue)
                .resizable()
                .scaledToFill()
                .frame(width: 184, height: 184)
        }
    }
}

#Preview {
    ProcessingView(viewModel: TranslatorViewModel())
}
