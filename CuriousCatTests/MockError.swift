//
//  MockError.swift
//  CuriousCatTests
//
//  Created by Artur Marchetto on 18/06/2023.
//

import Foundation

enum MockError: LocalizedError {
    case stub

    var errorDescription: String? {
        switch self {
        case .stub:
            return "stub"
        }
    }
}
