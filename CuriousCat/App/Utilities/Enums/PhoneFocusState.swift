//
//  PhoneFocusState.swift
//  CuriousCat
//
//  Created by Artur Marchetto on 18/06/2023.
//

import Foundation
import UIKit

@frozen
enum PhoneFocusState: TextFieldTypeProviding {
    case smsCode

    var placeholder: String { "Enter SMS code" }
    var errorMsg: String { "Enter a 6 digit code" }
    var textContentType: UITextContentType { .telephoneNumber }
    var keyboardType: UIKeyboardType { .phonePad }
}
