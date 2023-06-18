//
//  AuthService.swift
//  CuriousCat
//
//  Created by Artur Marchetto on 18/06/2023.
//

import Foundation
import FirebaseAuth
import SwiftUI

protocol AuthServicing {
    func sendVerificationCode(to phoneNumber: String) async throws -> String
    func signUserIn(smsCode: String, verificationID: String) async throws
}

final class AuthService: AuthServicing {
    @frozen enum AuthError: Error {
        case verificationID
    }

    // MARK: - Functions
    func sendVerificationCode(to phoneNumber: String) async throws -> String {
        return try await PhoneAuthProvider
            .provider()
            .verifyPhoneNumber(phoneNumber, uiDelegate: nil)
    }

    func signUserIn(smsCode: String, verificationID: String) async throws {
        guard !verificationID.isEmpty else {
            throw AuthError.verificationID
        }

        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: smsCode
        )

        try await Auth.auth().signIn(with: credential)

        // Could use return object to get user information.
        //
        // let result = try await Auth.auth().signIn(with: credential)
        //
        // Eg:
        // result.user.displayName
        // result.additionalUserInfo?.isNewUser
    }
}
