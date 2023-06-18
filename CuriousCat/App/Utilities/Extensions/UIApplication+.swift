//
//  UIApplication+.swift
//  CuriousCat
//
//  Created by Artur Marchetto on 18/06/2023.
//

import Foundation
import UIKit

extension UIApplication {
    static func hideKeyboard() {
        self.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
