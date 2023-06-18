//
//  CheckBox.swift
//  CuriousCat
//
//  Created by Artur Marchetto on 18/06/2023.
//

import SwiftUI

struct CheckBoxView: View {
    @Binding var checked: Bool

    var body: some View {
        Button {
            checked.toggle()
        } label: {
            buttonContent
        }
    }

    @ViewBuilder
    private var buttonContent: some View {
        HStack {
            Image(systemName: checked ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(checked ? Color.blue : Color.gray)
        }
    }
}
