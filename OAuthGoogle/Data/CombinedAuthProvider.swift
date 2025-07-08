//
//  CombinedAuthProvider.swift
//  OAuthGoogle
//
//  Created by Grace Toa on 1/7/25.
//

import UIKit

/// A unified authentication provider that delegates auth operations
/// to both Firebase and Google sign-in providers.
///
/// This class conforms to `AuthProviderProtocol` and internally uses:
/// - `FirebaseAuthProviderProtocol` for email/password authentication
/// - `GoogleAuthProviderProtocol` for Google Sign-In
///
/// Useful for view models or consumers that want a single entry point
/// to handle multiple authentication strategies.
public final class CombinedAuthProvider: AuthProviderProtocol {
    
    
    private let firebaseProvider: FirebaseAuthProviderProtocol
    private let googleProvider: GoogleAuthProviderProtocol
    
    public init(firebaseProvider: FirebaseAuthProviderProtocol, googleProvider: GoogleAuthProviderProtocol) {
        self.firebaseProvider = firebaseProvider
        self.googleProvider = googleProvider
    }
    
    // MARK: - Google Sign-In
    public func loginWithGoogle(from viewController: UIViewController) async throws -> AuthUser {
        try await googleProvider.login(from: viewController)
    }
    
    // MARK: - Firebase Email/Password
    public func loginWithFirebase(credentials: AuthCredentials?) async throws -> AuthUser {
        try await firebaseProvider.login(credentials: credentials)
    }
    
    public func createUser(credentials: AuthCredentials) async throws {
        try await firebaseProvider.createUser(credentials: credentials)
    }
    
    public func restoreSession() async throws -> AuthUser? {
        if let user = try await firebaseProvider.restoreSession() {
            return user
        }
        
        if let user = try await googleProvider.restoreSession() {
            return user
        }
        
        return nil
    }
    
    // MARK: - Logout
    public func logout() async throws {
        try await firebaseProvider.logout()
        try await googleProvider.logout()
    }
}

