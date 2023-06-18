//
//  SignupViewModel.swift
//  CuriousCat
//
//  Created by Artur Marchetto on 18/06/2023.
//

import Foundation
import UIKit

final class SignupViewModel: ObservableObject {
    @Published var email = ""
    @Published var phone = ""
    @Published var verificationID = ""
    @Published var showPhoneVerification = false
    @Published var isTermsOfServiceAccepted = false

    // Could improve the phone number validation
    // but for time constraints, decided to go with a simpler implementation
    func isPhoneNumberValid() -> Bool {
        phone.count >= 10
    }

    func isEmailValid() -> Bool {
        // Validate email with regex
        email.isEmailValid()
    }

    func isSignupEnabled() -> Bool {
        isPhoneNumberValid() &&
        isEmailValid() &&
        isTermsOfServiceAccepted
    }

    func sendVerificationCodeToPhoneNumber() {
        // In this case we are hardcoding the extension.
        // Usually you would have a list of all countries with corresponding extension.
        // And the use can pick the right extension.
        let phoneWithExtension = "+44" + phone
        Task {
            do {
                let authService = AuthService()

                // Ideally we would save the verificationID in UserDefaults, in case the user
                // quits the app to check the SMS code. Unlikely but to keep in mind.
                //
                // When they come back, we have the saved verificationID and we can go
                // directly to signup view and make the user skip onboarding.
                let verificationID = try await authService.sendVerificationCode(to: phoneWithExtension)

                DispatchQueue.main.async { [weak self] in
                    self?.verificationID = verificationID
                    self?.showPhoneVerification = true
                }
            } catch {
                // Usually would show error to user
                print("Error occurred sending verification code", error)
            }
        }
    }
}
