//
//  HomeViewModel.swift
//  CuriousCat
//
//  Created by Artur Marchetto on 18/06/2023.
//

import Foundation
import UserNotifications

final class HomeViewModel: ObservableObject {
    @Published var isScheduleNotificationButtonEnabled = false

    // Usually you should ask the user permissions when they are needed and give a valid reason to avoid them being denied.
    // Or if you have many, put them all in one screen and give a good reason for each.
    // But here we can do onAppear.
    func onAppear() {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: options) { [weak self] success, error in
                guard success else {
                    if let error {
                        print("Error occurred while requesting notification access", error)
                    }
                    return
                }

                DispatchQueue.main.async {
                    self?.isScheduleNotificationButtonEnabled = true
                }
            }
    }

    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Curious Cat"
        content.subtitle = "You made it!"
        content.body = "There really isn't much to say but I hope you enjoyed the happy cat earlier."
        content.sound = .default

        let uuid = UUID().uuidString
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(
            identifier: uuid,
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request)
    }
}
