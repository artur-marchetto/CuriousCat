//
//  RootView.swift
//  CuriousCat
//
//  Created by Artur Marchetto on 18/06/2023.
//

import SwiftUI

struct RootView: View {
    @State private var currentView = AppView.onboarding

    var body: some View {
        targetView
    }

    // Keep body clean and use small size opaque variables for views
    @ViewBuilder
    private var targetView: some View {
        switch currentView {
        case .onboarding:
            OnboardingView(currentView: $currentView)

        case .signup:
            SignupView(currentView: $currentView)

        case .home:
            HomeView()
        }
    }
}
