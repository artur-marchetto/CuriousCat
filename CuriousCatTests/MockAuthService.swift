//
//  MockAuthService.swift
//  CuriousCatTests
//
//  Created by Artur Marchetto on 18/06/2023.
//

@testable import CuriousCat

final class MockAuthService: AuthServicing {

    var didCallSendVerificationCode = false
    var didCallSignUserIn = false

    var stubSendVerificationCodeError: Error?
    var stubSignUserInError: Error?

    var stubVerificationID: String?

    func sendVerificationCode(to phoneNumber: String) async throws -> String {
        didCallSendVerificationCode = true

        if let stubSendVerificationCodeError {
            throw stubSendVerificationCodeError
        }

        // I know forced unwrapping is bad practice, but in tests I think
        // it's justified and should be encouraged because it is the developer's error
        // so the app will crash instead of throwing an error.
        return stubVerificationID!
    }

    func signUserIn(smsCode: String, verificationID: String) async throws {
        didCallSignUserIn = true

        if let stubSignUserInError {
            throw stubSignUserInError
        }

        // some APIs will let you unit test that smsCode is the same as verificationID
    }
}
