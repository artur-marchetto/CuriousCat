//
//  PhoneVerificationView.swift
//  CuriousCat
//
//  Created by Artur Marchetto on 18/06/2023.
//

import SwiftUI

struct PhoneVerificationView: View {
    @Environment(\.dismiss) var dismiss

    @FocusState private var focusState: PhoneFocusState?
    @StateObject private var viewModel: PhoneVerificationViewModel

    @Binding private var currentView: AppView
    private var phone: String
    private var verificationID: String

    init(
        currentView: Binding<AppView>,
        phone: String,
        verificationID: String
    ) {
        self._currentView = currentView
        self.phone = phone
        self.verificationID = verificationID
        _viewModel = StateObject(
            wrappedValue: PhoneVerificationViewModel(
                currentView: currentView,
                verificationID: verificationID
            )
        )
    }

    var body: some View {
        NavigationView {

            VStack(alignment: .leading, spacing: 20) {
                sentCodeText
                phoneNumberView
                verificationCodeTextfield
                    .padding(.top, 20)

                Spacer()

                submitButton
            }
            .padding(.top, 30)
            .padding()
            .navigationTitle("Verify phone number")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }.onTapGesture(perform: UIApplication.hideKeyboard)
    }

    private var sentCodeText: some View {
        Text("We sent you an SMS code")
            .font(.title2.bold())
    }

    private var phoneNumberView: some View {
        HStack(spacing: 8) {
            Text("On number:")
                .font(.body)

            Text(phone)
                .font(.body.bold())
                .foregroundColor(.blue)
        }
    }

    private var verificationCodeTextfield: some View {
        CuriousTextField(
            text: $viewModel.smsCode,
            currentFocus: $focusState,
            focusType: .smsCode,
            isValid: viewModel.isSMSCodeValid
        )
        .submitLabel(.done)
        .onSubmit(viewModel.signUserIn)
    }

    private var submitButton: some View {
        PrimaryButton(
            label: "Submit",
            isEnabled: viewModel.isSMSCodeValid(),
            action: viewModel.signUserIn
        )
    }
}
