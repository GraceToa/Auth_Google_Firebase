//
//  AuthProviderProtocol.swift
//  AuthGoogle
//
//  Created by Grace Toa on 22/6/25.
//

import UIKit

//MARK: - AuthProviderProtocol

///This is the protocol that any authentication provider (Google, Firebase, etc.) must implement.
///This allows you to inject GoogleAuthProvider or EmailAuthProvider, mocks, etc., without changing the ViewModel.
public protocol AuthProviderProtocol {
    func loginWithGoogle(from viewController: UIViewController) async throws -> AuthUser
    func loginWithFirebase(credentials: AuthCredentials?) async throws -> AuthUser
    func createUser(credentials: AuthCredentials) async throws
    func restoreSession() async throws -> AuthUser?
    func logout() async throws
}

public protocol FirebaseAuthProviderProtocol {
    func login(credentials: AuthCredentials?) async throws -> AuthUser
    func createUser(credentials: AuthCredentials) async throws
    func restoreSession() async throws -> AuthUser?
    func logout() async throws
}

public protocol GoogleAuthProviderProtocol {
    func login(from viewController: UIViewController) async throws -> AuthUser
    func restoreSession() async throws -> AuthUser?
    func logout() async throws
}
