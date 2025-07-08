//
//  MockFirebaseAuthProvider.swift
//  OAuthGoogle
//
//  Created by Grace Toa on 2/7/25.
//

import SwiftUI
@testable import OAuthGoogle

/// A mock implementation of `FirebaseAuthProviderProtocol` for unit testing.
/// Allows simulating success or failure of auth operations without calling Firebase.
final class MockFirebaseAuthProvider: FirebaseAuthProviderProtocol {
    
    /// The mock user returned when `createUser` is called.
    var createUser: AuthUser?
    /// Determines whether the mock should simulate a successful operation.
    var shouldSucceed: Bool = true
    
    /// Simulates user login. Returns a mock user or throws `.loginFailed`.
    func login(credentials: AuthCredentials?) async throws -> AuthUser {
        
        if !shouldSucceed {
            throw AuthError.loginFailed
        }
        return AuthUser.mockAuthUser
    }
    
    /// Simulates user creation. Saves a mock user or throws `.userNotFound`.
    func createUser(credentials: AuthCredentials) async throws {
        
        if !shouldSucceed {
            throw AuthError.userNotFound
        }
        createUser = AuthUser.mockAuthUser
    }
    
    /// Simulates session restoration. Returns a mock user or throws `.invalidSession`.
    func restoreSession() async throws -> AuthUser? {
        
        if !shouldSucceed {
            throw AuthError.invalidSession
        }
        return  AuthUser.mockAuthUser
    }
    
    /// Simulates logout. Throws `.logoutFailed` if `shouldSucceed` is false.
    func logout() async throws {
        if !shouldSucceed {
            throw AuthError.logoutFailed
        }
    }
}
