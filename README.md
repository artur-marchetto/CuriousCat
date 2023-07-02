
# 📱 Curious Cat Tech Test

Author: Artur Marchetto
Date: June 2023

# 👦🏻 User Flow Requirements

1. Opens the app
2. Sees a screen explaining about the app
3. Enters mobile number, email and accepts T&Cs to register
4. Enters a code received at their mobile number
5. Opts in to push notifications

# 📚 Libraries

I added FirebaseAuth with SPM to enable Phone Number Sign In.

# 🚀 Minimum Deployment

iOS 15.0

# 🎥 Video

A video of the app running is attached.

# 🏗️ Architecture

MVVM

Every view has a corresponding ViewModel that handles logic and variables.
The app also contains some Utilities and standalone UI components.

# ⏳ Notes of time

The app only supports light mode.
Due to time, I had to limit the scope of the project.
Same goes for landscape mode and iPad support.
These have not been tested or implemented for the same reason.
iPad should work as normal, however User Experience may not be the most beautiful.

# 🔔 Notes on Push Notifications

FirebaseAuth requires the iOS app to enable Push Notifications for PhoneNumber sign in.
This is because, to register a new device, it has to send a token in the form of a silent notification.
However to enable Push Notifications you need to create new Certificates on Apple Developer Website.
I do not have a personal, paid Apple Developer Account. Therefore I cannot create new Certificates or Keys for Push Notifications.

Luckily Firebase allows users to fallback on Captcha as a second method, if Push Notifications are disabled.
For this reason, when you click to **Sing Up** you will see a Captcha screen before being asked to enter the SMS verification code.
This is normal.
Usually the user wouldn't see this. Normally, with PushNotifications working, it would be a much smoother UserExperience.
But for the reason stated above, this is what the app is using. 

# ❓ Testing

I have added some unit tests in the format that I would normally test classes.
The outline is there, however they are simple due to the nature of the API.
I have not added any UI tests as they are slow to write and generally provide little benefit.
Usually QA will write them or better options exist like Snapshot testing.

# 📱 How to run the App

TestFlight is the default way to deploy iOS apps but unfortunately there is no time for Apple to approve the app and deploy it, so it will have to be done using Xcode.
You should be logged into your Apple Developer account on Xcode and use Xcode 14 or above.

Automatic signing is enabled however you will have to change developer team.
Go to Project Settings by clicking on the Blue icon at the top left called "Curious Cat", Under Targets, select "Curious Cat" and then select "Signing and Capabilities"
You will see some errors.
Change the Team to your own and run the app.

Note:
Apple requires a development certificate to run and it should all work automatically.
If not, you will need to create a new Developer Certificate using Xcode Settings, Accounts, Manage Certificates and create a new Developer Certificate.  

# 🙏🏻 Thank You

Thank you for giving me this chance and I hope you enjoyed the app.
Artur.
