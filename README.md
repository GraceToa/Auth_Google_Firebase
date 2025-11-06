<table align="center"><tr><td align="center" width="9999">

# Authentication with Firebase and Google (iOS - SwiftUI)

</td></tr></table>

[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org)
[![Platform](https://img.shields.io/badge/platform-iOS-blue.svg)](https://developer.apple.com/ios/)
[![Firebase](https://img.shields.io/badge/Firebase-Enabled-yellow.svg)](https://firebase.google.com)
A clean and testable <strong> Swift authentication app </strong> using <strong> Firebase </strong>

## ✨ Features

- 🔑 Login with **Google Sign-In**
- 📧 Login with **Firebase Email & Password**
- 🔁 Restore user session on app launch
- 🚪 Logout functionality
- 🧪 **Unit tests with mock providers**
- 📐 Clean MVVM separation of concerns

---

## 🧱 Architecture Overview

| Layer           | Components                                                                 |
|----------------|------------------------------------------------------------------------------|
| **ViewModel**   | `AuthViewModel` – Handles logic and state                                   |
| **Providers**   | `FirebaseAuthProvider`, `GoogleAuthProvider`, `CombinedAuthProvider`        |
| **Protocols**   | `AuthProviderProtocol`, `FirebaseAuthProviderProtocol`, `GoogleAuthProviderProtocol` |
| **Models**      | `AuthUser`, `AuthCredentials`, `AuthError`                                  |
| **Mocks**       | `MockFirebaseAuthProvider`, `MockGoogleAuthProvider`                        |

---

## 🧪 Unit Testing

Includes testable mock implementations for both providers:

- ✅ Simulate successful login, sign-up, logout, and session restore
- ❌ Simulate failures (wrong password, network error, etc.)
- 🔁 Fully test `AuthViewModel` without depending on Firebase or Google SDK

---

## 🚀 Usage

1. Set up Firebase in your app and add `GoogleService-Info.plist`
2. Configure `GIDSignIn.sharedInstance` in your AppDelegate or SwiftUI lifecycle
3. Inject your providers into `AuthViewModel`:


## 📸 Screenshots
![Descripción opcional](https://private-user-images.githubusercontent.com/10947013/463809984-647c689b-45d9-4a4a-aa68-edcd159eefc8.png)

<table border="3" bordercolor="black" align="center">
    <tr>
        <th colspan="2">Firebase (Email - Password) && Google in iPhone 16 Pro</th> 
    </tr>
    <tr>
        <td><<img width="250" alt="Image" src="https://github.com/user-attachments/assets/647c689b-45d9-4a4a-aa68-edcd159eefc8" /></td>
        <td><<img width="250" alt="Image" src="https://github.com/user-attachments/assets/351f7782-80ae-4810-8e5b-a334f68fdfac" />></td>
        <td><<img width="250" alt="Image" src="https://github.com/user-attachments/assets/ef48278e-015f-4120-ae39-6a9b08f15f0b" />></td>
    </tr>
    <tr>
        <td><<img width="250" alt="Image" src="https://github.com/user-attachments/assets/bb38c275-be17-403f-930c-cbbbf6dd04e2" />></td>
        <td> <<img width="250" alt="Image" src="https://github.com/user-attachments/assets/08cbecbc-562a-4ddf-9fe5-d4da057f626d" />></td>     
        <td><<img width="250" alt="Image" src="https://github.com/user-attachments/assets/14d0dcf5-738e-4ed6-b1fb-6acb8b0ad7bf" />></td>
    </tr>
    <tr>
        <td><<img width="250" alt="Image" src="https://github.com/user-attachments/assets/4af3fdfa-8b1f-49f1-9a3d-c6bb869098f5" />></td>
        <td> <<img width="250" alt="Image" src="https://github.com/user-attachments/assets/7e8455f7-4237-4c9a-8fe4-ed25b786b7f3" />></td>
    </tr>
      
</table>


👩‍💻 Author

Made with ❤️ by Grace
iOS Developer
-  gracetoa29@gmail
-  https://www.linkedin.com/in/grace-toa/


---

## Licencia
MIT License.
Use it freely in your apps and feel free to contribute!
---
