//
//  HomeView.swift
//  CuriousCat
//
//  Created by Artur Marchetto on 18/06/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {

            VStack(spacing: 20) {
                Spacer()

                Text("Well, you made it.")
                    .font(.headline)

                Text("No more happy cat now.")
                    .font(.headline)

                Spacer()

                notificationInformation

                scheduleNotificationButton
                    .padding(.bottom, 20)
            }.padding()

                .navigationTitle("Home")
        }
        .onAppear(perform: viewModel.onAppear)
    }

    private var scheduleNotificationButton: some View {
        PrimaryButton(
            label: "Schedule Notification",
            isEnabled: viewModel.isScheduleNotificationButtonEnabled,
            action: viewModel.scheduleNotification
        )
    }

    private var notificationInformation: some View {
        VStack(spacing: 10) {
            Text("Please lock your device to see the notification")
                .font(.headline.weight(.regular))
                .foregroundColor(.gray)

            Text("Will be sent in 5 seconds")
                .font(.headline.weight(.light))
                .foregroundColor(.gray)
        }
    }
}
