//
//  AuthServiceTests.swift
//  CuriousCatTests
//
//  Created by Artur Marchetto on 18/06/2023.
//

@testable import CuriousCat

import XCTest

final class AuthServiceTests: XCTestCase {
    private var mockedAuthService: MockAuthService!

    override func setUp() {
        super.setUp()

        mockedAuthService = MockAuthService()
    }

    // MARK: - Send Verification Code

    func testSuccess_sendVerificationCode() {
        let stubCode = "123123"
        mockedAuthService.stubVerificationID = stubCode

        Task {
            do {
                let code = try await mockedAuthService.sendVerificationCode(to: "07407039666")

                XCTAssert(!code.isEmpty)
                XCTAssertEqual(code, stubCode)
                XCTAssert(mockedAuthService.didCallSendVerificationCode)
            } catch {
                XCTAssertThrowsError(error.localizedDescription)
            }
        }
    }

    func testFailure_sendVerificationCode() {
        let stubCode = "123123"
        mockedAuthService.stubVerificationID = stubCode
        mockedAuthService.stubSendVerificationCodeError = MockError.stub

        Task {
            do {
                let code = try await mockedAuthService.sendVerificationCode(to: "07407039666")

                XCTAssert(code.isEmpty)
                XCTAssert(false)
                XCTAssertFalse(mockedAuthService.didCallSendVerificationCode)
            } catch {
                XCTAssertNotNil(error)
            }
        }
    }

    // MARK: - Sign User In

    func testSuccess_signUserIn() {
        Task {
            do {
                try await mockedAuthService.signUserIn(
                    smsCode: "123123",
                    verificationID: "123123"
                )

                XCTAssert(mockedAuthService.didCallSignUserIn)
            } catch {
                XCTAssertThrowsError(error.localizedDescription)
            }
        }
    }

    func testFailure_signUserIn() {
        mockedAuthService.stubSignUserInError = MockError.stub

        Task {
            do {
                try await mockedAuthService.signUserIn(
                    smsCode: "123123",
                    verificationID: "123123"
                )

                XCTAssertFalse(mockedAuthService.didCallSignUserIn)
            } catch {
                XCTAssertNotNil(error)
            }
        }
    }
}
