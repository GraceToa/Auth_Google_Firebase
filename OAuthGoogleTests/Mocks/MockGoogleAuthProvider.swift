//
//  MockGoogleAuthProvider.swift
//  OAuthGoogleTests
//
//  Created by Grace Toa on 2/7/25.
//

import UIKit
@testable import OAuthGoogle

/// A mock implementation of `GoogleAuthProviderProtocol` for testing purposes.
/// Simulates Google Sign-In behavior without invoking the real SDK.
final class MockGoogleAuthProvider: GoogleAuthProviderProtocol {
    
    /// Determines whether the mock should simulate a successful or failed operation.
    var shouldSucceed: Bool = true
    
    /// Simulates Google login. Returns a mock user or throws `.loginFailed`.
    func login(from viewController: UIViewController) async throws -> AuthUser {
        if !shouldSucceed {
            throw AuthError.loginFailed
        }
        return AuthUser.mockAuthUser
    }
    
    /// Simulates session restoration. Returns a mock user or throws `.invalidSession`.
    func restoreSession() async throws -> AuthUser? {
        if !shouldSucceed {
            throw AuthError.invalidSession
        }
        return AuthUser.mockAuthUser
    }
    
    /// Simulates logout. Throws `.logoutFailed` if `shouldSucceed` is false.
    func logout() async throws {
        if !shouldSucceed {
            throw AuthError.logoutFailed
        }
    }
}
