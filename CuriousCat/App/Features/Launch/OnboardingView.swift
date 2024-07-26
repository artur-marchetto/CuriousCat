//
//  OnboardingView.swift
//  CuriousCat
//
//  Created by Artur Marchetto on 18/06/2023.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var currentView: AppView

    var body: some View {
        NavigationView {

            VStack {
                welcomeCatImage

                VStack(alignment: .leading, spacing: 20) {
                    onboardingText

                    Spacer()

                    getStartedButton
                }.padding()

                Spacer()
            }

            .navigationTitle("Oh Welcome!")
        }
    }

    private var welcomeCatImage: some View {
        Image("welcome-cat")
            .resizable()
            .scaledToFit()
            .cornerRadius(30)
            .padding(.horizontal, 60)
            .padding(20)
            .shadow(color: .gray, radius: 4, x: 4, y: 4)
            .shadow(color: .gray.opacity(0.5), radius: 2, x: -2, y: -2)
    }

    private var onboardingText: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Here is a picture of a happy cat.")
                .font(.headline)
                .multilineTextAlignment(.leading)

            Text("You will not get to do much in this app 🤷🏻‍♂️")
                .font(.headline)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 20)

            Text("But if you are curious, you can signup using your phone number and email address.")
                .italic()
                .multilineTextAlignment(.leading)

            Text("But remember that curiosity killed the cat !")
                .italic()
                .padding(.bottom, 20)

            Text("Enjoy him while you can.")
                .italic()
                .font(.headline)
        }
    }

    private var getStartedButton: some View {
        PrimaryButton(
            label: "Get Started",
            action: {
                currentView = .signup
            }
        )
        .padding(.bottom, 20)
    }
}
