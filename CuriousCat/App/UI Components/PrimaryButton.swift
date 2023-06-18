//
//  PrimaryButton.swift
//  CuriousCat
//
//  Created by Artur Marchetto on 18/06/2023.
//

import SwiftUI

struct PrimaryButton: View {
    private let label: String
    private let action: () -> Void
    private let isEnabled: Bool

    init(
        label: String,
        isEnabled: Bool = true,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.action = action
        self.isEnabled = isEnabled
    }

    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Color.blue.opacity(isEnabled ? 1 : 0.4)

                Text(label)
                    .foregroundColor(.white)
                    .font(.headline.bold())
                    .padding()
            }
            .frame(height: 50)
            .cornerRadius(8)
        }.disabled(!isEnabled)
    }
}
