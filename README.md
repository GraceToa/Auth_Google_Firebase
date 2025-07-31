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

<table border="3" bordercolor="black" align="center">
    <tr>
        <th colspan="2">Firebase (Email - Password) && Google in iPhone 16 Pro</th> 
    </tr>
    <tr>
        <td><img src="https://github.com/GraceToa/Auth_Google_Firebase/issues/1" alt="Image" width="250"></td>
        <td><img alt="Image" width="250" src="https://user-images.githubusercontent.com/10947013/463818566-ef48278e-015f-4120-ae39-6a9b08f15f0b.png"></td>
        <td><img src="https://user-images.githubusercontent.com/10947013/61404117-0eb9bf80-a8d7-11e9-89ff-7b07a5491101.png" width="50" ></td>
    </tr>
    <tr>
        <td><img alt="Image" width="250" src="https://private-user-images.githubusercontent.com/10947013/463821107-bb38c275-be17-403f-930c-cbbbf6dd04e2.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTE5OTc3NjksIm5iZiI6MTc1MTk5NzQ2OSwicGF0aCI6Ii8xMDk0NzAxMy80NjM4MjExMDctYmIzOGMyNzUtYmUxNy00MDNmLTkzMGMtY2JiYmY2ZGQwNGUyLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA3MDglMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNzA4VDE3NTc0OVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWVkYjc4YWNhODE1YmFmNTA1NThiODk0NTRjZmIwMDQxZjlhZWU3YzhhYTNlYjZkZDY1MzA3OTUwZDQ0YjEzMDkmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.L6sqvKo08XofrmVXkwMeKMPNogwIl2MfV38sCjVyOec"></td>
        <td> <img alt="Image" width="250" src="https://private-user-images.githubusercontent.com/10947013/463821742-08cbecbc-562a-4ddf-9fe5-d4da057f626d.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTE5OTc4ODEsIm5iZiI6MTc1MTk5NzU4MSwicGF0aCI6Ii8xMDk0NzAxMy80NjM4MjE3NDItMDhjYmVjYmMtNTYyYS00ZGRmLTlmZTUtZDRkYTA1N2Y2MjZkLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA3MDglMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNzA4VDE3NTk0MVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTgwNGQ1ODIxYTdjNzNiMjEwZTRhMjJlMmJjZGEwYjI3MjNlZGI4NWE3YTg0ZGU4MWUyMTVlYWRiY2VlM2MxNmQmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.MVjaE7FHJ9Lu02DmI0mazwHaXVtRtZ0C_j_JcBq1YAM"></td>     
        <td><img alt="Image" width="250" src="https://private-user-images.githubusercontent.com/10947013/463822066-14d0dcf5-738e-4ed6-b1fb-6acb8b0ad7bf.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTE5OTc5MzksIm5iZiI6MTc1MTk5NzYzOSwicGF0aCI6Ii8xMDk0NzAxMy80NjM4MjIwNjYtMTRkMGRjZjUtNzM4ZS00ZWQ2LWIxZmItNmFjYjhiMGFkN2JmLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA3MDglMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNzA4VDE4MDAzOVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTY3MDE4NjgyNjJjNmMwNmNmMTdmZjM3NGNlYzAyMGE3NTE4YzA1YmNjMGI2YWJjNDRmMDNiNzAzNTU1NzZjNTcmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.B4be88Gzkqo2bJY3k9jaz9c-EoxTQ1WLx_sbR7ehc7M"></td>
    </tr>
    <tr>
        <td><img alt="Image" width="250" src="https://private-user-images.githubusercontent.com/10947013/463822391-4af3fdfa-8b1f-49f1-9a3d-c6bb869098f5.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTE5OTc5OTgsIm5iZiI6MTc1MTk5NzY5OCwicGF0aCI6Ii8xMDk0NzAxMy80NjM4MjIzOTEtNGFmM2ZkZmEtOGIxZi00OWYxLTlhM2QtYzZiYjg2OTA5OGY1LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA3MDglMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNzA4VDE4MDEzOFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWUyNDA1ODUyMzRhMmQ5ZjBkOTlmZTk0N2M3NDU5ZmY5OTYyNjU4MTU3MTU1OWJiODBlNTgwODkxZDFiNzEyOGImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.6bSzq68Jk-ZQtuy9MTnaTwJBYpd8xq7JTjUfJP2RAUo"></td>
        <td> <img alt="Image" width="250" src="https://private-user-images.githubusercontent.com/10947013/463822872-7e8455f7-4237-4c9a-8fe4-ed25b786b7f3.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTE5OTgwNzYsIm5iZiI6MTc1MTk5Nzc3NiwicGF0aCI6Ii8xMDk0NzAxMy80NjM4MjI4NzItN2U4NDU1ZjctNDIzNy00YzlhLThmZTQtZWQyNWI3ODZiN2YzLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA3MDglMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNzA4VDE4MDI1NlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWM2MzU4MzRlY2Y2NzBiYzY5Njc5OTViMWI3NTc3NmIwNTk5ZDg1NDhiYTk5M2ZlODQwNjlmODc4NGNjOTZlOTUmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.YVgSH1Fj1Cia1uFqbtm4R16WwLWL04a6L_xxBfd0HP4"></td>
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
