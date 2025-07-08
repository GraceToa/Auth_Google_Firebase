<table align="center"><tr><td align="center" width="9999">

# Authentication with Firebase and Google (iOS - SwiftUI)

<img src="Resources/zero.png" align="center" width="250" alt="Project icon">
![Login UI]([https://github.com/GraceToa/Auth_Google_Firebase/issues/1#issue-3213286041])



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

```swift
let viewModel = AuthViewModel(
    authProvider: CombinedAuthProvider(
        firebaseProvider: FirebaseAuthProvider(),
        googleProvider: GoogleAuthProvider(signInInstance: GIDSignIn.sharedInstance)
    )
)


## Estructura del proyecto 

<table border="3" bordercolor="black" align="center">
    <tr>
        <th colspan="2">UI display in Redmi Note 13</th> 
    </tr>
    <tr>
        <td><img alt="Image" width="250" src="https://private-user-images.githubusercontent.com/10947013/463809984-647c689b-45d9-4a4a-aa68-edcd159eefc8.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTE5OTcwMTAsIm5iZiI6MTc1MTk5NjcxMCwicGF0aCI6Ii8xMDk0NzAxMy80NjM4MDk5ODQtNjQ3YzY4OWItNDVkOS00YTRhLWFhNjgtZWRjZDE1OWVlZmM4LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA3MDglMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNzA4VDE3NDUxMFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWE1Mjc3MDJmYTkwZWY4OWZiY2M4MTNjMmMxNDFhYzI3YjliNjdjNGU2M2RlZDc1YmZhYTdlYWJlZDhlZGQzM2EmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.0nm036TJcI7gh-vbdhl69CelxdD4O_v_Gf6kQmAdNvs"></td> 
    </tr>
    <tr>
        <td><img src="Resources/two.png"  width="250" alt="Create"></td>
        <td><img src="Resources/three.png"  width="250" alt="Detail"></td>      
    </tr>
    <tr>
        <td><img src="Resources/four.png"  width="250" alt="Home"></td>
        <td><img src="Resources/five.png"  width="250" alt="Search"></td>
    </tr>
      
</table>


👩‍💻 Author

Made with ❤️ by Grace
Senior iOS Developer

    - Email: gracetoa29@gmail
    - Linkedin: https://www.linkedin.com/in/grace-toa/


---

## Licencia
MIT License.
Use it freely in your apps and feel free to contribute!
---
