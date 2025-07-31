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
        <td><img src="https://private-user-images.githubusercontent.com/10947013/463809984-647c689b-45d9-4a4a-aa68-edcd159eefc8.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTM5NjU0MDEsIm5iZiI6MTc1Mzk2NTEwMSwicGF0aCI6Ii8xMDk0NzAxMy80NjM4MDk5ODQtNjQ3YzY4OWItNDVkOS00YTRhLWFhNjgtZWRjZDE1OWVlZmM4LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA3MzElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNzMxVDEyMzE0MVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWI4ZWViNDljMDgwMjU1MmQ5MTExODc4YjYxNGM1ODVhNTdiNTQ3NWM2MGViZjg5YjMzODc2NDkxZjQ4NDk3MzImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.eLoH4XsgpO9w6tHDst3PlY-aH0a_CsWQC1-fpfu65PA" alt="Image" width="250"></td>
        <td><img alt="Image" width="250" src="https://private-user-images.githubusercontent.com/10947013/463817753-351f7782-80ae-4810-8e5b-a334f68fdfac.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTM5Njc0NjQsIm5iZiI6MTc1Mzk2NzE2NCwicGF0aCI6Ii8xMDk0NzAxMy80NjM4MTc3NTMtMzUxZjc3ODItODBhZS00ODEwLThlNWItYTMzNGY2OGZkZmFjLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA3MzElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNzMxVDEzMDYwNFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWRkMjZlMmUxMGI5NmYzMjc1ZmI5OGM4OWM3MTdmYmZhNTA3ZWYxOWFkMTMxOTNlOTA3YjFmODM1MzU1NWZhNzImWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.ulPouuH6e4pYcrBwEGjbhxNJtHfBoqTYtzLOvJ5mf94"></td>
        <td><img src="https://private-user-images.githubusercontent.com/10947013/463818566-ef48278e-015f-4120-ae39-6a9b08f15f0b.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTM5Njg4MTYsIm5iZiI6MTc1Mzk2ODUxNiwicGF0aCI6Ii8xMDk0NzAxMy80NjM4MTg1NjYtZWY0ODI3OGUtMDE1Zi00MTIwLWFlMzktNmE5YjA4ZjE1ZjBiLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA3MzElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNzMxVDEzMjgzNlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTczMjQxNzM0OWY0YTE1MGE3MDYyMjk4ZWM3MWJkNDRkZWZlMWNlZTQ3OTEzMTI4NTQ2MTU1NTYxNTRhNzdmZjQmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.qChamfiGs2czBFfcTO414YJBUeIaEOq9gEplG_e5aGk" width="50" ></td>
    </tr>
    <tr>
        <td><img alt="Image" width="250" src="https://private-user-images.githubusercontent.com/10947013/463821107-bb38c275-be17-403f-930c-cbbbf6dd04e2.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTM5Njg0NzEsIm5iZiI6MTc1Mzk2ODE3MSwicGF0aCI6Ii8xMDk0NzAxMy80NjM4MjExMDctYmIzOGMyNzUtYmUxNy00MDNmLTkzMGMtY2JiYmY2ZGQwNGUyLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA3MzElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNzMxVDEzMjI1MVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTJkZDU2NjJlMmFiYjJlZmFkNzQxY2NiYmRjMWJmZGRjYmFmZWRkYjkzNTgwOWFlOGNkYjdhM2VjOThlM2I3OGEmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.md1A9lCUZFxDlFy5nQo4d5qLtPTsa0vkL7XudtfMHtQ"></td>
        <td> <img alt="Image" width="250" src="https://private-user-images.githubusercontent.com/10947013/463821742-08cbecbc-562a-4ddf-9fe5-d4da057f626d.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTM5Njg2NzQsIm5iZiI6MTc1Mzk2ODM3NCwicGF0aCI6Ii8xMDk0NzAxMy80NjM4MjE3NDItMDhjYmVjYmMtNTYyYS00ZGRmLTlmZTUtZDRkYTA1N2Y2MjZkLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA3MzElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNzMxVDEzMjYxNFomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWE2NDgyMmIxNzZkODlmOWZkMTZmZGNlNzIwMzMxYjFlNWI4OGQ1ZGYyN2YwMmE0ZTg2ZjRjY2Q1MjE1OWQ5ZjUmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.39UkUMEdq2dyovflqoLwwVik7nFYf1Szdv9CpBq1OUw"></td>     
        <td><img alt="Image" width="250" src="https://private-user-images.githubusercontent.com/10947013/463822066-14d0dcf5-738e-4ed6-b1fb-6acb8b0ad7bf.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTM5Njg3MDIsIm5iZiI6MTc1Mzk2ODQwMiwicGF0aCI6Ii8xMDk0NzAxMy80NjM4MjIwNjYtMTRkMGRjZjUtNzM4ZS00ZWQ2LWIxZmItNmFjYjhiMGFkN2JmLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA3MzElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNzMxVDEzMjY0MlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWY2NWJkYTBlMTM1NTI2NmNjNmIyZGUxMGNkNjliM2NlY2MyZGFmNzE4MWYyYzhlMjNiYTIxYjAyZGJjODNhNzEmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.gokbAHYHc9TXtIKme_LDyKHxKsDc0tus8_tL5dalR78"></td>
    </tr>
    <tr>
        <td><img alt="Image" width="250" src="https://private-user-images.githubusercontent.com/10947013/463822391-4af3fdfa-8b1f-49f1-9a3d-c6bb869098f5.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTM5Njg3MzEsIm5iZiI6MTc1Mzk2ODQzMSwicGF0aCI6Ii8xMDk0NzAxMy80NjM4MjIzOTEtNGFmM2ZkZmEtOGIxZi00OWYxLTlhM2QtYzZiYjg2OTA5OGY1LnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA3MzElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNzMxVDEzMjcxMVomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPWRjYmI0NTQ2YTY1ODdlOTAzOTE3OGZmYmRhODc4YTcwOWQzMjI3NDk5YzYzMmQ4NGIxMDE3NmRkOGJjZjVkNTgmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.Q9UxG5pNXpIR4qggpt8HoDwACRwRAn6OkoajDRd67tU"></td>
        <td> <img alt="Image" width="250" src="https://private-user-images.githubusercontent.com/10947013/463822872-7e8455f7-4237-4c9a-8fe4-ed25b786b7f3.png?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NTM5Njg3NjYsIm5iZiI6MTc1Mzk2ODQ2NiwicGF0aCI6Ii8xMDk0NzAxMy80NjM4MjI4NzItN2U4NDU1ZjctNDIzNy00YzlhLThmZTQtZWQyNWI3ODZiN2YzLnBuZz9YLUFtei1BbGdvcml0aG09QVdTNC1ITUFDLVNIQTI1NiZYLUFtei1DcmVkZW50aWFsPUFLSUFWQ09EWUxTQTUzUFFLNFpBJTJGMjAyNTA3MzElMkZ1cy1lYXN0LTElMkZzMyUyRmF3czRfcmVxdWVzdCZYLUFtei1EYXRlPTIwMjUwNzMxVDEzMjc0NlomWC1BbXotRXhwaXJlcz0zMDAmWC1BbXotU2lnbmF0dXJlPTVjZjU4Yzg2ZjVhMmU5YWQ3ZTViODI3OTA1MWVhMTM2MzY1NDQ4MWZiY2Q3ZDFhOWQzN2VmMDgxOGIyN2U3ZDgmWC1BbXotU2lnbmVkSGVhZGVycz1ob3N0In0.Aad4-hn7vCVySVOKCEmnyvCy5r-vNVoyaA2ZmdvNLBM"></td>
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
