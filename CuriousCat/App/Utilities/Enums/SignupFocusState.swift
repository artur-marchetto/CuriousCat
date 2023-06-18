//
//  SignupFocusState.swift
//  CuriousCat
//
//  Created by Artur Marchetto on 18/06/2023.
//

import Foundation
import UIKit

@frozen
enum SignupFocusState: TextFieldTypeProviding {
    case email, phone

    var placeholder: String {
        switch self {
        case .email:
            return "Enter your e-mail"

        case .phone:
            return "Enter a UK phone number (no extension)"
        }
    }

    var errorMsg: String {
        switch self {
        case .email:
            return "Enter a valid e-mail"

        case .phone:
            return "Enter a valid phone number"
        }
    }

    var textContentType: UITextContentType {
        switch self {
        case .email:
            return .emailAddress

        case .phone:
            return .telephoneNumber
        }
    }

    var keyboardType: UIKeyboardType {
        switch self {
        case .email:
            return .emailAddress

        case .phone:
            return .phonePad
        }
    }
}
