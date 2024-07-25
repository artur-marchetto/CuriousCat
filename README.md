
# 📱 Curious Cat Tech Test

Author: Artur Marchetto
Date: June 2023

# 👦🏻 User Flow Requirements

1. Open the app
2. Show a short descriptive page
3. Enter mobile number, email and accept ToS to signup
4. Enter a code received to your mobile number
5. Opt-in to push notifications
6. Schedule & receive a push notification

# 📚 Libraries

- FirebaseAuth(SPM) for Phone Number Sign In

# 🚀 Minimum Deployment

iOS 15.0

# 🎥 Demo Video

Demo video in repo

# 🏗️ Architecture

MVVM

Every view has a ViewModel to handle logic and store variables.
The app also contains some Utilities and standalone UI components.

# ⏳ Time constraints

The app only supports:
- light mode
- portait
- iPhone only

# ❓ Tests

- Some Unit tests included
- No UI tests due to time constraints

The API tested is very simple, and the tests are too.
However the general outline is there.

# 📱 How to run the App

- Use Xcode 14.3 Recommended
- Change Developer Team in Project Settings

Note:
You will need an Apple development certificate.
If not, you will need to create a new Developer Certificate using Xcode Settings, Accounts, Manage Certificates and create a new Developer Certificate.  

# 🙏🏻 Thank You


### 🔔 Technical Notes on Push Notifications

FirebaseAuth requires the iOS app to enable Push Notifications for PhoneNumber sign in.
This is because, to register a new device, it has to send a token in the form of a silent notification.
However to enable Push Notifications you need to create new Certificates on Apple Developer Website.
I do not have a personal, paid Apple Developer Account. Therefore I cannot create new Certificates or Keys for Push Notifications.

Luckily Firebase allows users to fallback on Captcha as a second method, if Push Notifications are disabled.
For this reason, when you click to **Sing Up** you will see a Captcha screen before being asked to enter the SMS verification code.
This is normal.
Usually the user wouldn't see this. Normally, with PushNotifications working, it would be a much smoother UserExperience.
But for the reason stated above, this is what the app is using. 
