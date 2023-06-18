//
//  PhoneVerificationViewModel.swift
//  CuriousCat
//
//  Created by Artur Marchetto on 18/06/2023.
//

import SwiftUI

final class PhoneVerificationViewModel: ObservableObject {
    @Binding private var currentView: AppView
    private var verificationID: String

    @Published var smsCode = ""

    init(
        currentView: Binding<AppView>,
        verificationID: String
    ) {
        self._currentView = currentView
        self.verificationID = verificationID
    }

    // MARK: - Functions
    func isSMSCodeValid() -> Bool {
        smsCode.count == 6
    }

    func signUserIn() {
        Task {
            do {
                let authService = AuthService()
                print("march codes", smsCode, verificationID)
                try await authService.signUserIn(
                    smsCode: smsCode,
                    verificationID: verificationID
                )

                DispatchQueue.main.async { [weak self] in
                    self?.currentView = .home
                }
            } catch {
                // Usually would show error to user
                print("Error occurred singing user in", error)
            }
        }
    }
}
