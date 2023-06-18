//
//  CuriousTextField.swift
//  CuriousCat
//
//  Created by Artur Marchetto on 18/06/2023.
//

import SwiftUI

protocol TextFieldTypeProviding: Hashable {
    var placeholder: String { get }
    var errorMsg: String { get }
    var textContentType: UITextContentType { get }
    var keyboardType: UIKeyboardType { get }
}

enum TextFieldState {
    case idle, focused, error
}

enum HighlightColorType {
    case border, label
}

struct CuriousTextField<FocusType>: View where FocusType: TextFieldTypeProviding {
    private var text: Binding<String>
    private var currentFocus: FocusState<FocusType?>.Binding
    private let focusType: FocusType
    private let isValid: () -> Bool
    private let textInputAutoCapitalization: TextInputAutocapitalization
    private let backgroundColor = Color.white

    @State private var showRegularTextfield = true

    private var isErrorState: Bool {
        highlightColor(.label) == .red
    }

    private var isPlaceholderInAttic: Bool {
        currentFocus.wrappedValue == focusType ||
        !text.wrappedValue.isEmpty
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            ZStack(alignment: .leading) {
                borderedTextfield

                Text(focusType.placeholder)
                    .foregroundColor(highlightColor(.label))
                    .padding(.horizontal, 2)
                    .background(backgroundColor)
                    .offset(x: 10, y: isPlaceholderInAttic ? -28 : 0)
                    .font(isPlaceholderInAttic ? .footnote : .callout)
                    .animation(.easeOut, value: isPlaceholderInAttic)
            }
            .onTapGesture {
                currentFocus.wrappedValue = focusType
            }

            if isErrorState {
                Text(focusType.errorMsg)
                    .font(.footnote)
                    .foregroundColor(.red)
            }
        }
    }

    var borderedTextfield: some View {
        HStack {
            textfield

            if isErrorState {
                Image(systemName: "exclamationmark.circle.fill")
                    .foregroundColor(.red)
                    .padding(.leading, isErrorState ? 5 : 0)
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 12)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(highlightColor(.border), lineWidth: 1.5)
        )
    }

    var textfield: some View {
        TextField("", text: text)
            .focused(currentFocus, equals: focusType)
            .disableAutocorrection(true)
            .textInputAutocapitalization(textInputAutoCapitalization)
            .textContentType(focusType.textContentType)
            .keyboardType(focusType.keyboardType)
    }

    init(
        text: Binding<String>,
        currentFocus: FocusState<FocusType?>.Binding,
        focusType: FocusType,
        isValid: @escaping () -> Bool = { true },
        textInputAutoCapitalization: TextInputAutocapitalization = .never
    ) {
        self.text = text
        self.currentFocus = currentFocus
        self.focusType = focusType
        self.isValid = isValid
        self.textInputAutoCapitalization = textInputAutoCapitalization
    }

    private func highlightColor(_ type: HighlightColorType) -> Color {
        var state: TextFieldState = .idle

        if currentFocus.wrappedValue == focusType {
            state = .focused
        } else {
            state = .idle

            if !text.wrappedValue.isEmpty, !isValid() {
                state = .error
            }
        }

        switch state {
        case .idle:
            return type == .label ? .gray : .init(uiColor: .lightGray)

        case .focused:
            return .primary

        case .error:
            return .red
        }
    }
}
