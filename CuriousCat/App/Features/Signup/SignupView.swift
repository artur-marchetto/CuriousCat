//
//  SignupView.swift
//  CuriousCat
//
//  Created by Artur Marchetto on 18/06/2023.
//

import SwiftUI

struct SignupView: View {
    @StateObject private var viewModel = SignupViewModel()

    @Binding var currentView: AppView

    @FocusState private var focusState: SignupFocusState?

    var body: some View {
        NavigationView {

            VStack(alignment: .leading) {

                signupText

                VStack(alignment: .leading, spacing: 30) {
                    emailTextfield
                    phoneNumberTextfield
                    termsConditions
                }

                Spacer()

                signupButton
                    .padding(.bottom, 20)
            }
            .padding()
            .sheet(isPresented: $viewModel.showPhoneVerification) {
                PhoneVerificationView(
                    currentView: $currentView,
                    phone: viewModel.phone,
                    verificationID: viewModel.verificationID
                )
            }
            .navigationTitle("Create your account")
            .navigationViewStyle(.stack)
        }.onTapGesture(perform: UIApplication.hideKeyboard)
    }

    // MARK: - Views

    private var signupText: some View {
        Text("If you are really so curious, then sign up.")
            .font(.body.weight(.medium))
            .padding(.top, 50)
            .padding(.bottom, 30)
    }

    private var emailTextfield: some View {
        CuriousTextField(
            text: $viewModel.email,
            currentFocus: $focusState,
            focusType: .email,
            isValid: viewModel.isEmailValid
        )
        .submitLabel(.next)
        .onSubmit {
            focusState = .phone
        }
    }

    private var phoneNumberTextfield: some View {
        CuriousTextField(
            text: $viewModel.phone,
            currentFocus: $focusState,
            focusType: .phone,
            isValid: viewModel.isPhoneNumberValid
        )
        .submitLabel(.done)
    }

    private var termsConditions: some View {
        HStack {
            CheckBoxView(checked: $viewModel.isTermsOfServiceAccepted)
                .contentShape(Rectangle())
                .buttonStyle(PlainButtonStyle())

            HStack(spacing: 4) {
                Text("I agree to the")
                    .font(.footnote.weight(.medium))

                NavigationLink(destination: TermsOfServiceView()) {
                    Text("Terms of Service")
                        .underline()
                        .font(.footnote.weight(.medium))
                        .foregroundColor(.blue)
                }
            }
            .fixedSize(horizontal: true, vertical: false)
            .font(.system(size: 12))
        }
    }

    private var signupButton: some View {
        PrimaryButton(
            label: "Sign Up",
            isEnabled: viewModel.isSignupEnabled(),
            action: viewModel.sendVerificationCodeToPhoneNumber
        )
    }
}
