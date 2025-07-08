//
//  AuthViewModel.swift
//  AuthGoogle
//
//  Created by Grace Toa on 23/6/25.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn

/// AuthViewModel manages the authentication state of the app.
/// It handles login, signup, session restoration, and logout logic,
/// and exposes the current `AuthUser` and status flags to the UI.
@MainActor
public final class AuthViewModel: ObservableObject {
    
    @Published public private(set) var user: AuthUser?
    @Published public var isLoading: Bool = false
    @Published public var error: String?
    @Published public var isRestoringSession: Bool = true
    
    private let authProvider: AuthProviderProtocol
    
    /// Creates a new instance of AuthViewModel with the given provider.
    /// - Parameter authProvider: An implementation of `AuthProviderProtocol`
    init(authProvider: AuthProviderProtocol) {
        self.authProvider = authProvider
    }
    
    //MARK: - Google Sign-In
    
    /// Logs in the user using Google Sign-In.
    /// - Parameter from: The presenting view controller.
    public func loginWithGoogle(from viewController: UIViewController) async {
        isLoading = true
        do {
            user = try await authProvider.loginWithGoogle(from: viewController)
        }catch {
            self.error = error.localizedDescription
            self.user = nil
        }
        isLoading = false
    }
    
    // MARK: - Firebase Email/Password
    /// Logs in the user with Firebase using email and password.
    public func loginWithFirebase(email: String, password: String) async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let credentials = AuthCredentials(email: email, password: password)
            user = try await authProvider.loginWithFirebase(credentials: credentials)
            error = nil
        } catch {
            if let nsError = error as NSError? {
                switch AuthErrorCode(rawValue: nsError.code) {
                case .userNotFound:
                    self.error = "not-registered"
                case .wrongPassword:
                    self.error = "Incorrect password."
                case .invalidEmail:
                    self.error = "The email is not valid."
                case .networkError:
                    self.error = "Network problem. Check your connection."
                default:
                    self.error = nsError.localizedDescription
                }
            } else {
                self.error = error.localizedDescription
            }
            self.user = nil
        }
    }
    
    /// Creates a new Firebase user and logs them in.
    public func signUpWithFirebase(email: String, password: String) async throws {
        do {
            try await authProvider.createUser(credentials: AuthCredentials(email: email, password: password))
            user = try await authProvider.loginWithFirebase(
                credentials: AuthCredentials(email: email, password: password)
            )
        } catch {
            if let nsError = error as NSError? {
                switch AuthErrorCode(rawValue: nsError.code) {
                case .emailAlreadyInUse:
                    self.error = "This email is already registered."
                case .invalidEmail:
                    self.error = "The email is not valid."
                case .weakPassword:
                    self.error = "The password is too weak (minimum 6 characters)."
                case .networkError:
                    self.error = "Network problem. Check your connection."
                default:
                    self.error = nsError.localizedDescription
                }
            } else {
                self.error = error.localizedDescription
            }
        }
    }
    
    // MARK: - Session Management
    /// Attempts to restore a previously authenticated session.
    public func restoreSession() async {
        self.isRestoringSession = true
        defer { isRestoringSession = false }
        
        do {
            self.user = try await authProvider.restoreSession()
        }catch {
            self.error = error.localizedDescription
            self.user = nil
        }
    }
    
    /// Logs the current user out.
    public func logout() async {
        self.error = nil
        do {
            try await authProvider.logout()
            user = nil
        } catch {
            self.error = error.localizedDescription
        }
    }
    
#if DEBUG
    public func simulateLogin(_ user: AuthUser) {
        self.user = user
    }
#endif
}
